// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/setup.sh
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/setup.sh");
}

// ---- Original-Code (projects/github-repos-infra-pilot/setup.sh), unveraendert, als Inline-Doku ----
// #!/bin/bash
// set -e
//
// echo "Infra Pilot Setup"
// echo "================="
//
// cp .env.example .env 2>/dev/null || echo ".env already exists"
// cp services/management-panel/.env.example services/management-panel/.env.local 2>/dev/null || true
// cp services/discord-service/.env.example services/discord-service/.env 2>/dev/null || true
//
// echo "Environment files created"
// echo "Edit .env to configure your setup"
// echo "Run: docker-compose up -d"
//
