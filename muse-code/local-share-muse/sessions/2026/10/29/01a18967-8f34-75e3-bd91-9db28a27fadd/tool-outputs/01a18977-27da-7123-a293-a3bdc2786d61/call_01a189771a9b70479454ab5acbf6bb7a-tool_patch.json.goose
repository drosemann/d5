// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18977-27da-7123-a293-a3bdc2786d61/call_01a189771a9b70479454ab5acbf6bb7a-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18977-27da-7123-a293-a3bdc2786d61/call_01a189771a9b70479454ab5acbf6bb7a-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a18977-27da-7123-a293-a3bdc2786d61/call_01a189771a9b70479454ab5acbf6bb7a-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\frontend\\src\\seiten.tsx","hunks":[{"oldStart":1,"oldLines":8,"newStart":1,"newLines":9,"lines":[" import React, { useEffect, useState } from \"react\";"," import \"./styles.css\";","-import { Layout } from \"./app\";"," "," type Aufgabe = { id: string; agent: string; titel: string; status: string };","+type Inserat = { id: string; titel: string; preis: number | null; ranking: number };","+type Tagesplan = { fixe_termine: {titel:string;von:string;bis:string}[]; vorschlaege: {empfehlung:string}[]; konflikte: {a:string;b:string;hinweis:string}[]; hinweis: string };"," "," function useJson<T>(url: string, fallback: T): T {","   const [d, setD] = useState<T>(fallback);"]}]}]}
