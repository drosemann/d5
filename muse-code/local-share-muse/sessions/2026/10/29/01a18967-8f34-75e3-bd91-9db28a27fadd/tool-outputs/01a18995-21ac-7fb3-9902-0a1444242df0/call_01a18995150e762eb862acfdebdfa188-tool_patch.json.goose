// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-21ac-7fb3-9902-0a1444242df0/call_01a18995150e762eb862acfdebdfa188-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-21ac-7fb3-9902-0a1444242df0/call_01a18995150e762eb862acfdebdfa188-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18995-21ac-7fb3-9902-0a1444242df0/call_01a18995150e762eb862acfdebdfa188-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\backend\\app\\tools\\executor.py","hunks":[{"oldStart":73,"oldLines":6,"newStart":73,"newLines":8,"lines":["         ergebnis = handler(db, args)","         db.add(models.AuditLog(actor=agent_id, aktion=f\"tool.{tool_id}\", detail=str(args)[:500]))","         db.commit()","+        if isinstance(ergebnis, dict) and \"fehler\" in ergebnis:","+            return ergebnis  # Handler-Fehler ehrlich weitergeben, nicht als Erfolg","         return {\"ergebnis\": ergebnis}","     except Exception as e:  # noqa: BLE001 – Fehler gehen an den Agenten, nicht ins Nichts","         return {\"fehler\": f\"{tool_id} fehlgeschlagen: {e}\"}"]}]}]}
