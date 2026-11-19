// Goose-Port-Spiegel von: tools/verify-zimbu.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: tools/verify-zimbu.ps1");
}

// ---- Original-Code (tools/verify-zimbu.ps1), unveraendert, als Inline-Doku ----
// # tools/verify-zimbu.ps1 — Prueft: (1) alle .zimbu-Spiegel vorhanden, (2) alle MDs mit Marker, (3) Skript enthaelt keine Loeschbefehle.
// $ErrorActionPreference = 'Continue'
// $root = Split-Path -Parent $PSScriptRoot
// $excludeDirs = @('.git','.hg','.sl','.eden','.muse','.agents','node_modules','venv','.venv','__pycache__','dist','build','target','bin','obj','.next','out','coverage')
// function InScope($p) { foreach ($d in $excludeDirs) { if ($p -like "*\$d\*") { return $false } }; return $true }
//
// $zimbu = Get-ChildItem -Path $root -Recurse -File -Filter *.zimbu -ErrorAction SilentlyContinue | Where-Object { InScope $_.FullName }
// 'ZIMBU_FILES=' + $zimbu.Count
//
// $mdMiss = @()
// $mdTotal = 0
// Get-ChildItem -Path $root -Recurse -File -Include *.md, *.MD -ErrorAction SilentlyContinue | Where-Object { InScope $_.FullName } | ForEach-Object {
//   $mdTotal++
//   $t = Get-Content $_.FullName -Raw -Encoding UTF8
//   if ($t -notlike '*ZIMBU-PORT*') { $mdMiss += $_.FullName.Substring($root.Length + 1) }
// }
// 'MD_TOTAL=' + $mdTotal
// 'MD_MISSING=' + $mdMiss.Count
// $mdMiss | Select-Object -First 20 | ForEach-Object { 'MISS: ' + $_ }
//
// $portScript = Get-Content (Join-Path $root 'tools\port-to-zimbu.ps1') -Raw
// 'PORT_SCRIPT_HAS_DELETE=' + ($portScript -match 'Remove-Item|del |erase |git clean')
//
