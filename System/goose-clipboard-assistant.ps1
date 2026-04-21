# Goose Desktop Companion - Intelligent Clipboard Assistant
# AI-powered clipboard with smart suggestions, categorization, and semantic search

$LoggingScriptPath = Join-Path $PSScriptRoot "..\Core\GooseLogging.ps1"
if (Test-Path $LoggingScriptPath) {
    . $LoggingScriptPath
}

enum ClipCategory {
    None
    Code
    Link
    Note
    Email
    Address
    Phone
    Image
    File
}

class ClipItem {
    [string]$Id
    [string]$Content
    [ClipCategory]$Category
    [datetime]$CreatedAt
    [datetime]$LastUsedAt
    [int]$UseCount
    [bool]$IsPinned
    [string]$Title
    [string]$Preview
    [hashtable]$Metadata

    ClipItem([string]$content) {
        $this.Id = [guid]::NewGuid().ToString()
        $this.Content = $content
        $this.Category = [ClipCategory]::None
        $this.CreatedAt = Get-Date
        $this.LastUsedAt = Get-Date
        $this.UseCount = 0
        $this.IsPinned = $false
        $this.Title = ""
        $this.Preview = ""
        $this.Metadata = @{}
    }
}

class GooseClipboardAssistant {
    [hashtable]$Config
    [string]$DataFile
    [array]$Clips
    [array]$PinnedClips
    [bool]$IsEnabled
    [int]$MaxAgeDays
    [datetime]$LastSync

    GooseClipboardAssistant() {
        $this.Config = $this.LoadConfig()
        $this.DataFile = "goose_clipboard_assistant.json"
        $this.Clips = @()
        $this.PinnedClips = @()
        $this.LastSync = Get-Date
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

        if (-not $this.Config.ContainsKey("ClipboardAssistantEnabled")) {
            $this.Config["ClipboardAssistantEnabled"] = $false
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantSuggestions")) {
            $this.Config["ClipboardAssistantSuggestions"] = $true
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantMaxAgeDays")) {
            $this.Config["ClipboardAssistantMaxAgeDays"] = 30
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantAutoCategorize")) {
            $this.Config["ClipboardAssistantAutoCategorize"] = $true
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantStoreLinks")) {
            $this.Config["ClipboardAssistantStoreLinks"] = $true
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantSuggestionThreshold")) {
            $this.Config["ClipboardAssistantSuggestionThreshold"] = 3
        }
        if (-not $this.Config.ContainsKey("ClipboardAssistantPanelHotkey")) {
            $this.Config["ClipboardAssistantPanelHotkey"] = "Win+Shift+V"
        }

        $this.IsEnabled = $this.Config["ClipboardAssistantEnabled"]
        $this.MaxAgeDays = $this.Config["ClipboardAssistantMaxAgeDays"]

        return $this.Config
    }

    [void] LoadData() {
        if (Test-Path $this.DataFile) {
            try {
                $data = Get-Content $this.DataFile -Raw | ConvertFrom-Json
                $this.Clips = @()
                $this.PinnedClips = @()

                if ($data.clips) {
                    foreach ($clipData in $data.clips) {
                        $clip = [ClipItem]::new($clipData.content)
                        $clip.Id = $clipData.id
                        $clip.Category = [ClipCategory][int]$clipData.category
                        $clip.CreatedAt = [datetime]$clipData.createdAt
                        $clip.LastUsedAt = [datetime]$clipData.lastUsedAt
                        $clip.UseCount = $clipData.useCount
                        $clip.IsPinned = $clipData.isPinned
                        $clip.Title = $clipData.title
                        $clip.Preview = $clipData.preview

                        if ($clip.IsPinned) {
                            $this.PinnedClips += $clip
                        } else {
                            $this.Clips += $clip
                        }
                    }
                }

                if ($data.lastSync) {
                    $this.LastSync = [datetime]$data.lastSync
                }

                $this.CleanOldClips()
            } catch {
                Write-LogError -Message "Failed to load clipboard assistant data: $_" -Source "ClipboardAssistant"
            }
        }
    }

    [void] SaveData() {
        $this.CleanOldClips()

        $clipsData = @()
        foreach ($clip in $this.Clips) {
            $clipsData += @{
                id = $clip.Id
                content = $clip.Content
                category = [int]$clip.Category
                createdAt = $clip.CreatedAt.ToString("o")
                lastUsedAt = $clip.LastUsedAt.ToString("o")
                useCount = $clip.UseCount
                isPinned = $clip.IsPinned
                title = $clip.Title
                preview = $clip.Preview
            }
        }

        foreach ($clip in $this.PinnedClips) {
            $clipsData += @{
                id = $clip.Id
                content = $clip.Content
                category = [int]$clip.Category
                createdAt = $clip.CreatedAt.ToString("o")
                lastUsedAt = $clip.LastUsedAt.ToString("o")
                useCount = $clip.UseCount
                isPinned = $clip.IsPinned
                title = $clip.Title
                preview = $clip.Preview
            }
        }

        $data = @{
            clips = $clipsData
            lastSync = $this.LastSync.ToString("o")
        }

        $data | ConvertTo-Json -Depth 10 | Set-Content $this.DataFile
        Write-LogInfo -Message "Saved $($clipsData.Count) clips" -Source "ClipboardAssistant"
    }

    [void] CleanOldClips() {
        $cutoff = (Get-Date).AddDays(-$this.MaxAgeDays)
        $this.Clips = $this.Clips | Where-Object { $_.CreatedAt -gt $cutoff -or $_.UseCount -gt 0 }
    }

    [ClipCategory] DetectCategory([string]$content) {
        $contentLower = $content.ToLower().Trim()

        if ($contentLower -match '^https?://') {
            return [ClipCategory]::Link
        }

        if ($contentLower -match '^[\w\.-]+@[\w\.-]+\.\w+$') {
            return [ClipCategory]::Email
        }

        if ($contentLower -match '^\+?[\d\s\-\(\)]{10,}$') {
            return [ClipCategory]::Phone
        }

        if ($contentLower -match '^\d+\s+\w+(\s+\w+)?,\s+.+,\s+\w+\s+\d{5}$' -or
            $contentLower -match '^\d+\s+\w+(\s+\w+)?\s+,\s+\w+') {
            return [ClipCategory]::Address
        }

        $codePatterns = @(
            'function\s+\w+',
            'def\s+\w+',
            'class\s+\w+',
            'import\s+\w+',
            'const\s+\w+',
            'let\s+\w+',
            'var\s+\w+',
            '=>\s*\{',
            'if\s*\(.+\)\s*\{',
            'for\s*\(.+\)',
            'while\s*\(.+\)',
            '<\w+[^>]*>',
            '\$\w+\.',
            '@\w+',
            '#include',
            'public\s+class',
            'private\s+void'
        )

        foreach ($pattern in $codePatterns) {
            if ($content -match $pattern) {
                return [ClipCategory]::Code
            }
        }

        return [ClipCategory]::Note
    }

    [string] ExtractTitle([ClipItem]$clip) {
        if ($clip.Category -eq [ClipCategory]::Link) {
            if ($clip.Content -match 'github\.com/([^/]+/[^/]+)') {
                return "GitHub: $(
                    $matches[1] -replace '/$', ''
                )"
            }
            if ($clip.Content -match 'stackoverflow\.com/questions/(\d+)') {
                return "StackOverflow #$($matches[1])"
            }
            return $clip.Content.Substring(0, [Math]::Min(50, $clip.Content.Length))
        }

        if ($clip.Content.Length -gt 50) {
            $firstLine = $clip.Content -split "`n" | Select-Object -First 1
            return $firstLine.Substring(0, [Math]::Min(50, $firstLine.Length))
        }

        return $clip.Content.Substring(0, [Math]::Min(50, $clip.Content.Length))
    }

    [string] ExtractPreview([string]$content) {
        $lines = $content -split "`n" | Where-Object { $_.Trim() -ne "" }
        if ($lines.Count -gt 1) {
            return ($lines | Select-Object -First 3) -join " | "
        }
        return ""
    }

    [hashtable] AddClip([string]$content) {
        if ([string]::IsNullOrWhiteSpace($content)) {
            return @{ success = $false; message = "Content is empty" }
        }

        $existingClip = $this.Clips | Where-Object { $_.Content -eq $content } | Select-Object -First 1
        if ($existingClip) {
            $existingClip.UseCount++
            $existingClip.LastUsedAt = Get-Date
            $this.SaveData()
            return @{
                success = $true
                message = "Clip use count updated"
                clip = @{
                    id = $existingClip.Id
                    useCount = $existingClip.UseCount
                }
            }
        }

        $clip = [ClipItem]::new($content)

        if ($this.Config["ClipboardAssistantAutoCategorize"]) {
            $clip.Category = $this.DetectCategory($content)
        }

        $clip.Title = $this.ExtractTitle($clip)
        $clip.Preview = $this.ExtractPreview($content)

        if ($clip.Category -eq [ClipCategory]::Link -and $this.Config["ClipboardAssistantStoreLinks"]) {
            $clip.Metadata["addedAt"] = Get-Date.ToString("o")
        }

        $this.Clips = @($clip) + $this.Clips

        if ($this.Clips.Count -gt 100) {
            $this.Clips = $this.Clips | Select-Object -First 100
        }

        $this.SaveData()

        Write-LogInfo -Message "Added new clip: $($clip.Title)" -Source "ClipboardAssistant"

        return @{
            success = $true
            message = "Clip added successfully"
            clip = @{
                id = $clip.Id
                title = $clip.Title
                category = $clip.Category.ToString()
            }
            suggestion = $this.GetSuggestionForClip($clip)
        }
    }

    [hashtable] GetSuggestionForClip([ClipItem]$newClip) {
        if (-not $this.Config["ClipboardAssistantSuggestions"]) {
            return $null
        }

        $threshold = $this.Config["ClipboardAssistantSuggestionThreshold"]
        $similarClips = $this.Clips | Where-Object {
            $_.Id -ne $newClip.Id -and
            $_.UseCount -ge $threshold -and
            ($_.Content -eq $newClip.Content -or $_.Title -eq $newClip.Title)
        }

        if ($similarClips) {
            return @{
                type = "repeat"
                message = "You've copied this $($similarClips[0].UseCount) times"
                clipId = $similarClips[0].Id
            }
        }

        $recentSimilar = $this.Clips | Where-Object {
            $_.Id -ne $newClip.Id -and
            $_.Category -eq $newClip.Category -and
            ((Get-Date).Subtract($_.CreatedAt).TotalDays -lt 7)
        } | Select-Object -First 1

        if ($recentSimilar -and $newClip.Category -ne [ClipCategory]::None) {
            return @{
                type = "category"
                message = "Similar to your recent $($newClip.Category.ToString().ToLower()) clip"
                clipId = $recentSimilar.Id
            }
        }

        return $null
    }

    [array] SearchClips([string]$query) {
        if ([string]::IsNullOrWhiteSpace($query)) {
            return @()
        }

        $queryLower = $query.ToLower()
        $results = @()

        foreach ($clip in $this.Clips) {
            $score = 0

            if ($clip.Content.ToLower().Contains($queryLower)) {
                $score += 10
            }
            if ($clip.Title.ToLower().Contains($queryLower)) {
                $score += 5
            }
            if ($clip.Category.ToString().ToLower().Contains($queryLower)) {
                $score += 3
            }

            $score += $clip.UseCount

            if ($score -gt 0) {
                $results += @{
                    clip = $clip
                    score = $score
                }
            }
        }

        return ($results | Sort-Object -Property score -Descending | Select-Object -First 10).clip
    }

    [hashtable] GetClipsByCategory([ClipCategory]$category) {
        return @($this.Clips | Where-Object { $_.Category -eq $category })
    }

    [hashtable] PinClip([string]$clipId) {
        $clip = $this.Clips | Where-Object { $_.Id -eq $clipId } | Select-Object -First 1
        if (-not $clip) {
            return @{ success = $false; message = "Clip not found" }
        }

        $clip.IsPinned = $true
        $clip.UseCount++

        $this.Clips = $this.Clips | Where-Object { $_.Id -ne $clipId }
        $this.PinnedClips = @($clip) + $this.PinnedClips

        $this.SaveData()

        return @{
            success = $true
            message = "Clip pinned"
            clipId = $clipId
        }
    }

    [hashtable] UnpinClip([string]$clipId) {
        $clip = $this.PinnedClips | Where-Object { $_.Id -eq $clipId } | Select-Object -First 1
        if (-not $clip) {
            return @{ success = $false; message = "Pinned clip not found" }
        }

        $clip.IsPinned = $false

        $this.PinnedClips = $this.PinnedClips | Where-Object { $_.Id -ne $clipId }
        $this.Clips = @($clip) + $this.Clips

        $this.SaveData()

        return @{
            success = $true
            message = "Clip unpinned"
            clipId = $clipId
        }
    }

    [hashtable] DeleteClip([string]$clipId) {
        $clip = $this.Clips | Where-Object { $_.Id -eq $clipId } | Select-Object -First 1
        if ($clip) {
            $this.Clips = $this.Clips | Where-Object { $_.Id -ne $clipId }
            $this.SaveData()
            return @{ success = $true; message = "Clip deleted" }
        }

        $pinnedClip = $this.PinnedClips | Where-Object { $_.Id -eq $clipId } | Select-Object -First 1
        if ($pinnedClip) {
            $this.PinnedClips = $this.PinnedClips | Where-Object { $_.Id -ne $clipId }
            $this.SaveData()
            return @{ success = $true; message = "Pinned clip deleted" }
        }

        return @{ success = $false; message = "Clip not found" }
    }

    [hashtable] CategorizeClip([string]$clipId, [ClipCategory]$category) {
        $clip = ($this.Clips + $this.PinnedClips) | Where-Object { $_.Id -eq $clipId } | Select-Object -First 1
        if (-not $clip) {
            return @{ success = $false; message = "Clip not found" }
        }

        $clip.Category = $category
        $this.SaveData()

        return @{
            success = $true
            message = "Clip categorized as $($category.ToString())"
            category = $category.ToString()
        }
    }

    [array] GetRecentClips([int]$count = 10) {
        $allClips = $this.PinnedClips + $this.Clips
        return $allClips | Sort-Object -Property LastUsedAt -Descending | Select-Object -First $count
    }

    [hashtable] GetSuggestion() {
        if (-not $this.Config["ClipboardAssistantSuggestions"]) {
            return $null
        }

        $frequentClips = $this.Clips | Where-Object { $_.UseCount -ge 3 } | Sort-Object -Property UseCount -Descending | Select-Object -First 1

        if ($frequentClips) {
            return @{
                type = "frequent"
                message = "You often copy this - pin it for quick access?"
                clipId = $frequentClips.Id
                content = $frequentClips.Content.Substring(0, [Math]::Min(100, $frequentClips.Content.Length))
            }
        }

        return $null
    }

    [hashtable] GetStats() {
        $categoryStats = @{}
        foreach ($category in [ClipCategory].GetEnumValues()) {
            $count = ($this.Clips + $this.PinnedClips) | Where-Object { $_.Category -eq $category } | Measure-Object | Select-Object -ExpandProperty Count
            if ($count -gt 0) {
                $categoryStats[$category.ToString()] = $count
            }
        }

        return @{
            totalClips = $this.Clips.Count
            pinnedClips = $this.PinnedClips.Count
            categoryStats = $categoryStats
            mostUsed = ($this.Clips | Sort-Object -Property UseCount -Descending | Select-Object -First 5).Title
            totalUses = ($this.Clips | Measure-Object -Property UseCount -Sum).Sum
        }
    }

    [void] ClearHistory() {
        $this.Clips = @()
        $this.SaveData()
    }

    [hashtable] ExportData([string]$format = "json") {
        $this.LastSync = Get-Date

        $exportData = @{
            exportedAt = $this.LastSync.ToString("o")
            clips = @()
        }

        foreach ($clip in ($this.Clips + $this.PinnedClips)) {
            $exportData.clips += @{
                id = $clip.Id
                content = $clip.Content
                category = $clip.Category.ToString()
                createdAt = $clip.CreatedAt.ToString("o")
                useCount = $clip.UseCount
                isPinned = $clip.IsPinned
                title = $clip.Title
            }
        }

        $this.SaveData()

        return @{
            success = $true
            data = $exportData
            count = $exportData.clips.Count
        }
    }

    [hashtable] ImportData([hashtable]$importData) {
        $imported = 0

        foreach ($clipData in $importData.clips) {
            $existing = $this.Clips | Where-Object { $_.Id -eq $clipData.id } | Select-Object -First 1
            if ($existing) { continue }

            $clip = [ClipItem]::new($clipData.content)
            $clip.Id = $clipData.id
            $clip.Category = [ClipCategory]$clipData.category
            $clip.UseCount = $clipData.useCount
            $clip.IsPinned = $clipData.isPinned
            $clip.Title = $clipData.title

            if ($clip.IsPinned) {
                $this.PinnedClips += $clip
            } else {
                $this.Clips += $clip
            }

            $imported++
        }

        $this.SaveData()

        return @{
            success = $true
            imported = $imported
            message = "Imported $imported clips"
        }
    }
}

$gooseClipboardAssistant = [GooseClipboardAssistant]::new()

function Get-ClipboardAssistant {
    return $gooseClipboardAssistant
}

function Show-ClipboardPanel {
    Write-Host "Opening Clipboard Assistant Panel..."
    Write-Host "Hotkey: $($gooseClipboardAssistant.Config["ClipboardAssistantPanelHotkey"])"
    Write-Host ""
    Write-Host "Recent Clips:"
    foreach ($clip in $gooseClipboardAssistant.GetRecentClips(5)) {
        Write-Host "  [$($clip.Category)] $($clip.Title)"
    }
    Write-Host ""
    $suggestion = $gooseClipboardAssistant.GetSuggestion()
    if ($suggestion) {
        Write-Host "Suggestion: $($suggestion.message)"
    }
}

function Add-ClipToAssistant {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Content
    )
    return $gooseClipboardAssistant.AddClip($Content)
}

function Search-ClipAssistant {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Query
    )
    return $gooseClipboardAssistant.SearchClips($Query)
}

function Get-ClipSuggestion {
    return $gooseClipboardAssistant.GetSuggestion()
}

function Set-ClipCategory {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ClipId,
        [Parameter(Mandatory=$true)]
        [ValidateSet("None", "Code", "Link", "Note", "Email", "Address", "Phone", "Image", "File")]
        [string]$Category
    )
    return $gooseClipboardAssistant.CategorizeClip($ClipId, [ClipCategory]$Category)
}

function Remove-ClipFromAssistant {
    param(
        [Parameter(Mandatory=$true)]
        [string]$ClipId
    )
    return $gooseClipboardAssistant.DeleteClip($ClipId)
}

function Get-ClipboardStats {
    return $gooseClipboardAssistant.GetStats()
}

Write-LogInfo -Message "Goose Clipboard Assistant Initialized" -Source "ClipboardAssistant"
Write-Host "Goose Clipboard Assistant Loaded - Enabled: $($gooseClipboardAssistant.IsEnabled)"
