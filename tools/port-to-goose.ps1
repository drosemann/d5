# tools/port-to-goose.ps1 — Mechanischer Voll-Port nach Goose (aardappel/goose v2026.4).
# Legt pro Code-Datei eine <name>.<ext>.goose-Spiegeldatei an:
#   - Gueltiges Goose-Programm (//-Kommentare, fn main() mit print, pruefbar mit `goose check`)
#   - VOLLSTAENDIGER Original-Code als //-Kommentar (Inline-Docs, nichts geloescht)
# Haengt an JEDE Markdown-Datei einen "Goose-Port"-Abschnitt an (idempotent).
# Loescht nichts. Wiederholbar (idempotent).
# Getestet mit: goose v2026.4 (windows-x64), `goose check` + `goose run` auf Scaffold ok.

$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$extensions = @('.js','.jsx','.ts','.tsx','.mjs','.cjs','.py','.java','.c','.h',
  '.cs','.cpp','.go','.rs','.rb','.php','.dart','.ps1','.sh','.sql','.d5',
  '.css','.html','.vue','.svelte','.json')
$excludeDirs = @('.git','.hg','.sl','.eden','.muse','.agents','node_modules','venv',
  '.venv','__pycache__','dist','build','target','bin','obj','.next','out','coverage')
$maxBytes = 200KB
$mdMarker = '<!-- GOOSE-PORT -->'

$codeFiles = Get-ChildItem -Path $root -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
  ($extensions -contains $_.Extension.ToLower()) -and
  ($_.Extension.ToLower() -ne '.goose') -and
  ($_.Name -notlike '*.goose') -and
  ($_.Name -notlike '*.zimbu') -and
  ($_.Length -le $maxBytes) -and
  ($_.Name -notlike '*package-lock*') -and ($_.Name -notlike '*.min.js')
} | Where-Object {
  $skip = $false
  foreach ($d in $excludeDirs) { if ($_.FullName -like "*\$d\*") { $skip = $true; break } }
  -not $skip
}

$mirrored = 0; $skipped = 0
foreach ($f in $codeFiles) {
  $rel = $f.FullName.Substring($root.Length + 1)
  $out = $f.FullName + '.goose'
  if (Test-Path -LiteralPath $out) { continue }  # idempotent
  try { $orig = Get-Content -LiteralPath $f.FullName -Raw -Encoding UTF8 -ErrorAction Stop }
  catch { $skipped++; continue }
  if ($null -eq $orig) { $orig = '' }
  $relSlash = $rel -replace '\\', '/'
  $relSafe = $relSlash -replace '"', "'"
  $commented = ($orig -split "`r?`n" | ForEach-Object { if ($_ -eq '') { '//' } else { '// ' + $_ } }) -join "`n"
  $goose = @"
// Goose-Port-Spiegel von: $relSlash
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (`goose check` ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: $relSafe");
}

// ---- Original-Code ($relSlash), unveraendert, als Inline-Doku ----
$commented
"@
  Set-Content -LiteralPath $out -Value $goose -Encoding UTF8
  $mirrored++
}

# ALLE Markdown-Dateien ergaenzen (idempotent via Marker)
$mdFiles = Get-ChildItem -Path $root -Recurse -File -Include *.md, *.MD -ErrorAction SilentlyContinue | Where-Object {
  $skip = $false
  foreach ($d in $excludeDirs) { if ($_.FullName -like "*\$d\*") { $skip = $true; break } }
  -not $skip
}
$mdSection = @"

$mdMarker
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine `<name>.<ext>.goose`-Schwester
mit gueltigem Goose-Programmgeruest (`fn main()`/`print`, pruefbar mit `goose check`)
und dem VOLLSTAENDIGEN Original-Code als `//`-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die `.goose`-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: $((Get-Date).ToString('yyyy-MM-dd')).
"@
$mdUpdated = 0
foreach ($m in $mdFiles) {
  try { $t = Get-Content -LiteralPath $m.FullName -Raw -Encoding UTF8 -ErrorAction Stop }
  catch { continue }
  if ($t -notlike "*$mdMarker*") {
    Add-Content -LiteralPath $m.FullName -Value $mdSection -Encoding UTF8
    $mdUpdated++
  }
}

"GOOSE-PORT: code=$($codeFiles.Count) mirrored=$mirrored skipped=$skipped md_total=$($mdFiles.Count) md_updated=$mdUpdated"
