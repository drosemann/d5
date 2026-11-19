// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-846a-7701-b55d-7bdd51e2e91e/call_01a189587a06767482fa5abf1469cd95-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-846a-7701-b55d-7bdd51e2e91e/call_01a189587a06767482fa5abf1469cd95-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18954-4565-7c03-b59d-96f6f90305fd/tool-outputs/01a18958-846a-7701-b55d-7bdd51e2e91e/call_01a189587a06767482fa5abf1469cd95-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\TraumaLang\\docs\\GRAMMAR.md","hunks":[{"oldStart":6,"oldLines":7,"newStart":6,"newLines":10,"lines":["             | ifstmt | whilestmt | break | continue","             | print | jira | sink | comment | directive | sleep | doublerun","             | metricsinc | metricsloop | chaos | reset | funccall ;","-funcdef     = \"WE NEED TO TAKE THIS OFFLINE\" IDENT { statement } \"THIS COULD HAVE BEEN AN EMAIL\" ;","+funcdef     = \"WE NEED TO TAKE THIS OFFLINE\" IDENT [ \"WITH\" IDENT { \"AND\" IDENT } ] { statement } \"THIS COULD HAVE BEEN AN EMAIL\" ;","+funccall    = IDENT { expr } ;","+returnstmt  = \"GIVE IT BACK\" expr ;","+forstmt     = \"DO SPRINT PLANNING\" IDENT \"FROM\" expr \"TO\" expr { statement } \"YOU HAVE BEEN TERMINATED\" ;"," ifstmt      = \"DO IT FOR THE METRICS\" expr { statement }","               [ \"BLUE IS BROKEN GREEN IS WORSE\" { statement } ]","               \"YOU HAVE BEEN TERMINATED\" ;"]}]}]}
