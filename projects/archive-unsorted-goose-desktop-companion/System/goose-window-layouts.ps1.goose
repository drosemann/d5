// Goose-Port-Spiegel von: projects/archive-unsorted-goose-desktop-companion/System/goose-window-layouts.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-goose-desktop-companion/System/goose-window-layouts.ps1");
}

// ---- Original-Code (projects/archive-unsorted-goose-desktop-companion/System/goose-window-layouts.ps1), unveraendert, als Inline-Doku ----
// # Goose Desktop Companion - Smart Window Layouts
// # Learn, save, and apply window layouts for different contexts
//
// $LoggingScriptPath = Join-Path $PSScriptRoot "..\Core\GooseLogging.ps1"
// if (Test-Path $LoggingScriptPath) {
//     . $LoggingScriptPath
// }
//
// class WindowInfo {
//     [string]$Title
//     [string]$ProcessName
//     [int]$X
//     [int]$Y
//     [int]$Width
//     [int]$Height
//     [int]$Monitor
//     [bool]$IsMaximized
//     [bool]$IsMinimized
//
//     WindowInfo([string]$title, [string]$processName, [int]$x, [int]$y, [int]$width, [int]$height) {
//         $this.Title = $title
//         $this.ProcessName = $processName
//         $this.X = $x
//         $this.Y = $y
//         $this.Width = $width
//         $this.Height = $height
//         $this.Monitor = 0
//         $this.IsMaximized = $false
//         $this.IsMinimized = $false
//     }
// }
//
// class WindowLayout {
//     [string]$Id
//     [string]$Name
//     [array]$Windows
//     [datetime]$CreatedAt
//     [datetime]$LastUsedAt
//     [int]$UseCount
//     [string]$Context
//     [hashtable]$Metadata
//
//     WindowLayout([string]$name) {
//         $this.Id = [guid]::NewGuid().ToString()
//         $this.Name = $name
//         $this.Windows = @()
//         $this.CreatedAt = Get-Date
//         $this.LastUsedAt = Get-Date
//         $this.UseCount = 0
//         $this.Context = ""
//         $this.Metadata = @{}
//     }
// }
//
// class GooseWindowLayouts {
//     [hashtable]$Config
//     [string]$DataFile
//     [array]$Layouts
//     [bool]$IsEnabled
//     [int]$MinSamples
//     [hashtable]$ContextHistory
//
//     GooseWindowLayouts() {
//         $this.Config = $this.LoadConfig()
//         $this.DataFile = "goose_window_layouts.json"
//         $this.Layouts = @()
//         $this.ContextHistory = @{}
//         $this.LoadData()
//     }
//
//     [hashtable] LoadConfig() {
//         $this.Config = @{}
//         $configFile = "config.ini"
//
//         if (Test-Path $configFile) {
//             Get-Content $configFile | ForEach-Object {
//                 if ($_ -match '^([^=]+)=(.*)$') {
//                     $key = $matches[1].Trim()
//                     $value = $matches[2].Trim()
//
//                     if ($value -eq 'True' -or $value -eq 'False') {
//                         $this.Config[$key] = [bool]$value
//                     } elseif ($value -match '^\d+$') {
//                         $this.Config[$key] = [int]$value
//                     } elseif ($value -match '^\d+\.\d+$') {
//                         $this.Config[$key] = [double]$value
//                     } else {
//                         $this.Config[$key] = $value
//                     }
//                 }
//             }
//         }
//
//         if (-not $this.Config.ContainsKey("WindowLayoutsEnabled")) {
//             $this.Config["WindowLayoutsEnabled"] = $false
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsLearnFromUse")) {
//             $this.Config["WindowLayoutsLearnFromUse"] = $true
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsMinSamples")) {
//             $this.Config["WindowLayoutsMinSamples"] = 5
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsAutoSuggest")) {
//             $this.Config["WindowLayoutsAutoSuggest"] = $true
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsSuggestThreshold")) {
//             $this.Config["WindowLayoutsSuggestThreshold"] = 3
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsMaxStored")) {
//             $this.Config["WindowLayoutsMaxStored"] = 20
//         }
//         if (-not $this.Config.ContainsKey("WindowLayoutsHotkeyPrefix")) {
//             $this.Config["WindowLayoutsHotkeyPrefix"] = "Win+Ctrl+Shift"
//         }
//
//         $this.IsEnabled = $this.Config["WindowLayoutsEnabled"]
//         $this.MinSamples = $this.Config["WindowLayoutsMinSamples"]
//
//         return $this.Config
//     }
//
//     [void] LoadData() {
//         if (Test-Path $this.DataFile) {
//             try {
//                 $data = Get-Content $this.DataFile -Raw | ConvertFrom-Json
//                 $this.Layouts = @()
//
//                 if ($data.layouts) {
//                     foreach ($layoutData in $data.layouts) {
//                         $layout = [WindowLayout]::new($layoutData.name)
//                         $layout.Id = $layoutData.id
//                         $layout.CreatedAt = [datetime]$layoutData.createdAt
//                         $layout.LastUsedAt = [datetime]$layoutData.lastUsedAt
//                         $layout.UseCount = $layoutData.useCount
//                         $layout.Context = $layoutData.context
//                         $layout.Metadata = @{}
//
//                         $layout.Windows = @()
//                         foreach ($winData in $layoutData.windows) {
//                             $win = [WindowInfo]::new($winData.title, $winData.processName, $winData.x, $winData.y, $winData.width, $winData.height)
//                             $win.Monitor = $winData.monitor
//                             $win.IsMaximized = $winData.isMaximized
//                             $win.IsMinimized = $winData.isMinimized
//                             $layout.Windows += $win
//                         }
//
//                         $this.Layouts += $layout
//                     }
//                 }
//
//                 if ($data.contextHistory) {
//                     $this.ContextHistory = @{}
//                     $data.contextHistory.PSObject.Properties | ForEach-Object {
//                         $this.ContextHistory[$_.Name] = $_.Value
//                     }
//                 }
//             } catch {
//                 Write-LogError -Message "Failed to load window layouts data: $_" -Source "WindowLayouts"
//             }
//         }
//     }
//
//     [void] SaveData() {
//         $layoutsData = @()
//         foreach ($layout in $this.Layouts) {
//             $windowsData = @()
//             foreach ($win in $layout.Windows) {
//                 $windowsData += @{
//                     title = $win.Title
//                     processName = $win.ProcessName
//                     x = $win.X
//                     y = $win.Y
//                     width = $win.Width
//                     height = $win.Height
//                     monitor = $win.Monitor
//                     isMaximized = $win.IsMaximized
//                     isMinimized = $win.IsMinimized
//                 }
//             }
//
//             $layoutsData += @{
//                 id = $layout.Id
//                 name = $layout.Name
//                 windows = $windowsData
//                 createdAt = $layout.CreatedAt.ToString("o")
//                 lastUsedAt = $layout.LastUsedAt.ToString("o")
//                 useCount = $layout.UseCount
//                 context = $layout.Context
//             }
//         }
//
//         $data = @{
//             layouts = $layoutsData
//             contextHistory = $this.ContextHistory
//         }
//
//         $data | ConvertTo-Json -Depth 10 | Set-Content $this.DataFile
//         Write-LogInfo -Message "Saved $($this.Layouts.Count) layouts" -Source "WindowLayouts"
//     }
//
//     [array] GetOpenWindows() {
//         Add-Type @"
// using System;
// using System.Runtime.InteropServices;
// using System.Text;
// using System.Collections.Generic;
//
// public class WindowEnumerator {
//     [DllImport("user32.dll")]
//     private static extern bool EnumWindows(EnumWindowsProc enumProc, IntPtr lParam);
//
//     [DllImport("user32.dll")]
//     private static extern bool IsWindowVisible(IntPtr hWnd);
//
//     [DllImport("user32.dll")]
//     private static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int count);
//
//     [DllImport("user32.dll")]
//     private static extern int GetWindowTextLength(IntPtr hWnd);
//
//     [DllImport("user32.dll")]
//     private static extern bool GetWindowRect(IntPtr hWnd, out RECT lpRect);
//
//     [DllImport("user32.dll")]
//     private static extern IntPtr GetWindowThreadProcessId(IntPtr hWnd, out uint processId);
//
//     [DllImport("user32.dll")]
//     private static extern bool IsIconic(IntPtr hWnd);
//
//     [DllImport("user32.dll")]
//     private static extern bool IsZoomed(IntPtr hWnd);
//
//     [DllImport("user32.dll")]
//     private static extern bool EnumDisplayMonitors(IntPtr hdc, IntPtr lprcClip, MonitorEnumProc lpfnEnum, IntPtr dwData);
//
//     [DllImport("user32.dll")]
//     private static extern bool GetMonitorInfo(IntPtr hMonitor, ref MONITORINFOEX lpmi);
//
//     [DllImport("user32.dll")]
//     private static extern IntPtr MonitorFromWindow(IntPtr hwnd, uint dwFlags);
//
//     private delegate bool EnumWindowsProc(IntPtr hWnd, IntPtr lParam);
//     private delegate bool MonitorEnumProc(IntPtr hMonitor, IntPtr hdcMonitor, ref RECT lprcMonitor, IntPtr dwData);
//
//     [StructLayout(LayoutKind.Sequential)]
//     public struct RECT {
//         public int Left;
//         public int Top;
//         public int Right;
//         public int Bottom;
//     }
//
//     [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Auto)]
//     public class MONITORINFOEX {
//         public int cbSize = Marshal.SizeOf(typeof(MONITORINFOEX));
//         public RECT rcMonitor;
//         public RECT rcWork;
//         public uint dwFlags;
//         [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 32)]
//         public string szDevice;
//     }
//
//     public static List<string[]> GetWindows() {
//         List<string[]> windows = new List<string[]>();
//
//         EnumWindows((hWnd, lParam) => {
//             if (!IsWindowVisible(hWnd)) return true;
//
//             int length = GetWindowTextLength(hWnd);
//             if (length == 0) return true;
//
//             StringBuilder sb = new StringBuilder(length + 1);
//             GetWindowText(hWnd, sb, sb.Capacity);
//             string title = sb.ToString();
//
//             if (string.IsNullOrWhiteSpace(title)) return true;
//
//             uint processId;
//             GetWindowThreadProcessId(hWnd, out processId);
//
//             try {
//                 var proc = System.Diagnostics.Process.GetProcessById((int)processId);
//                 string processName = proc.ProcessName;
//             } catch {
//                 return true;
//             }
//
//             RECT rect;
//             GetWindowRect(hWnd, out rect);
//
//             bool isMaximized = IsZoomed(hWnd);
//             bool isMinimized = IsIconic(hWnd);
//
//             IntPtr hMonitor = MonitorFromWindow(hWnd, 2);
//             MONITORINFOEX mi = new MONITORINFOEX();
//             mi.cbSize = Marshal.SizeOf(mi);
//             GetMonitorInfo(hMonitor, ref mi);
//             int monitor = (int)mi.dwFlags & 1;
//
//             windows.Add(new string[] {
//                 title,
//                 processName,
//                 rect.Left.ToString(),
//                 rect.Top.ToString(),
//                 (rect.Right - rect.Left).ToString(),
//                 (rect.Bottom - rect.Top).ToString(),
//                 monitor.ToString(),
//                 isMaximized.ToString(),
//                 isMinimized.ToString()
//             });
//
//             return true;
//         }, IntPtr.Zero);
//
//         return windows;
//     }
// }
// "@
//
//         $windows = [WindowEnumerator]::GetWindows()
//         $result = @()
//
//         foreach ($w in $windows) {
//             $win = [WindowInfo]::new($w[0], $w[1], [int]$w[2], [int]$w[3], [int]$w[4], [int]$w[5])
//             $win.Monitor = [int]$w[6]
//             $win.IsMaximized = [bool]::Parse($w[7])
//             $win.IsMinimized = [bool]::Parse($w[8])
//             $result += $win
//         }
//
//         return $result
//     }
//
//     [void] SetWindowPosition([WindowInfo]$window, [int]$x, [int]$y, [int]$width, [int]$height, [bool]$maximized) {
//         Add-Type @"
// using System;
// using System.Runtime.InteropServices;
//
// public class WindowMover {
//     [DllImport("user32.dll")]
//     public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
//
//     [DllImport("user32.dll")]
//     public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
//
//     [DllImport("user32.dll")]
//     public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
//
//     public static void Move(string title, int x, int y, int width, int height, bool maximized) {
//         IntPtr hWnd = FindWindow(null, title);
//         if (hWnd == IntPtr.Zero) return;
//
//         if (maximized) {
//             ShowWindow(hWnd, 3);
//         } else {
//             ShowWindow(hWnd, 1);
//             MoveWindow(hWnd, x, y, width, height, true);
//         }
//     }
// }
// "@
//
//         [WindowMover]::Move($window.Title, $x, $y, $width, $height, $window.IsMaximized)
//     }
//
//     [hashtable] SaveCurrentLayout([string]$name, [string]$context = "") {
//         $windows = $this.GetOpenWindows()
//
//         if ($windows.Count -eq 0) {
//             return @{ success = $false; message = "No windows to save" }
//         }
//
//         $layout = [WindowLayout]::new($name)
//         $layout.Windows = $windows
//         $layout.Context = $context
//
//         $existingIndex = -1
//         for ($i = 0; $i -lt $this.Layouts.Count; $i++) {
//             if ($this.Layouts[$i].Name -eq $name) {
//                 $existingIndex = $i
//                 break
//             }
//         }
//
//         if ($existingIndex -ge 0) {
//             $this.Layouts[$existingIndex] = $layout
//         } else {
//             $this.Layouts += $layout
//         }
//
//         if ($this.Layouts.Count -gt $this.Config["WindowLayoutsMaxStored"]) {
//             $sorted = $this.Layouts | Sort-Object -Property UseCount
//             $this.Layouts = $sorted | Select-Object -Last $this.Config["WindowLayoutsMaxStored"]
//         }
//
//         $this.SaveData()
//
//         Write-LogInfo -Message "Saved layout '$name' with $($windows.Count) windows" -Source "WindowLayouts"
//
//         return @{
//             success = $true
//             message = "Layout '$name' saved with $($windows.Count) windows"
//             layoutId = $layout.Id
//             windowCount = $windows.Count
//         }
//     }
//
//     [hashtable] ApplyLayout([string]$layoutIdOrName) {
//         $layout = $this.Layouts | Where-Object { $_.Id -eq $layoutIdOrName -or $_.Name -eq $layoutIdOrName } | Select-Object -First 1
//
//         if (-not $layout) {
//             return @{ success = $false; message = "Layout not found" }
//         }
//
//         $openWindows = $this.GetOpenWindows()
//         $applied = 0
//         $failed = 0
//
//         foreach ($layoutWin in $layout.Windows) {
//             $matched = $openWindows | Where-Object {
//                 $_.ProcessName -eq $layoutWin.ProcessName -and
//                 ($_.Title -eq $layoutWin.Title -or $_.Title.Contains($layoutWin.Title.Split('-')[0].Trim()))
//             } | Select-Object -First 1
//
//             if ($matched) {
//                 try {
//                     $this.SetWindowPosition($matched, $layoutWin.X, $layoutWin.Y, $layoutWin.Width, $layoutWin.Height, $layoutWin.IsMaximized)
//                     $applied++
//                 } catch {
//                     $failed++
//                 }
//             }
//         }
//
//         $layout.UseCount++
//         $layout.LastUsedAt = Get-Date
//         $this.SaveData()
//
//         return @{
//             success = $true
//             message = "Applied layout '$($layout.Name)': $applied windows positioned, $failed failed"
//             applied = $applied
//             failed = $failed
//             layoutId = $layout.Id
//         }
//     }
//
//     [hashtable] GetSuggestedLayout() {
//         if (-not $this.Config["WindowLayoutsAutoSuggest"]) {
//             return $null
//         }
//
//         $currentWindows = $this.GetOpenWindows()
//         if ($currentWindows.Count -eq 0) {
//             return $null
//         }
//
//         $currentProcesses = $currentWindows.ProcessName | Sort-Object -Unique
//
//         $bestMatch = $null
//         $bestScore = 0
//
//         foreach ($layout in $this.Layouts) {
//             $layoutProcesses = $layout.Windows.ProcessName | Sort-Object -Unique
//             $matchCount = 0
//
//             foreach ($proc in $currentProcesses) {
//                 if ($layoutProcesses -contains $proc) {
//                     $matchCount++
//                 }
//             }
//
//             if ($matchCount -gt 0) {
//                 $score = $matchCount / [Math]::Max($currentProcesses.Count, $layoutProcesses.Count)
//
//                 if ($score -gt $bestScore -and $layout.UseCount -ge $this.Config["WindowLayoutsSuggestThreshold"]) {
//                     $bestScore = $score
//                     $bestMatch = $layout
//                 }
//             }
//         }
//
//         if ($bestMatch) {
//             return @{
//                 layoutId = $bestMatch.Id
//                 name = $bestMatch.Name
//                 confidence = [math]::Round($bestScore * 100, 1)
//                 message = "I notice you have $($currentWindows.Count) windows open - apply your '$($bestMatch.Name)' layout?"
//             }
//         }
//
//         return $null
//     }
//
//     [string] DetectContext() {
//         $currentWindows = $this.GetOpenWindows()
//         if ($currentWindows.Count -eq 0) {
//             return "idle"
//         }
//
//         $processes = $currentWindows.ProcessName | Sort-Object -Unique
//
//         $contextScores = @{
//             "Coding" = @("code", "visualstudio", "idea", "webstorm", "pycharm", "sublime", "notepad++", "vim", "terminal", "powershell")
//             "Writing" = @("word", "notion", "obsidian", "evernote", "writer", "google-docs", "libreoffice")
//             "Design" = @("figma", "sketch", "photoshop", "illustrator", "xd", "canva", "gimp", "inkscape")
//             "Communication" = @("slack", "teams", "discord", "zoom", "outlook", "thunderbird")
//             "Research" = @("chrome", "firefox", "edge", "brave", "opera")
//             "Media" = @("spotify", "vlc", "netflix", "music", "itunes", "wmplayer")
//         }
//
//         $bestContext = "General"
//         $bestScore = 0
//
//         foreach ($context in $contextScores.Keys) {
//             $score = 0
//             foreach ($proc in $processes) {
//                 $procLower = $proc.ToLower()
//                 foreach ($keyword in $contextScores[$context]) {
//                     if ($procLower -like "*$keyword*") {
//                         $score++
//                         break
//                     }
//                 }
//             }
//
//             if ($score -gt $bestScore) {
//                 $bestScore = $score
//                 $bestContext = $context
//             }
//         }
//
//         if ($bestScore -eq 0) {
//             return "General"
//         }
//
//         return $bestContext
//     }
//
//     [hashtable] LearnLayout() {
//         if (-not $this.Config["WindowLayoutsLearnFromUse"]) {
//             return @{ success = $false; message = "Learning disabled in config" }
//         }
//
//         $context = $this.DetectContext()
//         $currentWindows = $this.GetOpenWindows()
//
//         if ($currentWindows.Count -lt 2) {
//             return @{ success = $false; message = "Not enough windows to learn" }
//         }
//
//         $key = $context + "_" + (Get-Date).ToString("yyyyMMddHH")
//
//         if (-not $this.ContextHistory.ContainsKey($key)) {
//             $this.ContextHistory[$key] = @{
//                 context = $context
//                 count = 0
//                 windows = @()
//                 lastSeen = (Get-Date).ToString("o")
//             }
//         }
//
//         $this.ContextHistory[$key].count++
//         $this.ContextHistory[$key].lastSeen = (Get-Date).ToString("o")
//
//         if ($this.ContextHistory[$key].count -ge $this.MinSamples) {
//             $existingLayout = $this.Layouts | Where-Object { $_.Context -eq $context } | Select-Object -First 1
//
//             if ($existingLayout) {
//                 return @{
//                     success = $true
//                     learned = $false
//                     message = "Layout for '$context' already exists"
//                     suggestion = "Use SaveCurrentLayout to save a new version"
//                 }
//             }
//
//             $result = $this.SaveCurrentLayout("$context Mode", $context)
//
//             return @{
//                 success = $true
//                 learned = $true
//                 message = "Learned your '$context' layout! Use ApplyLayout or I'll suggest it automatically."
//                 layoutId = $result.layoutId
//                 context = $context
//             }
//         }
//
//         return @{
//             success = $true
//             learned = $false
//             message = "Still learning your '$context' layout ($($this.ContextHistory[$key].count)/$this.MinSamples samples)"
//             samplesNeeded = ($this.MinSamples - $this.ContextHistory[$key].count)
//         }
//     }
//
//     [array] GetLayouts() {
//         return $this.Layouts | Sort-Object -Property LastUsedAt -Descending
//     }
//
//     [hashtable] DeleteLayout([string]$layoutId) {
//         $layout = $this.Layouts | Where-Object { $_.Id -eq $layoutId } | Select-Object -First 1
//
//         if (-not $layout) {
//             return @{ success = $false; message = "Layout not found" }
//         }
//
//         $this.Layouts = $this.Layouts | Where-Object { $_.Id -ne $layoutId }
//         $this.SaveData()
//
//         return @{
//             success = $true
//             message = "Layout '$($layout.Name)' deleted"
//         }
//     }
//
//     [hashtable] GetStats() {
//         return @{
//             totalLayouts = $this.Layouts.Count
//             mostUsed = ($this.Layouts | Sort-Object -Property UseCount -Descending | Select-Object -First 3).Name
//             totalApplies = ($this.Layouts | Measure-Object -Property UseCount -Sum).Sum
//             contextsLearned = ($this.Layouts | Where-Object { $_.Context -ne "" }).Count
//             contextHistory = $this.ContextHistory.Count
//         }
//     }
// }
//
// $gooseWindowLayouts = [GooseWindowLayouts]::new()
//
// function Get-WindowLayouts {
//     return $gooseWindowLayouts
// }
//
// function Save-WindowLayout {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$Name,
//         [string]$Context = ""
//     )
//     return $gooseWindowLayouts.SaveCurrentLayout($Name, $Context)
// }
//
// function Apply-WindowLayout {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$LayoutIdOrName
//     )
//     return $gooseWindowLayouts.ApplyLayout($LayoutIdOrName)
// }
//
// function Get-WindowLayoutSuggestion {
//     return $gooseWindowLayouts.GetSuggestedLayout()
// }
//
// function Get-WindowContext {
//     return $gooseWindowLayouts.DetectContext()
// }
//
// function Learn-WindowLayout {
//     return $gooseWindowLayouts.LearnLayout()
// }
//
// function Get-AllWindowLayouts {
//     return $gooseWindowLayouts.GetLayouts()
// }
//
// function Remove-WindowLayout {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$LayoutId
//     )
//     return $gooseWindowLayouts.DeleteLayout($LayoutId)
// }
//
// function Get-WindowLayoutStats {
//     return $gooseWindowLayouts.GetStats()
// }
//
// Write-LogInfo -Message "Goose Window Layouts Initialized" -Source "WindowLayouts"
// Write-Host "Goose Window Layouts Loaded - Enabled: $($gooseWindowLayouts.IsEnabled), Layouts: $($gooseWindowLayouts.Layouts.Count)"
//
