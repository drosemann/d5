// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-77c8-7cb0-a2b7-b391dfe69630/call_01a169a061d5765998818a520e91c73c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-77c8-7cb0-a2b7-b391dfe69630/call_01a169a061d5765998818a520e91c73c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/23/01a1699b-382e-7593-9559-6538baf01e6f/tool-outputs/01a169a0-77c8-7cb0-a2b7-b391dfe69630/call_01a169a061d5765998818a520e91c73c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\src\\core\\EventBus.js","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":16,"lines":["+// Minimal event bus for side effects only (audio/UI). Core sim stays direct calls.","+export function createEventBus() {","+  const handlers = new Map();","+  return {","+    on(event, fn) {","+      if (!handlers.has(event)) handlers.set(event, new Set());","+      handlers.get(event).add(fn);","+      return () => handlers.get(event).delete(fn);","+    },","+    emit(event, payload) {","+      const set = handlers.get(event);","+      if (!set) return;","+      for (const fn of [...set]) { try { fn(payload); } catch { /* subscriber error isolated */ } }","+    }","+  };","+}"]}]}]}
