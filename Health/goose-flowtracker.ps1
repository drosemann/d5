# Goose Desktop Companion - Desktop Flow Tracker
# Track workflow patterns, detect flow states, provide insights

$LoggingScriptPath = Join-Path $PSScriptRoot "..\Core\GooseLogging.ps1"
if (Test-Path $LoggingScriptPath) {
    . $LoggingScriptPath
}

class AppUsage {
    [string]$AppName
    [string]$WindowTitle
    [datetime]$StartTime
    [datetime]$EndTime
    [int]$DurationSeconds
    [string]$Category

    AppUsage([string]$appName, [string]$windowTitle) {
        $this.AppName = $appName
        $this.WindowTitle = $windowTitle
        $this.StartTime = Get-Date
        $this.EndTime = $this.StartTime
        $this.DurationSeconds = 0
        $this.Category = "Other"
    }
}

class FlowSession {
    [string]$Id
    [datetime]$StartTime
    [datetime]$EndTime
    [int]$DurationMinutes
    [string]$TriggerApp
    [array]$AppsUsed
    [bool]$WasInterrupted
    [int]$Interruptions

    FlowSession([string]$triggerApp) {
        $this.Id = [guid]::NewGuid().ToString()
        $this.StartTime = Get-Date
        $this.EndTime = $this.StartTime
        $this.DurationMinutes = 0
        $this.TriggerApp = $triggerApp
        $this.AppsUsed = @()
        $this.WasInterrupted = $false
        $this.Interruptions = 0
    }
}

class GooseFlowTracker {
    [hashtable]$Config
    [string]$DataFile
    [hashtable]$DailyStats
    [bool]$IsEnabled
    [int]$PollIntervalSeconds
    [string]$CurrentApp
    [datetime]$CurrentAppStart
    [int]$AppSwitchCount
    [bool]$InFlowState
    [FlowSession]$CurrentSession
    [datetime]$LastPollTime
    [array]$ProductivityApps
    [array]$DistractionApps
    [array]$NeutralApps

    GooseFlowTracker() {
        $this.Config = $this.LoadConfig()
        $this.DataFile = "goose_flowtracker.json"
        $this.DailyStats = @{}
        $this.CurrentApp = ""
        $this.CurrentAppStart = Get-Date
        $this.AppSwitchCount = 0
        $this.InFlowState = $false
        $this.CurrentSession = $null
        $this.LastPollTime = Get-Date
        $this.LoadData()
    }

    [hashtable] LoadConfig() {
        $this.Config = @{}
        $configFile = "config.ini"

        if (Test-Path $configFile) {
            Get-Content $configFile | ForEach-Object {
                if ($_ -match '^([^=]+)=(.*)$') {
                    $key = $matches[1].Trim()
                    $value = $matches[2].Trim()

                    if ($value -eq 'True' -or $value -eq 'False') {
                        $this.Config[$key] = [bool]$value
                    } elseif ($value -match '^\d+$') {
                        $this.Config[$key] = [int]$value
                    } elseif ($value -match '^\d+\.\d+$') {
                        $this.Config[$key] = [double]$value
                    } else {
                        $this.Config[$key] = $value
                    }
                }
            }
        }

        if (-not $this.Config.ContainsKey("FlowTrackerEnabled")) {
            $this.Config["FlowTrackerEnabled"] = $false
        }
        if (-not $this.Config.ContainsKey("FlowTrackerPollIntervalSeconds")) {
            $this.Config["FlowTrackerPollIntervalSeconds"] = 30
        }
        if (-not $this.Config.ContainsKey("FlowTrackerFocusThresholdMinutes")) {
            $this.Config["FlowTrackerFocusThresholdMinutes"] = 15
        }
        if (-not $this.Config.ContainsKey("FlowTrackerProductivityApps")) {
            $this.Config["FlowTrackerProductivityApps"] = "code,visualstudio,terminal,powershell,idea,notion,obsidian"
        }
        if (-not $this.Config.ContainsKey("FlowTrackerDistractionApps")) {
            $this.Config["FlowTrackerDistractionApps"] = "twitter,facebook,youtube,reddit,tiktok,instagram"
        }
        if (-not $this.Config.ContainsKey("FlowTrackerTrackDaily")) {
            $this.Config["FlowTrackerTrackDaily"] = $true
        }
        if (-not $this.Config.ContainsKey("FlowTrackerShowInsights")) {
            $this.Config["FlowTrackerShowInsights"] = $true
        }

        $this.IsEnabled = $this.Config["FlowTrackerEnabled"]
        $this.PollIntervalSeconds = $this.Config["FlowTrackerPollIntervalSeconds"]

        $prodApps = $this.Config["FlowTrackerProductivityApps"] -split ","
        $this.ProductivityApps = $prodApps | ForEach-Object { $_.Trim().ToLower() }

        $distApps = $this.Config["FlowTrackerDistractionApps"] -split ","
        $this.DistractionApps = $distApps | ForEach-Object { $_.Trim().ToLower() }

        $allApps = $this.ProductivityApps + $this.DistractionApps
        $this.NeutralApps = @("chrome", "firefox", "edge", "safari", "explorer", "outlook", "slack", "teams")

        return $this.Config
    }

    [void] LoadData() {
        if (Test-Path $this.DataFile) {
            try {
                $data = Get-Content $this.DataFile -Raw | ConvertFrom-Json
                $this.DailyStats = @{}

                if ($data.dailyStats) {
                    $data.dailyStats.PSObject.Properties | ForEach-Object {
                        $this.DailyStats[$_.Name] = $_.Value
                    }
                }
            } catch {
                Write-LogError -Message "Failed to load flow tracker data: $_" -Source "FlowTracker"
            }
        }
    }

    [void] SaveData() {
        $data = @{
            dailyStats = $this.DailyStats
            lastSaved = (Get-Date).ToString("o")
        }

        $data | ConvertTo-Json -Depth 10 | Set-Content $this.DataFile
    }

    [string] GetTodayKey() {
        return (Get-Date).ToString("yyyy-MM-dd")
    }

    [void] InitializeTodayStats() {
        $key = $this.GetTodayKey()

        if (-not $this.DailyStats.ContainsKey($key)) {
            $this.DailyStats[$key] = @{
                date = $key
                productiveMinutes = 0
                distractionMinutes = 0
                neutralMinutes = 0
                appSwitches = 0
                flowSessions = 0
                flowMinutes = 0
                interruptions = 0
                topApps = @()
                productivityScore = 50
            }
        }
    }

    [string] GetActiveWindow() {
        Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Text;

public class ActiveWindow {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();

    [DllImport("user32.dll")]
    public static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int count);

    [DllImport("user32.dll")]
    public static extern IntPtr GetWindowThreadProcessId(IntPtr hWnd, out uint processId);

    public static string[] Get() {
        IntPtr hWnd = GetForegroundWindow();
        if (hWnd == IntPtr.Zero) return new string[] { "", "" };

        int length = GetWindowText(hWnd, null, 0);
        if (length == 0) return new string[] { "", "" };

        StringBuilder sb = new StringBuilder(length);
        GetWindowText(hWnd, sb, sb.Capacity);
        string title = sb.ToString();

        uint processId;
        GetWindowThreadProcessId(hWnd, out processId);

        string processName = "";
        try {
            var proc = System.Diagnostics.Process.GetProcessById((int)processId);
            processName = proc.ProcessName;
        } catch {}

        return new string[] { processName, title };
    }
}
"@
        $result = [ActiveWindow]::Get()
        return @($result[0], $result[1])
    }

    [string] CategorizeApp([string]$appName) {
        $appLower = $appName.ToLower()

        foreach ($prod in $this.ProductivityApps) {
            if ($appLower -like "*$prod*") {
                return "Productive"
            }
        }

        foreach ($dist in $this.DistractionApps) {
            if ($appLower -like "*$dist*") {
                return "Distraction"
            }
        }

        return "Neutral"
    }

    [void] RecordAppUsage([string]$appName, [string]$title, [int]$durationSeconds) {
        $this.InitializeTodayStats()

        $key = $this.GetTodayKey()
        $category = $this.CategorizeApp($appName)

        switch ($category) {
            "Productive" { $this.DailyStats[$key].productiveMinutes += [int]($durationSeconds / 60) }
            "Distraction" { $this.DailyStats[$key].distractionMinutes += [int]($durationSeconds / 60) }
            "Neutral" { $this.DailyStats[$key].neutralMinutes += [int]($durationSeconds / 60) }
        }

        $this.DailyStats[$key].appSwitches += 1
    }

    [void] StartFlowSession([string]$triggerApp) {
        if ($this.InFlowState) { return }

        $this.InFlowState = $true
        $this.CurrentSession = [FlowSession]::new($triggerApp)

        Write-LogInfo -Message "Flow session started: $triggerApp" -Source "FlowTracker"
    }

    [void] EndFlowSession([bool]$interrupted = $false) {
        if (-not $this.InFlowState -or $null -eq $this.CurrentSession) { return }

        $this.CurrentSession.EndTime = Get-Date
        $this.CurrentSession.DurationMinutes = [int]($this.CurrentSession.EndTime - $this.CurrentSession.StartTime).TotalMinutes
        $this.CurrentSession.WasInterrupted = $interrupted

        $threshold = $this.Config["FlowTrackerFocusThresholdMinutes"]

        if ($this.CurrentSession.DurationMinutes -ge $threshold) {
            $this.InitializeTodayStats()
            $key = $this.GetTodayKey()

            $this.DailyStats[$key].flowSessions++
            $this.DailyStats[$key].flowMinutes += $this.CurrentSession.DurationMinutes

            if ($interrupted) {
                $this.DailyStats[$key].interruptions += $this.CurrentSession.Interruptions
            }

            Write-LogInfo -Message "Flow session ended: $($this.CurrentSession.DurationMinutes) min, interrupted: $interrupted" -Source "FlowTracker"
        }

        $this.InFlowState = $false
        $this.CurrentSession = $null
    }

    [void] RecordInterruption() {
        if ($this.InFlowState -and $null -ne $this.CurrentSession) {
            $this.CurrentSession.Interruptions++
            $this.CurrentSession.WasInterrupted = $true
        }

        if ($this.InFlowState -and $this.CurrentSession.Interruptions -ge 3) {
            $this.EndFlowSession($true)
        }
    }

    [void] Poll() {
        if (-not $this.IsEnabled) { return }

        $now = Get-Date
        $elapsed = ($now - $this.LastPollTime).TotalSeconds

        if ($elapsed -lt $this.PollIntervalSeconds) { return }

        $windowInfo = $this.GetActiveWindow()
        $appName = $windowInfo[0]
        $title = $windowInfo[1]

        if ([string]::IsNullOrEmpty($appName)) {
            $this.LastPollTime = $now
            return
        }

        if ($appName -ne $this.CurrentApp -and $this.CurrentApp -ne "") {
            $duration = [int]($now - $this.CurrentAppStart).TotalSeconds
            $this.RecordAppUsage($this.CurrentApp, $this.CurrentAppStart.ToString(), $duration)

            $oldCategory = $this.CategorizeApp($this.CurrentApp)
            $newCategory = $this.CategorizeApp($appName)

            if ($this.InFlowState -and $newCategory -eq "Distraction") {
                $this.RecordInterruption()
            }

            if (-not $this.InFlowState -and $newCategory -eq "Productive") {
                $threshold = $this.Config["FlowTrackerFocusThresholdMinutes"] * 60
                if ($duration -ge $threshold) {
                    $this.StartFlowSession($appName)
                }
            }
        }

        $this.CurrentApp = $appName
        $this.CurrentAppStart = $now
        $this.LastPollTime = $now
    }

    [hashtable] GetTodayStats() {
        $this.InitializeTodayStats()
        $key = $this.GetTodayKey()
        $stats = $this.DailyStats[$key]

        $totalMinutes = $stats.productiveMinutes + $stats.distractionMinutes + $stats.neutralMinutes
        if ($totalMinutes -gt 0) {
            $stats.productivityScore = [int](($stats.productiveMinutes / $totalMinutes) * 100)
        }

        return $stats
    }

    [hashtable] GetWeeklyPattern() {
        $weekData = @()
        $startDate = (Get-Date).AddDays(-6)

        for ($i = 0; $i -le 6; $i++) {
            $date = $startDate.AddDays($i)
            $key = $date.ToString("yyyy-MM-dd")

            if ($this.DailyStats.ContainsKey($key)) {
                $weekData += $this.DailyStats[$key]
            } else {
                $weekData += @{
                    date = $key
                    productiveMinutes = 0
                    distractionMinutes = 0
                    neutralMinutes = 0
                    flowSessions = 0
                    productivityScore = 0
                }
            }
        }

        return @{
            days = $weekData
            totalProductiveMinutes = ($weekData | Measure-Object -Property productiveMinutes -Sum).Sum
            totalFlowMinutes = ($weekData | Measure-Object -Property flowMinutes -Sum).Sum
            totalFlowSessions = ($weekData | Measure-Object -Property flowSessions -Sum).Sum
            averageProductivity = [math]::Round(($weekData | Measure-Object -Property productivityScore -Average).Average, 1)
        }
    }

    [array] GetInsights() {
        $insights = @()
        $today = $this.GetTodayStats()
        $week = $this.GetWeeklyPattern()

        if ($today.flowSessions -gt 0) {
            $insights += "You had $($today.flowSessions) flow session(s) today!"
        }

        if ($today.productivityScore -ge 70) {
            $insights += "Great productivity score today: $($today.productivityScore)%"
        } elseif ($today.productivityScore -lt 40) {
            $insights += "Low productivity today ($($today.productivityScore)%). Try to minimize distractions."
        }

        if ($today.distractionMinutes -gt 60) {
            $insights += "You spent $($today.distractionMinutes) minutes on distractions today."
        }

        $hourlyScores = @{}
        $morningProductive = 0
        $afternoonProductive = 0

        if ($week.averageProductivity -gt 60) {
            $insights += "Great week overall! Average productivity: $($week.averageProductivity)%"
        }

        if ($today.appSwitches -gt 50) {
            $insights += "High context switching today ($($today.appSwitches) app changes). Try staying focused!"
        }

        return $insights
    }

    [int] GetProductivityScore() {
        return $this.GetTodayStats().productivityScore
    }

    [hashtable] GetFlowState() {
        return @{
            inFlow = $this.InFlowState
            currentApp = $this.CurrentApp
            currentCategory = $this.CategorizeApp($this.CurrentApp)
            sessionDuration = if ($this.CurrentSession) { $this.CurrentSession.DurationMinutes } else { 0 }
            interruptions = if ($this.CurrentSession) { $this.CurrentSession.Interruptions } else { 0 }
        }
    }

    [hashtable] GetStats() {
        $today = $this.GetTodayStats()
        $week = $this.GetWeeklyPattern()

        return @{
            today = $today
            week = $week
            insights = $this.GetInsights()
            currentState = $this.GetFlowState()
        }
    }
}

$gooseFlowTracker = [GooseFlowTracker]::new()

function Get-FlowTracker {
    return $gooseFlowTracker
}

function Get-TodayFlowStats {
    return $gooseFlowTracker.GetTodayStats()
}

function Get-WeeklyFlowPattern {
    return $gooseFlowTracker.GetWeeklyPattern()
}

function Get-FlowInsights {
    return $gooseFlowTracker.GetInsights()
}

function Get-FlowProductivityScore {
    return $gooseFlowTracker.GetProductivityScore()
}

function Get-FlowState {
    return $gooseFlowTracker.GetFlowState()
}

function Start-FlowSession {
    param([string]$TriggerApp = "Manual")
    $gooseFlowTracker.StartFlowSession($TriggerApp)
}

function Stop-FlowSession {
    param([switch]$Interrupted)
    $gooseFlowTracker.EndFlowSession($Interrupted)
}

function Get-FlowTrackerStats {
    return $gooseFlowTracker.GetStats()
}

Write-LogInfo -Message "Goose Flow Tracker Initialized" -Source "FlowTracker"
Write-Host "Goose Flow Tracker Loaded - Enabled: $($gooseFlowTracker.IsEnabled)"
