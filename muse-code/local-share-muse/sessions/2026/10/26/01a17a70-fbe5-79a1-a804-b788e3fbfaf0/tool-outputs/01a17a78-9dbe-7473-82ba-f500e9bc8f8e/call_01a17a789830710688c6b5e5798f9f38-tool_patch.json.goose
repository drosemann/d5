// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a78-9dbe-7473-82ba-f500e9bc8f8e/call_01a17a789830710688c6b5e5798f9f38-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a78-9dbe-7473-82ba-f500e9bc8f8e/call_01a17a789830710688c6b5e5798f9f38-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/26/01a17a70-fbe5-79a1-a804-b788e3fbfaf0/tool-outputs/01a17a78-9dbe-7473-82ba-f500e9bc8f8e/call_01a17a789830710688c6b5e5798f9f38-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\infra-pilot\\services\\management-panel\\server\\index.ts","hunks":[{"oldStart":65,"oldLines":7,"newStart":65,"newLines":8,"lines":[" } from './doctor.ts';"," import { runBenchmark } from './benchmark.ts';"," import { buildReport, reportToCsv, reportToPdf } from './reports.ts';","-import { buildPlan } from './assistant.ts';","+import { buildPlan } from './assistant.ts';","+import { FLAG_REGISTRY, evaluateFlag, validateFlagKey, validateRule, envOverride } from './feature-flags.ts';"," import { executeGraphQL } from './graphql.ts';"," // plugin-registry and change-approval-engine moved to experimental"," "]}]}]}
