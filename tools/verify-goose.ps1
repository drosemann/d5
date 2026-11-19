# tools/verify-goose.ps1 — Prueft: (1) alle .goose-Spiegel vorhanden, (2) Geruest ok (fn main/print),
# (3) alle MDs mit Marker, (4) Skript enthaelt keine Loeschbefehle. Braucht keinen Goose-Compiler.
$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$excludeDirs = @('.git','.hg','.sl','.eden','.muse','.agents','node_modules','venv','.venv','__pycache__','dist','build','target','bin','obj','.next','out','coverage')
function InScope($p) { foreach ($d in $excludeDirs) { if ($p -like "*\$d\*") { return $false } }; return $true }

$gooseFiles = Get-ChildItem -Path $root -Recurse -File -Filter *.goose -ErrorAction SilentlyContinue | Where-Object { InScope $_.FullName }
'GOOSE_FILES=' + $gooseFiles.Count

$badScaffold = 0
foreach ($g in $gooseFiles) {
  $head = Get-Content -LiteralPath $g.FullName -TotalCount 8 -Encoding UTF8 -ErrorAction SilentlyContinue | Out-String
  if ($head -notlike '*fn main()*' -or $head -notlike '*Goose-Port-Spiegel*') { $badScaffold++ }
}
'GOOSE_BAD_SCAFFOLD=' + $badScaffold

$mdMiss = @()
$mdTotal = 0
Get-ChildItem -Path $root -Recurse -File -Include *.md, *.MD -ErrorAction SilentlyContinue | Where-Object { InScope $_.FullName } | ForEach-Object {
  $mdTotal++
  $t = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
  if ($t -notlike '*GOOSE-PORT*') { $mdMiss += $_.FullName.Substring($root.Length + 1) }
}
'MD_TOTAL=' + $mdTotal
'MD_MISSING=' + $mdMiss.Count
$mdMiss | Select-Object -First 20 | ForEach-Object { 'MISS: ' + $_ }

$portScript = Get-Content (Join-Path $root 'tools\port-to-goose.ps1') -Raw
'PORT_SCRIPT_HAS_DELETE=' + ($portScript -match 'Remove-Item|del |erase |git clean')
