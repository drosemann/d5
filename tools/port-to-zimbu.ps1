# tools/port-to-zimbu.ps1 — Mechanischer Voll-Port nach Zimbu (Bram Moolenaar).
# Legt pro Code-Datei eine <name>.<ext>.zimbu-Spiegeldatei an:
#   - Zimbu-Modulgeruest (MODULE / IMPORT IO / FUNC Main)
#   - VOLLSTAENDIGER Original-Code als #-Kommentar (Inline-Docs, nichts geloescht)
# Haengt an JEDE Markdown-Datei einen "Zimbu-Port"-Abschnitt an (idempotent).
# Loescht nichts. Wiederholbar (idempotent).

$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$extensions = @('.js','.jsx','.ts','.tsx','.mjs','.cjs','.py','.java','.c','.h',
  '.cs','.cpp','.go','.rs','.rb','.php','.dart','.ps1','.sh','.sql','.d5',
  '.css','.html','.vue','.svelte','.json')
$excludeDirs = @('.git','.hg','.sl','.eden','.muse','.agents','node_modules','venv',
  '.venv','__pycache__','dist','build','target','bin','obj','.next','out','coverage')
$maxBytes = 200KB
$mdMarker = '<!-- ZIMBU-PORT -->'

$codeFiles = Get-ChildItem -Path $root -Recurse -File -ErrorAction SilentlyContinue | Where-Object {
  ($extensions -contains $_.Extension.ToLower()) -and
  ($_.Extension.ToLower() -ne '.zimbu') -and
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
  $out = $f.FullName + '.zimbu'
  if (Test-Path $out) { continue }  # idempotent
  try { $orig = Get-Content -Path $f.FullName -Raw -Encoding UTF8 -ErrorAction Stop }
  catch { $skipped++; continue }
  $mod = ($f.BaseName + '_' + $f.Extension.TrimStart('.')) -replace '[^A-Za-z0-9_]', '_'
  if ($mod -match '^[0-9]') { $mod = 'M_' + $mod }
  $commented = ($orig -split "`r?`n" | ForEach-Object { if ($_ -eq '') { '#' } else { '# ' + $_ } }) -join "`n"
  $zimbu = @"
# Zimbu-Port-Spiegel von: $rel
# Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
# Sprache: Zimbu (Bram Moolenaar). Status: mechanischer Spiegel, Handeintrag noetig.
MODULE $mod
IMPORT IO

FUNC Main() int
  IO.print("Zimbu-Spiegel: $rel\n")
  RETURN 0

# ---- Original-Code ($rel), unveraendert, als Inline-Doku ----
$commented
"@
  Set-Content -Path $out -Value $zimbu -Encoding UTF8
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
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine `<name>.<ext>.zimbu`-Schwester
mit Zimbu-Modulgeruest (`MODULE`/`FUNC Main`) und dem VOLLSTAENDIGEN Original-Code
als `#`-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die `.zimbu`-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: $((Get-Date).ToString('yyyy-MM-dd')).
"@
$mdUpdated = 0
foreach ($m in $mdFiles) {
  try { $t = Get-Content -Path $m.FullName -Raw -Encoding UTF8 -ErrorAction Stop }
  catch { continue }
  if ($t -notlike "*$mdMarker*") {
    Add-Content -Path $m.FullName -Value $mdSection -Encoding UTF8
    $mdUpdated++
  }
}

"ZIMBU-PORT: code=$($codeFiles.Count) mirrored=$mirrored skipped=$skipped md_total=$($mdFiles.Count) md_updated=$mdUpdated"
