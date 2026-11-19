// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165af-0441-7c21-a4ab-fec96a57dc36/call_01a165aef76a7509972511b0f3b72b65-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165af-0441-7c21-a4ab-fec96a57dc36/call_01a165aef76a7509972511b0f3b72b65-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165af-0441-7c21-a4ab-fec96a57dc36/call_01a165aef76a7509972511b0f3b72b65-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\fleet_collect.py","hunks":[{"oldStart":123,"oldLines":7,"newStart":123,"newLines":9,"lines":["     views: Dict[str, Dict[str, Any]] = {}","     for container_id, info in instances.items():","         try:","-            prev_cpu = (stored.get(container_id) or {}).get(\"last_signals\", {}).get(\"cpu_prev\")","+            prev_cpu = ((stored.get(container_id) or {}).get(\"last_signals\") or {}).get(\"cpu_prev\")","+            if not isinstance(prev_cpu, dict):","+                prev_cpu = None","             signals = await _docker_signals(vm, container_id, info or {}, prev_cpu)","             age = _days_since((info or {}).get(\"created_at\"))","             if age is not None:"]}]}]}
