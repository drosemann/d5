#!/bin/sh
# CLI-/Explain-/Fehler-Tests (nur Ablage, wird hier nicht ausgefuehrt).
# Vorgesehene manuelle Pruefung nach `make`:
set -u
T=./traumalang
$T --help            || exit 1
$T --version         || exit 1
$T build examples/hello_world_enterprise.tl      || exit 1
$T build examples/error_handling.tl              || exit 1
$T rewrite --from python -i examples/hello.py -o /tmp/hello.tl          || exit 1
$T rewrite --from rust -i tests/_in.txt -o /tmp/r.tl --roast            || exit 1
$T --explain examples/hello_world_enterprise.tl  || exit 1
! $T build /kein/solcher/pfad.tl                 # fehlende Datei muss fehlschlagen
! $T rewrite --from cobol -i examples/hello.py -o /tmp/x.tl  # unbekannte Sprache
! $T frobnicate                                   # unbekanntes Kommando
echo "cli ok (manuell)"
