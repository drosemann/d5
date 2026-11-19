// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ae-f3bc-7fb1-a887-641726842182/call_01a165aee7427614896c522bfbf08fea-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ae-f3bc-7fb1-a887-641726842182/call_01a165aee7427614896c522bfbf08fea-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165ae-f3bc-7fb1-a887-641726842182/call_01a165aee7427614896c522bfbf08fea-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\orchestrator-agent\\fleet_collect.py","hunks":[{"oldStart":115,"oldLines":10,"newStart":115,"newLines":15,"lines":[" ","     vm = VPSManager()","     instances = getattr(vm, \"vps_instances\", {}) or {}","+    try:","+        stored = living_fleet._load_all()","+    except Exception:","+        stored = {}","     views: Dict[str, Dict[str, Any]] = {}","     for container_id, info in instances.items():","         try:","-            signals = await _docker_signals(vm, container_id, info or {})","+            prev_cpu = (stored.get(container_id) or {}).get(\"last_signals\", {}).get(\"cpu_prev\")","+            signals = await _docker_signals(vm, container_id, info or {}, prev_cpu)","             age = _days_since((info or {}).get(\"created_at\"))","             if age is not None:","                 signals[\"days_since_deploy\"] = age"]}]}]}
