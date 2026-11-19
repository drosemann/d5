// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a39-7183-9381-c88bfb6d4667/call_01a165a61c637616a2fb4155f2fb7b83-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a39-7183-9381-c88bfb6d4667/call_01a165a61c637616a2fb4155f2fb7b83-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-2a39-7183-9381-c88bfb6d4667/call_01a165a61c637616a2fb4155f2fb7b83-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\pages\\Dashboard.tsx","hunks":[{"oldStart":45,"oldLines":7,"newStart":45,"newLines":16,"lines":["   const loadData = async () => {","     try {","       const appsData = await apiClient.listApps();","-      setApps(appsData);","+      setApps(appsData);","+      try {","+        const fleet = await apiClient.listCreatures();","+        const byId: Record<string, CreatureView> = {};","+        for (const c of fleet) byId[c.workload_id] = c;","+        setCreatures(byId);","+      } catch {","+        // Fleet proxy disabled or unreachable — cards render without pets.","+        setCreatures({});","+      }","     } catch (error) {","       toast.error(\"Failed to load dashboard\");","     } finally {"]}]}]}
