// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-shortify/database/init.sql
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-shortify/database/init.sql");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-shortify/database/init.sql), unveraendert, als Inline-Doku ----
// CREATE TABLE IF NOT EXISTS urls (
//     id INT AUTO_INCREMENT PRIMARY KEY,
//     original_url VARCHAR(2048) NOT NULL,
//     short_code VARCHAR(10) UNIQUE NOT NULL,
//     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
//     visits INT DEFAULT 0
// );
