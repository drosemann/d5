// Goose-Port-Spiegel von: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-e245-7e82-8559-8d419aee4e48/call_01a16557d64d711cab7389b2213b838d-tool_patch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-e245-7e82-8559-8d419aee4e48/call_01a16557d64d711cab7389b2213b838d-tool_patch.json");
}

// ---- Original-Code (muse-code/local-share-muse/sessions/2026/10/22/01a16549-901c-75e2-9d8e-83e7728c7d77/tool-outputs/01a16557-e245-7e82-8559-8d419aee4e48/call_01a16557d64d711cab7389b2213b838d-tool_patch.json), unveraendert, als Inline-Doku ----
// {"files":[{"path":"\\\\?\\C:\\Users\\danie\\OneDrive\\github-repos\\stranded-horizons\\docker-compose.yml","hunks":[{"oldStart":1,"oldLines":0,"newStart":1,"newLines":27,"lines":["+services:","+  supabase-db:","+    image: postgres:15","+    networks: [internal]","+    environment:","+      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}","+    volumes: [pgdata:/var/lib/postgresql/data]","+  server:","+    build: ./server","+    networks: [internal]","+    environment:","+      DATABASE_URL: postgres://postgres:${POSTGRES_PASSWORD}@supabase-db:5432/postgres","+      REDIS_URL: redis://redis:6379","+      SUPABASE_JWT_SECRET: ${SUPABASE_JWT_SECRET}","+      CORS_ORIGINS: ${CORS_ORIGINS}","+  redis:","+    image: redis:7-alpine","+    networks: [internal]","+  nginx:","+    image: nginx:alpine","+    ports: ['443:443']","+    networks: [internal]","+    volumes: [./infra/nginx.conf:/etc/nginx/nginx.conf:ro]","+networks:","+  internal: {}","+volumes:","+  pgdata: {}"]}]}]}
