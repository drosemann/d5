// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896c-0432-7161-aae1-445bacd68614/call_01a1896bf9917305ad2d97bdd7b1638c-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896c-0432-7161-aae1-445bacd68614/call_01a1896bf9917305ad2d97bdd7b1638c-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/29/01a18967-8f34-75e3-bd91-9db28a27fadd/tool-outputs/01a1896c-0432-7161-aae1-445bacd68614/call_01a1896bf9917305ad2d97bdd7b1638c-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\Agentenplattform\\apps\\frontend\\Dockerfile","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":9,"lines":["+FROM node:20-alpine AS build","+WORKDIR /app","+COPY package.json ./","+RUN npm install","+COPY . .","+RUN npm run build","+FROM caddy:2-alpine","+COPY --from=build /app/dist /srv","+COPY Caddyfile /etc/caddy/Caddyfile"]}]}]}
