// Goose-Port-Spiegel von: projects/archive-unsorted-goose-desktop-companion/run-all.ps1
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-goose-desktop-companion/run-all.ps1");
}

// ---- Original-Code (projects/archive-unsorted-goose-desktop-companion/run-all.ps1), unveraendert, als Inline-Doku ----
// Get-ChildItem -Filter "goose-*.ps1" | Where-Object { $_.Name -ne "run-all.ps1" } | ForEach-Object {
//     Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$($_.FullName)`""
// }
//
