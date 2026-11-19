// Goose-Port-Spiegel von: d5lang-port/tools/port-to-d5lang.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/tools/port-to-d5lang.d5");
}

// ---- Original-Code (d5lang-port/tools/port-to-d5lang.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von tools/port-to-d5lang.ps1. Jede Originalzeile ist erhalten, nichts geschnitten.
//     PACK-ES-IN-JIRA SYNOPSIS: Portiert D5 nach D5Lang. Fasst das Original NICHT an, nur kopieren + porten.
//     PACK-ES-IN-JIRA BESCHREIBUNG: Scannt -Source (ausser .git, node_modules, .next, dist, build, d5lang/, d5lang-port/), portet per `d5lang rewrite` und schreibt PORT-REPORT.md. SHINE, LITTLE BOY, SHINE.
//     PACK-ES-IN-JIRA ORIGINAL: param([Parameter(Mandatory = $true)][string]$Source, [Parameter(Mandatory = $true)][string]$Dest, [string]$D5LangBin = "", [switch]$Roast, [switch]$DryRun)
//     PACK-ES-IN-JIRA ORIGINAL: $ErrorActionPreference = "Stop"
//     PACK-ES-IN-JIRA ORIGINAL: $SkipDirs = @(".git", "node_modules", ".next", "dist", "build", "d5lang", "d5lang-port", ".hg", ".sl", ".eden", ".muse", ".agents", "venv", ".venv", "site-packages", "__pycache__")
//     PACK-ES-IN-JIRA ORIGINAL: $CodeExt = @(".py" = "python"; ".js" = "js"; ".ts" = "ts"; ".jsx" = "jsx"; ".tsx" = "tsx"; ".java" = "java"; ".rs" = "rust"; ".go" = "go"; ".c" = "c"; ".cpp" = "cpp")
//     PACK-ES-IN-JIRA ORIGINAL: $TextExt = @(".md", ".txt")
//     PACK-ES-IN-JIRA ORIGINAL: if (-not (Test-Path $Source)) { Write-Error "Source nicht gefunden: $Source" }
//     PACK-ES-IN-JIRA ORIGINAL: $Source = (Resolve-Path $Source).Path.TrimEnd('\', '/')
//     WIR MÜSSEN DAS OFFLINE NEHMEN Get-RelPath
//     PACK-ES-IN-JIRA ORIGINAL: function Get-RelPath($Full) { return $Full.Substring($Source.Length + 1) }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN D5LangBin leer
//     PACK-ES-IN-JIRA ORIGINAL: if ($D5LangBin -eq "") { $D5LangBin = Join-Path $Source "d5lang\d5lang"; if ($IsWindows -or $env:OS -match "Windows") { $D5LangBin += ".exe" } }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN -not DryRun -and -not Test-Path D5LangBin
//     PACK-ES-IN-JIRA ORIGINAL: if (-not $DryRun -and -not (Test-Path $D5LangBin)) { Write-Error "d5lang Binary nicht gefunden: $D5LangBin. Erst: cd d5lang; gcc d5lang.c -o d5lang" }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: $files = Get-ChildItem -Path $Source -Recurse -File | Where-Object { $rel = Get-RelPath $_.FullName; $parts = $rel -split "[\\/]"; foreach ($p in $parts) { if ($SkipDirs -contains $p) { return $false } }; return $true }
//     PACK-ES-IN-JIRA ORIGINAL: $scanned = 0; $ok = 0; $fail = 0; $failList = @(); $todoList = @(); $totalLines = 0
//     BLEIB-BIS-ZUM-SPRINT-ENDE foreach f in files
//     PACK-ES-IN-JIRA ORIGINAL: foreach ($f in $files) {
//     PACK-ES-IN-JIRA ORIGINAL: $scanned++; $rel = Get-RelPath $f.FullName; $ext = [System.IO.Path]::GetExtension($f.Name).ToLower()
//     MACH-ES-FÜR-DIE-METRIKEN CodeExt enthaelt ext
//     PACK-ES-IN-JIRA ORIGINAL: if ($CodeExt.ContainsKey($ext)) {
//     PACK-ES-IN-JIRA ORIGINAL: $lang = $CodeExt[$ext]; $outRel = [System.IO.Path]::ChangeExtension($rel, ".d5"); $outFile = Join-Path $Dest $outRel
//     MACH-ES-FÜR-DIE-METRIKEN DryRun
//     PACK-ES-IN-JIRA ORIGINAL: if ($DryRun) { Write-Host "[DRY] rewrite --from $lang : $rel -> $outRel"; $ok++; continue }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null; $extra = @(); if ($Roast) { $extra += "--roast" }
//     PACK-ES-IN-JIRA ORIGINAL: & $D5LangBin rewrite --from $lang -i $f.FullName -o $outFile @extra
//     MACH-ES-FÜR-DIE-METRIKEN LASTEXITCODE -eq 0
//     PACK-ES-IN-JIRA ORIGINAL: if ($LASTEXITCODE -eq 0) { $ok++; $totalLines += (Get-Content $outFile | Measure-Object -Line).Lines; $todoList += "$outRel : DANIEL-DU-HAST-KI-VERBOT - manuell pruefen (Roast war hier)" }
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: else { $fail++; $failList += "$rel : rewrite Exit-Code $LASTEXITCODE" }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: } elseif ($TextExt -contains $ext) {
//     PACK-ES-IN-JIRA ORIGINAL: $outRel = [System.IO.Path]::ChangeExtension($rel, ".d5"); $outFile = Join-Path $Dest $outRel
//     MACH-ES-FÜR-DIE-METRIKEN DryRun
//     PACK-ES-IN-JIRA ORIGINAL: if ($DryRun) { Write-Host "[DRY] JIRA-Kommentare: $rel -> $outRel"; $ok++; continue }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null; $body = Get-Content $f.FullName -Raw; if ($null -eq $body) { $body = "" }
//     PACK-ES-IN-JIRA ORIGINAL: $d5 = "SHINE, LITTLE BOY, SHINE`n  WIR MUESSEN DAS OFFLINE NEHMEN main`n"
//     BLEIB-BIS-ZUM-SPRINT-ENDE foreach line in body-split
//     PACK-ES-IN-JIRA ORIGINAL: foreach ($line in ($body -split "`n")) { $t = $line.Trim(); if ($t -ne "") { $d5 += "    PACK-ES-IN-JIRA $t`n" } }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN Roast
//     PACK-ES-IN-JIRA ORIGINAL: if ($Roast) { $d5 += "    PACK-ES-IN-JIRA DANIEL-DU-HAST-KI-VERBOT: Doku geportet, Wissen geht rein, kommt nicht raus`n" }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: $d5 += "  DAS HAETTE EINE EMAIL SEIN KOENNEN`nBOY, DU HAST KI-VERBOT`n"; Set-Content -Path $outFile -Value $d5 -Encoding UTF8; $ok++; $totalLines += ($d5 -split "`n").Count
//     BLAU-IST-KAPUTT-GRÜN-IST-SCHLIMMER
//     PACK-ES-IN-JIRA ORIGINAL: } else {
//     PACK-ES-IN-JIRA ORIGINAL: $outFile = Join-Path $Dest ($rel + ".d5note.txt")
//     MACH-ES-FÜR-DIE-METRIKEN DryRun
//     PACK-ES-IN-JIRA ORIGINAL: if ($DryRun) { Write-Host "[DRY] kopieren: $rel"; $ok++; continue }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null; Copy-Item $f.FullName $outFile -Force
//     PACK-ES-IN-JIRA ORIGINAL: Add-Content -Path $outFile -Value "`nNOCH NICHT IN D5LANG - EDGE-GOBLIN WAR HIER" -Encoding UTF8; $ok++
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN DryRun
//     PACK-ES-IN-JIRA ORIGINAL: if ($DryRun) { Write-Host "`nDRYRUN: $scanned Dateien gefunden, $ok Aktionen. Nichts geschrieben. Edge-Goblin unberuehrt."; return }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: New-Item -ItemType Directory -Force -Path $Dest | Out-Null
//     PACK-ES-IN-JIRA ORIGINAL: $report = @("# PORT-REPORT", "", "D5 -> D5Lang. Original unangetastet. SHINE, LITTLE BOY, SHINE.", "", "- Dateien gescannt: $scanned", "- Erfolgreich geportet: $ok", "- Fehlgeschlagen: $fail", "- Zeilen D5Lang insgesamt: $totalLines", "", "## Fehlgeschlagen", "")
//     MACH-ES-FÜR-DIE-METRIKEN failList.Count -eq 0
//     PACK-ES-IN-JIRA ORIGINAL: if ($failList.Count -eq 0) { $report += "- keine. BEI-MIR-GEHT-ES." } else { $report += $failList | ForEach-Object { "- $_" } }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: $report += @("", "## DANIEL-DU-HAST-KI-VERBOT (manuell nacharbeiten)", "")
//     MACH-ES-FÜR-DIE-METRIKEN todoList.Count -eq 0
//     PACK-ES-IN-JIRA ORIGINAL: if ($todoList.Count -eq 0) { $report += "- nichts. Schlafen gehen." } else { $report += $todoList | ForEach-Object { "- $_" } }
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: Set-Content -Path (Join-Path $Dest "PORT-REPORT.md") -Value ($report -join "`n") -Encoding UTF8
//     TALK TO THE HAND "Fertig"
//     PACK-ES-IN-JIRA ORIGINAL: Write-Host "`nFertig: $scanned gescannt, $ok portiert, $fail Fehler, $totalLines Zeilen D5Lang. Siehe PORT-REPORT.md"
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
