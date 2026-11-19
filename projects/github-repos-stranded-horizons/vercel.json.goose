// Goose-Port-Spiegel von: projects/github-repos-stranded-horizons/vercel.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-stranded-horizons/vercel.json");
}

// ---- Original-Code (projects/github-repos-stranded-horizons/vercel.json), unveraendert, als Inline-Doku ----
// {
//   "headers": [
//     {
//       "source": "/assets/(.*)",
//       "headers": [
//         {
//           "key": "Cache-Control",
//           "value": "public, max-age=31536000, immutable"
//         }
//       ]
//     },
//     {
//       "source": "/src/(.*)",
//       "headers": [
//         {
//           "key": "Cache-Control",
//           "value": "public, max-age=3600, stale-while-revalidate=86400"
//         }
//       ]
//     },
//     {
//       "source": "/(.*)",
//       "headers": [
//         {
//           "key": "Cache-Control",
//           "value": "public, max-age=0, must-revalidate"
//         }
//       ]
//     }
//   ]
// }
//
