// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/server/src/db.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/server/src/db.js");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/server/src/db.js), unveraendert, als Inline-Doku ----
// import pg from 'pg';
//
// const pool = new pg.Pool({
//   connectionString: process.env.DATABASE_URL,
//   max: 10,
// });
//
// export const db = {
//   query: (text, params) => pool.query(text, params),
// };
//
