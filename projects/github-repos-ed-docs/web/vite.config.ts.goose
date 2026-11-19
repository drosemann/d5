// Goose-Port-Spiegel von: projects/github-repos-ed-docs/web/vite.config.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-ed-docs/web/vite.config.ts");
}

// ---- Original-Code (projects/github-repos-ed-docs/web/vite.config.ts), unveraendert, als Inline-Doku ----
// import react from '@vitejs/plugin-react';
// import {defineConfig, type Plugin} from 'vite';
//
// const offlineShell = (): Plugin => ({
//   name: 'ed-docs-offline-shell',
//   generateBundle(_, bundle) {
//     const assets = Object.keys(bundle)
//       .filter(fileName => fileName !== 'sw.js' && !fileName.endsWith('.map'))
//       .map(fileName => `/${fileName}`);
//     const cacheKey = assets.join('|').replace(/[^a-zA-Z0-9]/g, '').slice(-32);
//     const serviceWorker = `
// const CACHE_NAME = 'ed-docs-${cacheKey}';
// const APP_SHELL = ${JSON.stringify(['/', ...assets])};
//
// self.addEventListener('install', event => {
//   event.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(APP_SHELL)));
//   self.skipWaiting();
// });
//
// self.addEventListener('activate', event => {
//   event.waitUntil(
//     caches.keys().then(keys =>
//       Promise.all(keys.filter(key => key.startsWith('ed-docs-') && key !== CACHE_NAME).map(key => caches.delete(key)))
//     ).then(() => self.clients.claim())
//   );
// });
//
// self.addEventListener('fetch', event => {
//   const request = event.request;
//   if (request.method !== 'GET' || new URL(request.url).origin !== self.location.origin) return;
//
//   if (request.mode === 'navigate') {
//     event.respondWith(
//       fetch(request).then(response => {
//         const copy = response.clone();
//         caches.open(CACHE_NAME).then(cache => cache.put('/', copy));
//         return response;
//       }).catch(() => caches.match('/'))
//     );
//     return;
//   }
//
//   event.respondWith(
//     caches.match(request).then(cached => cached || fetch(request).then(response => {
//       if (response.ok) {
//         const copy = response.clone();
//         caches.open(CACHE_NAME).then(cache => cache.put(request, copy));
//       }
//       return response;
//     }))
//   );
// });
// `;
//
//     this.emitFile({type: 'asset', fileName: 'sw.js', source: serviceWorker});
//   },
// });
//
// export default defineConfig({
//   plugins: [react(), offlineShell()],
// });
//
