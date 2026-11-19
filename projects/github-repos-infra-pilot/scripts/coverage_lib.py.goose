// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/scripts/coverage_lib.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/scripts/coverage_lib.py");
}

// ---- Original-Code (projects/github-repos-infra-pilot/scripts/coverage_lib.py), unveraendert, als Inline-Doku ----
// #!/usr/bin/env python3
// """Shared helpers for parsing coverage.xml reports.
//
// Consolidates the XML parsing that was duplicated across
// coverage_report.py, coverage_summary.py and coverage_badge_updater.py.
// """
//
// from __future__ import annotations
//
// import xml.etree.ElementTree as ET
// from pathlib import Path
// from typing import Optional
//
//
// def read_line_rate(xml_path: Path) -> Optional[float]:
//     """Return the ``line-rate`` attribute of the coverage.xml root.
//
//     Returns ``None`` when the file is missing, unparsable, or the
//     attribute is absent/invalid so callers can decide how to react.
//     """
//     if not xml_path.exists():
//         return None
//     try:
//         root = ET.parse(xml_path).getroot()
//     except (ET.ParseError, OSError):
//         return None
//     line_rate = root.attrib.get("line-rate")
//     if line_rate is None:
//         return None
//     try:
//         return float(line_rate)
//     except (ValueError, TypeError):
//         return None
//
