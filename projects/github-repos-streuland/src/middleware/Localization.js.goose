// Goose-Port-Spiegel von: projects/github-repos-streuland/src/middleware/Localization.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/middleware/Localization.js");
}

// ---- Original-Code (projects/github-repos-streuland/src/middleware/Localization.js), unveraendert, als Inline-Doku ----
// // Minimal localization helper: picks locale from Accept-Language header (stubbed)
// function pickLocale(acceptLanguageHeader, available = ['en','de']) {
//   if (!acceptLanguageHeader) return 'en';
//   const langs = acceptLanguageHeader.split(',').map(s => s.trim().split(';')[0]);
//   for (const l of langs) {
//     const short = l.split('-')[0];
//     if (available.includes(short)) return short;
//   }
//   return 'en';
// }
//
// module.exports = { pickLocale };
//
