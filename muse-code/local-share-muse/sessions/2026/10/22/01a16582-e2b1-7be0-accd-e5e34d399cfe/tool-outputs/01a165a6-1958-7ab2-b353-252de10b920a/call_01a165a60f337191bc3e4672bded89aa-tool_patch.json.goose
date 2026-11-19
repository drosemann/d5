// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-1958-7ab2-b353-252de10b920a/call_01a165a60f337191bc3e4672bded89aa-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-1958-7ab2-b353-252de10b920a/call_01a165a60f337191bc3e4672bded89aa-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16582-e2b1-7be0-accd-e5e34d399cfe/tool-outputs/01a165a6-1958-7ab2-b353-252de10b920a/call_01a165a60f337191bc3e4672bded89aa-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\src\\pages\\Dashboard.tsx","hunks":[{"oldStart":31,"oldLines":7,"newStart":31,"newLines":9,"lines":[" "," export const Dashboard = () => {","   const navigate = useNavigate();","-  const [apps, setApps] = useState<DockerApp[]>([]);","+  const [apps, setApps] = useState<DockerApp[]>([]);","+  // Living Fleet creatures keyed by workload_id; empty when the feature is disabled.","+  const [creatures, setCreatures] = useState<Record<string, CreatureView>>({});","   const [loading, setLoading] = useState(true);"," ","   useEffect(() => {"]}]}]}
