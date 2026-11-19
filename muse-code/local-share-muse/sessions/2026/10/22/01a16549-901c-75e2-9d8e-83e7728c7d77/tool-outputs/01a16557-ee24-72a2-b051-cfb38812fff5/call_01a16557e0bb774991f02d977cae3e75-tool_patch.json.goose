// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-ee24-72a2-b051-cfb38812fff5/call_01a16557e0bb774991f02d977cae3e75-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-ee24-72a2-b051-cfb38812fff5/call_01a16557e0bb774991f02d977cae3e75-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-ee24-72a2-b051-cfb38812fff5/call_01a16557e0bb774991f02d977cae3e75-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\infra\\nginx.conf","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":20,"lines":["+events {}","+http {","+  map $http_upgrade $connection_upgrade { default upgrade; '' close; }","+  server {","+    listen 443 ssl;","+    # ssl_certificate / ssl_certificate_key set by host provisioning (certbot).","+    # Only NGINX is public. Postgres/Redis live on the private compose network.","+    location / {","+      proxy_pass http://server:3000;","+      proxy_http_version 1.1;","+      proxy_set_header Upgrade $http_upgrade;","+      proxy_set_header Connection $connection_upgrade;","+      proxy_set_header Host $host;","+    }","+    location /admin/ {","+      proxy_pass http://server:3000/;","+      proxy_set_header Host $host;","+    }","+  }","+}"]}]}]}
