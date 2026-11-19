// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/discord-service/modules/validation.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/discord-service/modules/validation.js");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/discord-service/modules/validation.js), unveraendert, als Inline-Doku ----
// function validateEmail(email) {
//   const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
//   return re.test(String(email).toLowerCase());
// }
//
// function validateUsername(username) {
//   const re = /^[a-zA-Z0-9_]{3,20}$/;
//   return re.test(username);
// }
//
// function validatePassword(password) {
//   return password.length >= 8 &&
//     /[A-Za-z]/.test(password) &&
//     /[0-9]/.test(password) &&
//     /[^A-Za-z0-9]/.test(password);
// }
//
// module.exports = { validateEmail, validateUsername, validatePassword };
//
