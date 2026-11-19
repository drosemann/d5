// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/tests/helpers/http-client.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/tests/helpers/http-client.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/tests/helpers/http-client.ts), unveraendert, als Inline-Doku ----
// import assert from 'node:assert/strict';
// import http from 'node:http';
//
// async function request(server: http.Server, method: string, path: string, body?: any, token?: string) {
//   const address = server.address();
//   assert(address && typeof address === 'object');
//   const response = await fetch(`http://127.0.0.1:${address.port}${path}`, {
//     method,
//     headers: {
//       ...(body ? { 'content-type': 'application/json' } : {}),
//       ...(token ? { authorization: `Bearer ${token}` } : {}),
//     },
//     body: body ? JSON.stringify(body) : undefined,
//   });
//   const text = await response.text();
//   let bodyParsed: any = null;
//   if (text) {
//     try {
//       bodyParsed = JSON.parse(text);
//     } catch {
//       bodyParsed = text;
//     }
//   }
//   return { status: response.status, body: bodyParsed };
// }
//
// async function requestWithHeaders(server: http.Server, method: string, path: string, body?: any, token?: string) {
//   const address = server.address();
//   assert(address && typeof address === 'object');
//   const response = await fetch(`http://127.0.0.1:${address.port}${path}`, {
//     method,
//     headers: {
//       ...(body ? { 'content-type': 'application/json' } : {}),
//       ...(token ? { authorization: `Bearer ${token}` } : {}),
//     },
//     body: body ? JSON.stringify(body) : undefined,
//   });
//   const text = await response.text();
//   const headers: Record<string, string> = {};
//   response.headers.forEach((value, key) => { headers[key] = value; });
//   let bodyParsed: any = null;
//   if (text) {
//     try {
//       bodyParsed = JSON.parse(text);
//     } catch {
//       bodyParsed = text;
//     }
//   }
//   return { status: response.status, body: bodyParsed, headers };
// }
//
// export { request, requestWithHeaders };
//
