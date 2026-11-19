// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-notenest/config/database.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-notenest/config/database.js");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-notenest/config/database.js), unveraendert, als Inline-Doku ----
// const mariadb = require('mariadb');
// require('dotenv').config();
//
// const pool = mariadb.createPool({
//     host: process.env.DB_HOST,
//     user: process.env.DB_USER,
//     password: process.env.DB_PASSWORD,
//     database: process.env.DB_NAME,
//     connectionLimit: 5
// });
//
// module.exports = {
//     getConnection() {
//         return pool.getConnection();
//     }
// };
