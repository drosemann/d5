// Goose-Port-Spiegel von: tools/port-to-d5lang.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: tools/port-to-d5lang.ps1");
}

// ---- Original-Code (tools/port-to-d5lang.ps1), unveraendert, als Inline-Doku ----
// <#
// .SYNOPSIS
//   Portiert D5 nach D5Lang. Fasst das Original NICHT an, nur kopieren + porten.
// .BESCHREIBUNG
//   Scannt -Source (ausser .git, node_modules, .next, dist, build, d5lang/,
//   d5lang-port/), portet per `d5lang rewrite` und schreibt PORT-REPORT.md.
//   SHINE, LITTLE BOY, SHINE.
// .BEISPIEL
//   .\tools\port-to-d5lang.ps1 -Source "D:\D5" -Dest "D:\D5\d5lang-port" -Roast
//   .\tools\port-to-d5lang.ps1 -Source "D:\D5" -Dest "D:\D5\d5lang-port" -DryRun
// #>
// param(
//   [Parameter(Mandatory = $true)][string]$Source,
//   [Parameter(Mandatory = $true)][string]$Dest,
//   [string]$D5LangBin = "",
//   [switch]$Roast,
//   [switch]$DryRun
// )
//
// $ErrorActionPreference = "Stop"
//
// $SkipDirs = @(".git", "node_modules", ".next", "dist", "build", "d5lang", "d5lang-port", ".hg", ".sl", ".eden", ".muse", ".agents", "venv", ".venv", "site-packages", "__pycache__")
// $CodeExt = @{
//   ".py" = "python"; ".js" = "js"; ".ts" = "ts"; ".jsx" = "jsx"; ".tsx" = "tsx";
//   ".java" = "java"; ".rs" = "rust"; ".go" = "go"; ".c" = "c"; ".cpp" = "cpp"
// }
// $TextExt = @(".md", ".txt")
//
// if (-not (Test-Path $Source)) { Write-Error "Source nicht gefunden: $Source" }
// $Source = (Resolve-Path $Source).Path.TrimEnd('\', '/')
// function Get-RelPath($Full) { return $Full.Substring($Source.Length + 1) }
//
// if ($D5LangBin -eq "") {
//   $D5LangBin = Join-Path $Source "d5lang\d5lang"
//   if ($IsWindows -or $env:OS -match "Windows") { $D5LangBin += ".exe" }
// }
// if (-not $DryRun -and -not (Test-Path $D5LangBin)) {
//   Write-Error "d5lang Binary nicht gefunden: $D5LangBin. Erst: cd d5lang; gcc d5lang.c -o d5lang"
// }
//
// $files = Get-ChildItem -Path $Source -Recurse -File | Where-Object {
//   $rel = Get-RelPath $_.FullName
//   $parts = $rel -split "[\\/]"
//   foreach ($p in $parts) { if ($SkipDirs -contains $p) { return $false } }
//   return $true
// }
//
// $scanned = 0; $ok = 0; $fail = 0
// $failList = @(); $todoList = @(); $totalLines = 0
//
// foreach ($f in $files) {
//   $scanned++
//   $rel = Get-RelPath $f.FullName
//   $ext = [System.IO.Path]::GetExtension($f.Name).ToLower()
//   if ($CodeExt.ContainsKey($ext)) {
//     $lang = $CodeExt[$ext]
//     $outRel = [System.IO.Path]::ChangeExtension($rel, ".d5")
//     $outFile = Join-Path $Dest $outRel
//     if ($DryRun) {
//       Write-Host "[DRY] rewrite --from $lang : $rel -> $outRel"
//       $ok++
//       continue
//     }
//     New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null
//     $extra = @()
//     if ($Roast) { $extra += "--roast" }
//     & $D5LangBin rewrite --from $lang -i $f.FullName -o $outFile @extra
//     if ($LASTEXITCODE -eq 0) {
//       $ok++
//       $totalLines += (Get-Content $outFile | Measure-Object -Line).Lines
//       $todoList += "$outRel : DANIEL-DU-HAST-KI-VERBOT - manuell pruefen (Roast war hier)"
//     } else {
//       $fail++
//       $failList += "$rel : rewrite Exit-Code $LASTEXITCODE"
//     }
//   } elseif ($TextExt -contains $ext) {
//     $outRel = [System.IO.Path]::ChangeExtension($rel, ".d5")
//     $outFile = Join-Path $Dest $outRel
//     if ($DryRun) { Write-Host "[DRY] JIRA-Kommentare: $rel -> $outRel"; $ok++; continue }
//     New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null
//     $body = Get-Content $f.FullName -Raw
//     if ($null -eq $body) { $body = "" }
//     $d5 = "SHINE, LITTLE BOY, SHINE`n  WIR MUESSEN DAS OFFLINE NEHMEN main`n"
//     foreach ($line in ($body -split "`n")) {
//       $t = $line.Trim()
//       if ($t -ne "") { $d5 += "    PACK-ES-IN-JIRA $t`n" }
//     }
//     if ($Roast) { $d5 += "    PACK-ES-IN-JIRA DANIEL-DU-HAST-KI-VERBOT: Doku geportet, Wissen geht rein, kommt nicht raus`n" }
//     $d5 += "  DAS HAETTE EINE EMAIL SEIN KOENNEN`nBOY, DU HAST KI-VERBOT`n"
//     Set-Content -Path $outFile -Value $d5 -Encoding UTF8
//     $ok++
//     $totalLines += ($d5 -split "`n").Count
//   } else {
//     $outFile = Join-Path $Dest ($rel + ".d5note.txt")
//     if ($DryRun) { Write-Host "[DRY] kopieren: $rel"; $ok++; continue }
//     New-Item -ItemType Directory -Path (Split-Path $outFile) -Force | Out-Null
//     Copy-Item $f.FullName $outFile -Force
//     Add-Content -Path $outFile -Value "`nNOCH NICHT IN D5LANG - EDGE-GOBLIN WAR HIER" -Encoding UTF8
//     $ok++
//   }
// }
//
// if ($DryRun) {
//   Write-Host "`nDRYRUN: $scanned Dateien gefunden, $ok Aktionen. Nichts geschrieben. Edge-Goblin unberuehrt."
//   return
// }
//
// New-Item -ItemType Directory -Path $Dest -Force | Out-Null
// $report = @(
//   "# PORT-REPORT",
//   "",
//   "D5 -> D5Lang. Original unangetastet. SHINE, LITTLE BOY, SHINE.",
//   "",
//   "- Dateien gescannt: $scanned",
//   "- Erfolgreich geportet: $ok",
//   "- Fehlgeschlagen: $fail",
//   "- Zeilen D5Lang insgesamt: $totalLines",
//   "",
//   "## Fehlgeschlagen",
//   ""
// )
// if ($failList.Count -eq 0) { $report += "- keine. BEI-MIR-GEHT-ES." }
// else { $report += $failList | ForEach-Object { "- $_" } }
// $report += @("", "## DANIEL-DU-HAST-KI-VERBOT (manuell nacharbeiten)", "")
// if ($todoList.Count -eq 0) { $report += "- nichts. Schlafen gehen." }
// else { $report += $todoList | ForEach-Object { "- $_" } }
// Set-Content -Path (Join-Path $Dest "PORT-REPORT.md") -Value ($report -join "`n") -Encoding UTF8
//
// Write-Host "`nFertig: $scanned gescannt, $ok portiert, $fail Fehler, $totalLines Zeilen D5Lang. Siehe PORT-REPORT.md"
//
