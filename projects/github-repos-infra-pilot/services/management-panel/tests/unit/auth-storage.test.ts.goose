// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/tests/unit/auth-storage.test.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/tests/unit/auth-storage.test.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/tests/unit/auth-storage.test.ts), unveraendert, als Inline-Doku ----
// import assert from 'node:assert/strict';
// import { beforeEach, describe, it } from 'node:test';
//
// const storage = new Map<string, string>();
// Object.defineProperty(globalThis, 'localStorage', {
//   value: {
//     getItem: (key: string) => storage.get(key) ?? null,
//     setItem: (key: string, value: string) => storage.set(key, value),
//     removeItem: (key: string) => storage.delete(key),
//   },
// });
//
// const { clearAccessToken, getAccessToken, setAccessToken } = await import('../../src/lib/auth.ts');
//
// describe('auth token storage helpers', () => {
//   beforeEach(() => storage.clear());
//
//   it('sets, reads, and clears the Supabase access token consistently', () => {
//     assert.equal(getAccessToken(), null);
//     setAccessToken('test-token');
//     assert.equal(getAccessToken(), 'test-token');
//     clearAccessToken();
//     assert.equal(getAccessToken(), null);
//   });
// });
//
