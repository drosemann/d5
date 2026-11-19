// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/public/sw.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/public/sw.js");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/public/sw.js), unveraendert, als Inline-Doku ----
// const CACHE_NAME = 'infrapilot-v1';
// const STATIC_ASSETS = ['/', '/index.html', '/manifest.json'];
//
// self.addEventListener('install', (event) => {
//   event.waitUntil(
//     caches.open(CACHE_NAME).then((cache) => cache.addAll(STATIC_ASSETS))
//   );
// });
//
// self.addEventListener('fetch', (event) => {
//   event.respondWith(
//     caches.match(event.request).then((cached) => {
//       return cached || fetch(event.request).then((response) => {
//         return caches.open(CACHE_NAME).then((cache) => {
//           if (event.request.url.startsWith(self.location.origin)) {
//             cache.put(event.request, response.clone());
//           }
//           return response;
//         });
//       });
//     })
//   );
// });
//
// self.addEventListener('activate', (event) => {
//   event.waitUntil(
//     caches.keys().then((keys) => Promise.all(keys.filter(k => k !== CACHE_NAME).map(k => caches.delete(k))))
//   );
// });
//
