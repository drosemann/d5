// Goose-Port-Spiegel von: projects/archive-unsorted-goose-desktop-companion/Office/goose-meeting-prep.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-goose-desktop-companion/Office/goose-meeting-prep.ps1");
}

// ---- Original-Code (projects/archive-unsorted-goose-desktop-companion/Office/goose-meeting-prep.ps1), unveraendert, als Inline-Doku ----
// # Goose Desktop Companion - Meeting Prep Assistant
// # Prepare for meetings with context, talking points, and action item capture
//
// $LoggingScriptPath = Join-Path $PSScriptRoot "..\Core\GooseLogging.ps1"
// if (Test-Path $LoggingScriptPath) {
//     . $LoggingScriptPath
// }
//
// class MeetingContext {
//     [string]$Id
//     [string]$Title
//     [datetime]$DateTime
//     [int]$DurationMinutes
//     [array]$Attendees
//     [string]$Source
//     [string]$Notes
//     [array]$RelatedNotes
//     [array]$FollowUps
//
//     MeetingContext([string]$title) {
//         $this.Id = [guid]::NewGuid().ToString()
//         $this.Title = $title
//         $this.DateTime = Get-Date
//         $this.DurationMinutes = 60
//         $this.Attendees = @()
//         $this.Source = "manual"
//         $this.Notes = ""
//         $this.RelatedNotes = @()
//         $this.FollowUps = @()
//     }
// }
//
// class ActionItem {
//     [string]$Id
//     [string]$Content
//     [string]$Assignee
//     [datetime]$DueDate
//     [bool]$IsCompleted
//     [datetime]$CreatedAt
//     [string]$MeetingId
//
//     ActionItem([string]$content, [string]$meetingId) {
//         $this.Id = [guid]::NewGuid().ToString()
//         $this.Content = $content
//         $this.Assignee = ""
//         $this.DueDate = (Get-Date).AddDays(7)
//         $this.IsCompleted = $false
//         $this.CreatedAt = Get-Date
//         $this.MeetingId = $meetingId
//     }
// }
//
// class Icebreaker {
//     [string]$Id
//     [string]$Text
//     [string]$Category
//     [bool]$IsUsed
//
//     Icebreaker([string]$text, [string]$category) {
//         $this.Id = [guid]::NewGuid().ToString()
//         $this.Text = $text
//         $this.Category = $category
//         $this.IsUsed = $false
//     }
// }
//
// class GooseMeetingPrep {
//     [hashtable]$Config
//     [string]$DataFile
//     [hashtable]$Meetings
//     [array]$ActionItems
//     [array]$Icebreakers
//     [bool]$IsEnabled
//
//     GooseMeetingPrep() {
//         $this.Config = $this.LoadConfig()
//         $this.DataFile = "goose_meeting_prep.json"
//         $this.Meetings = @{}
//         $this.ActionItems = @()
//         $this.LoadIcebreakers()
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
//         if (-not $this.Config.ContainsKey("MeetingPrepEnabled")) {
//             $this.Config["MeetingPrepEnabled"] = $false
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepPreMinutes")) {
//             $this.Config["MeetingPrepPreMinutes"] = 10
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepShowFollowups")) {
//             $this.Config["MeetingPrepShowFollowups"] = $true
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepShowNotes")) {
//             $this.Config["MeetingPrepShowNotes"] = $true
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepSuggestTopics")) {
//             $this.Config["MeetingPrepSuggestTopics"] = $true
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepIcebreakers")) {
//             $this.Config["MeetingPrepIcebreakers"] = $true
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepAutoDetect")) {
//             $this.Config["MeetingPrepAutoDetect"] = $true
//         }
//         if (-not $this.Config.ContainsKey("MeetingPrepSources")) {
//             $this.Config["MeetingPrepSources"] = "notes,tasks"
//         }
//
//         $this.IsEnabled = $this.Config["MeetingPrepEnabled"]
//
//         return $this.Config
//     }
//
//     [void] LoadIcebreakers() {
//         $this.Icebreakers = @(
//             [Icebreaker]::new("If you could have any superpower for a day, what would it be?", "fun"),
//             [Icebreaker]::new("What's the best piece of advice you've ever received?", "professional"),
//             [Icebreaker]::new("What's a hobby you'd like to pick up?", "fun"),
//             [Icebreaker]::new("What's the most interesting project you've worked on?", "professional"),
//             [Icebreaker]::new("If you could travel anywhere right now, where would you go?", "fun"),
//             [Icebreaker]::new("What's a skill you'd like to learn?", "professional"),
//             [Icebreaker]::new("What's your favorite productivity tip?", "professional"),
//             [Icebreaker]::new("What's the last book or article that inspired you?", "fun"),
//             [Icebreaker]::new("What's something you're looking forward to this week?", "fun"),
//             [Icebreaker]::new("What's a goal you're working toward right now?", "professional")
//         )
//     }
//
//     [void] LoadData() {
//         if (Test-Path $this.DataFile) {
//             try {
//                 $data = Get-Content $this.DataFile -Raw | ConvertFrom-Json
//                 $this.Meetings = @{}
//                 $this.ActionItems = @()
//
//                 if ($data.meetings) {
//                     $data.meetings.PSObject.Properties | ForEach-Object {
//                         $m = [MeetingContext]::new($_.Value.title)
//                         $m.Id = $_.Value.id
//                         $m.DateTime = [datetime]$_.Value.dateTime
//                         $m.DurationMinutes = $_.Value.durationMinutes
//                         $m.Attendees = @($_.Value.attendees)
//                         $m.Source = $_.Value.source
//                         $m.Notes = $_.Value.notes
//                         $m.RelatedNotes = @($_.Value.relatedNotes)
//                         $m.FollowUps = @($_.Value.followUps)
//                         $this.Meetings[$_.Name] = $m
//                     }
//                 }
//
//                 if ($data.actionItems) {
//                     foreach ($aiData in $data.actionItems) {
//                         $ai = [ActionItem]::new($aiData.content, $aiData.meetingId)
//                         $ai.Id = $aiData.id
//                         $ai.Assignee = $aiData.assignee
//                         $ai.DueDate = [datetime]$aiData.dueDate
//                         $ai.IsCompleted = $aiData.isCompleted
//                         $ai.CreatedAt = [datetime]$aiData.createdAt
//                         $this.ActionItems += $ai
//                     }
//                 }
//             } catch {
//                 Write-LogError -Message "Failed to load meeting prep data: $_" -Source "MeetingPrep"
//             }
//         }
//     }
//
//     [void] SaveData() {
//         $meetingsData = @{}
//         foreach ($key in $this.Meetings.Keys) {
//             $m = $this.Meetings[$key]
//             $meetingsData[$key] = @{
//                 id = $m.Id
//                 title = $m.Title
//                 dateTime = $m.DateTime.ToString("o")
//                 durationMinutes = $m.DurationMinutes
//                 attendees = $m.Attendees
//                 source = $m.Source
//                 notes = $m.Notes
//                 relatedNotes = $m.RelatedNotes
//                 followUps = $m.FollowUps
//             }
//         }
//
//         $actionData = @()
//         foreach ($ai in $this.ActionItems) {
//             $actionData += @{
//                 id = $ai.Id
//                 content = $ai.Content
//                 assignee = $ai.Assignee
//                 dueDate = $ai.DueDate.ToString("o")
//                 isCompleted = $ai.IsCompleted
//                 createdAt = $ai.CreatedAt.ToString("o")
//                 meetingId = $ai.MeetingId
//             }
//         }
//
//         $data = @{
//             meetings = $meetingsData
//             actionItems = $actionData
//         }
//
//         $data | ConvertTo-Json -Depth 10 | Set-Content $this.DataFile
//         Write-LogInfo -Message "Saved meeting prep data" -Source "MeetingPrep"
//     }
//
//     [hashtable] CreateMeeting([string]$title, [array]$attendees = @(), [datetime]$dateTime) {
//         $meeting = [MeetingContext]::new($title)
//         $meeting.Attendees = $attendees
//         $meeting.DateTime = $dateTime
//         $meeting.Source = "manual"
//
//         $key = $meeting.DateTime.ToString("yyyy-MM-dd-HHmm")
//         $this.Meetings[$key] = $meeting
//
//         $this.SaveData()
//
//         Write-LogInfo -Message "Created meeting: $title" -Source "MeetingPrep"
//
//         return @{
//             success = $true
//             meetingId = $meeting.Id
//             title = $title
//             dateTime = $dateTime
//         }
//     }
//
//     [hashtable] GetUpcomingMeetings([int]$hours = 24) {
//         $now = Get-Date
//         $cutoff = $now.AddHours($hours)
//         $upcoming = @()
//
//         foreach ($key in $this.Meetings.Keys) {
//             $meeting = $this.Meetings[$key]
//             if ($meeting.DateTime -gt $now -and $meeting.DateTime -lt $cutoff) {
//                 $upcoming += @{
//                     id = $meeting.Id
//                     title = $meeting.Title
//                     dateTime = $meeting.DateTime
//                     minutesUntil = [int]($meeting.DateTime - $now).TotalMinutes
//                     attendees = $meeting.Attendees
//                 }
//             }
//         }
//
//         return ($upcoming | Sort-Object dateTime)
//     }
//
//     [hashtable] GetAttendeeContext([string]$attendeeEmail) {
//         $context = @{
//             name = $attendeeEmail -replace '@.*', ''
//             recentNotes = @()
//             relatedFollowUps = @()
//             previousMeetings = @()
//         }
//
//         $notesPath = "goose_notes.json"
//         if (Test-Path $notesPath -and $this.Config["MeetingPrepShowNotes"]) {
//             try {
//                 $notesData = Get-Content $notesPath -Raw | ConvertFrom-Json
//                 if ($notesData.notes) {
//                     $searchTerms = $context.name -split ' '
//                     $context.recentNotes = @($notesData.notes | Where-Object {
//                         $content = $_.content
//                         foreach ($term in $searchTerms) {
//                             if ($content -like "*$term*") { return $true }
//                         }
//                         return $false
//                     } | Select-Object -First 3)
//                 }
//             } catch {}
//         }
//
//         $context.relatedFollowUps = @($this.ActionItems | Where-Object {
//             $_.Assignee -like "*$($context.name)*" -or $_.Content -like "*$($context.name)*"
//         } | Where-Object { -not $_.IsCompleted } | Select-Object -First 3)
//
//         foreach ($key in $this.Meetings.Keys) {
//             $meeting = $this.Meetings[$key]
//             if ($meeting.Attendees -contains $attendeeEmail) {
//                 $context.previousMeetings += @{
//                     title = $meeting.Title
//                     date = $meeting.DateTime
//                     notes = $meeting.Notes
//                 }
//             }
//             if ($context.previousMeetings.Count -ge 3) { break }
//         }
//
//         return $context
//     }
//
//     [array] GetRelatedFollowUps([string]$meetingTitle) {
//         $searchTerms = $meetingTitle -split ' ' | Where-Object { $_.Length -gt 3 }
//
//         $related = @()
//         foreach ($item in $this.ActionItems) {
//             if ($item.IsCompleted) { continue }
//
//             foreach ($term in $searchTerms) {
//                 if ($item.Content -like "*$term*") {
//                     $related += $item
//                     break
//                 }
//             }
//         }
//
//         return $related | Select-Object -First 5
//     }
//
//     [array] SuggestTalkingPoints([string]$meetingTitle = "") {
//         $points = @()
//
//         $recentAccomplishmentsPath = "goose_accomplishments.json"
//         if (Test-Path $recentAccomplishmentsPath) {
//             try {
//                 $accData = Get-Content $recentAccomplishmentsPath -Raw | ConvertFrom-Json
//                 if ($accData.logs) {
//                     $today = (Get-Date).ToString("yyyy-MM-dd")
//                     if ($accData.logs.$today) {
//                         $todayAccs = $accData.logs.$today
//                         if ($todayAccs -is [array]) {
//                             $shipped = $todayAccs | Where-Object { $_.type -eq 0 }
//                             if ($shipped) {
//                                 $points += "Updates: Share any recent shipments or progress"
//                             }
//                         }
//                     }
//                 }
//             } catch {}
//         }
//
//         $relatedFollowUps = $this.GetRelatedFollowUps($meetingTitle)
//         if ($relatedFollowUps.Count -gt 0) {
//             $points += "Action items: $($relatedFollowUps.Count) related items to discuss"
//         }
//
//         $points += "Open discussion: Any blockers or challenges?"
//
//         return $points
//     }
//
//     [string] GetIcebreaker() {
//         $available = $this.Icebreakers | Where-Object { -not $_.IsUsed }
//         if ($available.Count -eq 0) {
//             foreach ($ib in $this.Icebreakers) {
//                 $ib.IsUsed = $false
//             }
//             $available = $this.Icebreakers
//         }
//
//         $selected = $available | Get-Random
//         $selected.IsUsed = $true
//
//         return $selected.Text
//     }
//
//     [hashtable] CaptureActionItem([string]$content, [string]$meetingId = "", [string]$assignee = "") {
//         $item = [ActionItem]::new($content, $meetingId)
//         $item.Assignee = $assignee
//
//         $this.ActionItems += $item
//         $this.SaveData()
//
//         Write-LogInfo -Message "Captured action item: $content" -Source "MeetingPrep"
//
//         return @{
//             success = $true
//             id = $item.Id
//             content = $content
//             dueDate = $item.DueDate
//         }
//     }
//
//     [hashtable] CompleteActionItem([string]$itemId) {
//         foreach ($item in $this.ActionItems) {
//             if ($item.Id -eq $itemId) {
//                 $item.IsCompleted = $true
//                 $this.SaveData()
//                 return @{
//                     success = $true
//                     message = "Action item completed!"
//                 }
//             }
//         }
//         return @{ success = $false; message = "Item not found" }
//     }
//
//     [array] GetPendingActionItems() {
//         return @($this.ActionItems | Where-Object { -not $_.IsCompleted } | Sort-Object dueDate)
//     }
//
//     [hashtable] GenerateMeetingPrep([string]$meetingTitle, [array]$attendees = @()) {
//         $prep = @{
//             meetingTitle = $meetingTitle
//             attendeeContexts = @()
//             talkingPoints = @()
//             relatedFollowUps = @()
//             icebreaker = ""
//             generatedAt = Get-Date
//         }
//
//         foreach ($attendee in $attendees) {
//             $prep.attendeeContexts += $this.GetAttendeeContext($attendee)
//         }
//
//         if ($this.Config["MeetingPrepSuggestTopics"]) {
//             $prep.talkingPoints = $this.SuggestTalkingPoints($meetingTitle)
//         }
//
//         if ($this.Config["MeetingPrepShowFollowups"]) {
//             $prep.relatedFollowUps = $this.GetRelatedFollowUps($meetingTitle)
//         }
//
//         if ($this.Config["MeetingPrepIcebreakers"]) {
//             $prep.icebreaker = $this.GetIcebreaker()
//         }
//
//         Write-LogInfo -Message "Generated prep for: $meetingTitle" -Source "MeetingPrep"
//
//         return $prep
//     }
//
//     [hashtable] GetMeetingById([string]$meetingId) {
//         foreach ($meeting in $this.Meetings.Values) {
//             if ($meeting.Id -eq $meetingId) {
//                 return $meeting
//             }
//         }
//         return $null
//     }
//
//     [hashtable] UpdateMeetingNotes([string]$meetingId, [string]$notes) {
//         $meeting = $this.GetMeetingById($meetingId)
//         if ($meeting) {
//             $meeting.Notes = $notes
//             $this.SaveData()
//             return @{ success = $true }
//         }
//         return @{ success = $false; message = "Meeting not found" }
//     }
//
//     [hashtable] GetStats() {
//         $pendingCount = ($this.ActionItems | Where-Object { -not $_.IsCompleted }).Count
//         $completedCount = ($this.ActionItems | Where-Object { $_.IsCompleted }).Count
//         $overdueCount = ($this.ActionItems | Where-Object { -not $_.IsCompleted -and $_.DueDate -lt (Get-Date) }).Count
//         $upcoming = $this.GetUpcomingMeetings(24)
//
//         return @{
//             totalMeetings = $this.Meetings.Count
//             totalActionItems = $this.ActionItems.Count
//             pendingActionItems = $pendingCount
//             completedActionItems = $completedCount
//             overdueActionItems = $overdueCount
//             upcomingMeetings = $upcoming.Count
//         }
//     }
// }
//
// $gooseMeetingPrep = [GooseMeetingPrep]::new()
//
// function Get-MeetingPrep {
//     return $gooseMeetingPrep
// }
//
// function New-Meeting {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$Title,
//         [string[]]$Attendees = @(),
//         [datetime]$DateTime
//     )
//     if (-not $DateTime) { $DateTime = (Get-Date).AddHours(1) }
//     return $gooseMeetingPrep.CreateMeeting($Title, $Attendees, $DateTime)
// }
//
// function Get-UpcomingMeetings {
//     param([int]$Hours = 24)
//     return $gooseMeetingPrep.GetUpcomingMeetings($Hours)
// }
//
// function Get-MeetingContext {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$AttendeeEmail
//     )
//     return $gooseMeetingPrep.GetAttendeeContext($AttendeeEmail)
// }
//
// function Get-RelatedFollowUps {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$MeetingTitle
//     )
//     return $gooseMeetingPrep.GetRelatedFollowUps($MeetingTitle)
// }
//
// function Get-TalkingPoints {
//     param([string]$MeetingTitle = "")
//     return $gooseMeetingPrep.SuggestTalkingPoints($MeetingTitle)
// }
//
// function Get-MeetingIcebreaker {
//     return $gooseMeetingPrep.GetIcebreaker()
// }
//
// function Add-ActionItem {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$Content,
//         [string]$MeetingId = "",
//         [string]$Assignee = ""
//     )
//     return $gooseMeetingPrep.CaptureActionItem($Content, $MeetingId, $Assignee)
// }
//
// function Complete-ActionItem {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$ItemId
//     )
//     return $gooseMeetingPrep.CompleteActionItem($ItemId)
// }
//
// function Get-PendingActionItems {
//     return $gooseMeetingPrep.GetPendingActionItems()
// }
//
// function Get-MeetingPrepData {
//     param(
//         [Parameter(Mandatory=$true)]
//         [string]$MeetingTitle,
//         [string[]]$Attendees = @()
//     )
//     return $gooseMeetingPrep.GenerateMeetingPrep($MeetingTitle, $Attendees)
// }
//
// function Get-MeetingPrepStats {
//     return $gooseMeetingPrep.GetStats()
// }
//
// Write-LogInfo -Message "Goose Meeting Prep Initialized" -Source "MeetingPrep"
// Write-Host "Goose Meeting Prep Loaded - Enabled: $($gooseMeetingPrep.IsEnabled)"
//
