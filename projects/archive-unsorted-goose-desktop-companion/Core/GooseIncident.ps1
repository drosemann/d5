class GooseIncidentConfig {
    static [hashtable] Load([string]$configFile = "config.ini") {
        $config = @{
            IncidentEnabled = $false
            IncidentApiKey = ""
            IncidentTeamId = ""
            IncidentAutoCreate = $true
            IncidentSeverityThreshold = "warning"
            IncidentNotifyChannels = "teams"
            IncidentDiscordWebhook = ""
            IncidentTeamsWebhook = ""
            IncidentMonitorInterval = 60
            IncidentDBCheckEnabled = $true
        }
        
        if (Test-Path $configFile) {
            Get-Content $configFile | ForEach-Object {
                if ($_ -match '^([^=]+)=(.*)$') {
                    $key = $matches[1].Trim()
                    $value = $matches[2].Trim()
                    if ($config.ContainsKey($key)) {
                        if ($value -eq 'True' -or $value -eq 'False') {
                            $config[$key] = [bool]$value
                        } else {
                            $config[$key] = $value
                        }
                    }
                }
            }
        }
        return $config
    }
}

enum IncidentSeverity {
    critical
    high
    medium
    low
    warning
}

class GooseIncident {
    static [string]$ApiBaseUrl = "https://api.incident.io/v1"
    
    [hashtable]$Config
    [System.Timers.Timer]$MonitorTimer
    [bool]$IsMonitoring
    
    GooseIncident([string]$configFile = "config.ini") {
        $this.Config = GooseIncidentConfig::Load($configFile)
        $this.IsMonitoring = $false
    }
    
    [hashtable] GetHeaders() {
        return @{
            "Authorization" = "Bearer $($this.Config['IncidentApiKey'])"
            "Content-Type" = "application/json"
            "Accept" = "application/json"
        }
    }
    
    [PSCustomObject] CreateIncident(
        [string]$Title,
        [string]$Description,
        [string]$Severity = "warning",
        [string]$IncidentType = "incident"
    ) {
        if (-not $this.Config["IncidentEnabled"] -or -not $this.Config["IncidentApiKey"]) {
            return @{ Success = $false; Error = "Incident.io not configured" }
        }
        
        try {
            $url = "$([GooseIncident]::ApiBaseUrl)/incidents"
            
            $body = @{
                title = $Title
                description = $Description
                severity_id = $Severity
                incident_type = $IncidentType
            } | ConvertTo-Json
            
            $response = Invoke-RestMethod -Uri $url -Method Post -Headers $this.GetHeaders() -Body $body -ErrorAction Stop
            
            $incidentId = $response.incident.id
            
            if ($this.Config["IncidentNotifyChannels"]) {
                $this.SendNotification($Title, $Description, $Severity, $incidentId)
            }
            
            return @{ Success = $true; IncidentId = $incidentId; Incident = $response.incident }
        }
        catch {
            return @{ Success = $false; Error = $_.Exception.Message }
        }
    }
    
    [PSCustomObject] GetIncidents([int]$Limit = 20) {
        if (-not $this.Config["IncidentEnabled"]) {
            return @{ Success = $false; Error = "Incident.io not enabled" }
        }
        
        try {
            $url = "$([GooseIncident]::ApiBaseUrl)/incidents?limit=$Limit"
            $response = Invoke-RestMethod -Uri $url -Method Get -Headers $this.GetHeaders() -ErrorAction Stop
            return @{ Success = $true; Incidents = $response.incidents }
        }
        catch {
            return @{ Success = $false; Error = $_.Exception.Message }
        }
    }
    
    [PSCustomObject] GetIncident([string]$IncidentId) {
        if (-not $this.Config["IncidentEnabled"]) {
            return @{ Success = $false; Error = "Incident.io not enabled" }
        }
        
        try {
            $url = "$([GooseIncident]::ApiBaseUrl)/incidents/$IncidentId"
            $response = Invoke-RestMethod -Uri $url -Method Get -Headers $this.GetHeaders() -ErrorAction Stop
            return @{ Success = $true; Incident = $response }
        }
        catch {
            return @{ Success = $false; Error = $_.Exception.Message }
        }
    }
    
    [PSCustomObject] UpdateIncidentStatus(
        [string]$IncidentId,
        [string]$Status
    ) {
        if (-not $this.Config["IncidentEnabled"]) {
            return @{ Success = $false; Error = "Incident.io not enabled" }
        }
        
        try {
            $url = "$([GooseIncident]::ApiBaseUrl)/incidents/$IncidentId/status"
            
            $body = @{
                status = $Status
            } | ConvertTo-Json
            
            $response = Invoke-RestMethod -Uri $url -Method Patch -Headers $this.GetHeaders() -Body $body -ErrorAction Stop
            return @{ Success = $true }
        }
        catch {
            return @{ Success = $false; Error = $_.Exception.Message }
        }
    }
    
    [void] SendNotification([string]$Title, [string]$Description, [string]$Severity, [string]$IncidentId) {
        $channels = ($this.Config["IncidentNotifyChannels"] -split ",").Trim()
        
        foreach ($channel in $channels) {
            switch ($channel.ToLower()) {
                "teams" {
                    $this.SendTeamsNotification($Title, $Description, $Severity, $IncidentId)
                }
                "discord" {
                    $this.SendDiscordNotification($Title, $Description, $Severity, $IncidentId)
                }
            }
        }
    }
    
    [void] SendTeamsNotification([string]$Title, [string]$Description, [string]$Severity, [string]$IncidentId) {
        $webhookUrl = $this.Config["IncidentTeamsWebhook"]
        if (-not $webhookUrl) {
            return
        }
        
        $severityEmoji = switch ($Severity) {
            "critical" { "🔴" }
            "high" { "🟠" }
            "medium" { "🟡" }
            "low" { "🔵" }
            default { "⚪" }
        }
        
        $body = @{
            "@type" = "MessageCard"
            "@context" = "http://schema.org/extensions"
            "themeColor" = "FF0000"
            "summary" = $Title
            "sections" = @(
                @{
                    "activityTitle" = "$severityEmoji New Incident: $Title"
                    "facts" = @(
                        @{ name = "Severity"; value = $Severity },
                        @{ name = "ID"; value = $IncidentId },
                        @{ name = "Source"; value = "Goose Desktop Companion" }
                    )
                    "markdown" = $true
                }
            )
            "potentialAction" = @(
                @{
                    "@type" = "OpenUri"
                    "name" = "View in incident.io"
                    "targets" = @(
                        @{ os = "default"; uri = "https://app.incident.io/incidents/$IncidentId" }
                    )
                }
            )
        } | ConvertTo-Json -Depth 3
        
        try {
            Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType "application/json" -ErrorAction SilentlyContinue | Out-Null
        }
        catch {
        }
    }
    
    [void] SendDiscordNotification([string]$Title, [string]$Description, [string]$Severity, [string]$IncidentId) {
        $webhookUrl = $this.Config["IncidentDiscordWebhook"]
        if (-not $webhookUrl) {
            return
        }
        
        $color = switch ($Severity) {
            "critical" { 16711680 }
            "high" { 16744448 }
            "medium" { 16776960 }
            "low" { 65280 }
            default { 8421504 }
        }
        
        $body = @{
            embeds = @(
                @{
                    title = "🚨 New Incident: $Title"
                    color = $color
                    description = $Description
                    fields = @(
                        @{ name = "Severity"; value = $Severity; inline = $true },
                        @{ name = "ID"; value = $IncidentId; inline = $true },
                        @{ name = "Source"; value = "Goose Desktop Companion"; inline = $true }
                    )
                    url = "https://app.incident.io/incidents/$IncidentId"
                    timestamp = (Get-Date).ToUniversalTime().ToString("o")
                }
            )
        } | ConvertTo-Json -Depth 3
        
        try {
            Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $body -ContentType "application/json" -ErrorAction SilentlyContinue | Out-Null
        }
        catch {
        }
    }
    
    [bool] ShouldCreateIncident([string]$ErrorType) {
        $threshold = $this.Config["IncidentSeverityThreshold"]
        
        $severityOrder = @("critical", "high", "medium", "low", "warning")
        $errorSeverity = switch -Regex ($ErrorType) {
            "404|not found" { "warning" }
            "500|internal|exception|crash" { "critical" }
            "403|forbidden|unauthorized" { "medium" }
            "timeout|timeout" { "high" }
            "connection|refused" { "high" }
            default { "low" }
        }
        
        $thresholdIndex = $severityOrder.IndexOf($threshold)
        $errorIndex = $severityOrder.IndexOf($errorSeverity)
        
        return $errorIndex -le $thresholdIndex
    }
    
    [PSCustomObject] MonitorDBCrashes() {
        if (-not $this.Config["IncidentDBCheckEnabled"]) {
            return @{ Success = $true; Checked = $false }
        }
        
        $logPath = "logs/goose.log"
        if (-not (Test-Path $logPath)) {
            return @{ Success = $true; Checked = $false; Reason = "No log file" }
        }
        
        $recentErrors = @()
        
        try {
            $logContent = Get-Content $logPath -Tail 100 -ErrorAction SilentlyContinue
            if (-not $logContent) {
                return @{ Success = $true; Checked = $false }
            }
            
            $errorPatterns = @(
                "404",
                "500",
                "Exception",
                "Crash",
                "timeout",
                "connection refused",
                "unauthorized",
                "Supabase.*error"
            )
            
            foreach ($line in $logContent) {
                foreach ($pattern in $errorPatterns) {
                    if ($line -match $pattern) {
                        if ($this.ShouldCreateIncident($pattern)) {
                            $recentErrors += $line
                        }
                    }
                }
            }
            
            if ($recentErrors.Count -gt 0) {
                $errorSummary = $recentErrors | Select-Object -First 5
                $title = "Database Error Detected - $($ErrorPatterns[0])"
                $description = "Error count: $($recentErrors.Count)`n`nErrors:`n$($errorSummary -join "`n")"
                
                $severity = "warning"
                if ($recentErrors -match "Exception|Crash|500") {
                    $severity = "critical"
                }
                elseif ($recentErrors -match "timeout|connection") {
                    $severity = "high"
                }
                
                return $this.CreateIncident($title, $description, $severity)
            }
            
            return @{ Success = $true; Checked = $true; ErrorsFound = 0 }
        }
        catch {
            return @{ Success = $false; Error = $_.Exception.Message }
        }
    }
    
    [void] StartMonitoring() {
        if ($this.IsMonitoring) {
            return
        }
        
        $interval = $this.Config["IncidentMonitorInterval"]
        $this.MonitorTimer = [System.Timers.Timer]::new($interval * 1000)
        $this.MonitorTimer.Elapsed.AddHandler({
            param($sender, $e)
            $this.MonitorDBCrashes() | Out-Null
        })
        $this.MonitorTimer.Start()
        $this.IsMonitoring = $true
    }
    
    [void] StopMonitoring() {
        if ($this.MonitorTimer) {
            $this.MonitorTimer.Stop()
            $this.MonitorTimer.Dispose()
        }
        $this.IsMonitoring = $false
    }
}

function New-GooseIncident {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Title,
        [string]$Description = "",
        [string]$Severity = "warning",
        [string]$ConfigFile = "config.ini"
    )
    
    $incident = [GooseIncident]::new($ConfigFile)
    return $incident.CreateIncident($Title, $Description, $Severity)
}

function Get-GooseIncidents {
    param(
        [int]$Limit = 20,
        [string]$ConfigFile = "config.ini"
    )
    
    $incident = [GooseIncident]::new($ConfigFile)
    return $incident.GetIncidents($Limit)
}

function Start-IncidentMonitor {
    param(
        [string]$ConfigFile = "config.ini"
    )
    
    $incident = [GooseIncident]::new($ConfigFile)
    $incident.StartMonitoring()
    return @{ Success = $true; Monitoring = $true }
}

function Stop-IncidentMonitor {
    param(
        [string]$ConfigFile = "config.ini"
    )
    
    $incident = [GooseIncident]::new($ConfigFile)
    $incident.StopMonitoring()
    return @{ Success = $true; Monitoring = $false }
}

function Test-GooseIncident {
    param(
        [string]$ConfigFile = "config.ini"
    )
    
    $incident = [GooseIncident]::new($ConfigFile)
    if (-not $incident.Config["IncidentEnabled"]) {
        return @{ Success = $false; Configured = $false; Reason = "Incident.io not enabled" }
    }
    if (-not $incident.Config["IncidentApiKey"]) {
        return @{ Success = $false; Configured = $false; Reason = "API key missing" }
    }
    
    try {
        $incident.GetIncidents(1) | Out-Null
        return @{ Success = $true; Configured = $true; Connected = $true }
    }
    catch {
        return @{ Success = $false; Configured = $true; Connected = $false; Error = $_.Exception.Message }
    }
}
