// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/tests/playwright/demo_gate.spec.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/tests/playwright/demo_gate.spec.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/tests/playwright/demo_gate.spec.ts), unveraendert, als Inline-Doku ----
// import { test, expect } from '@playwright/test';
//
// // Verifies that the UI gate for Seed Demo is aligned with the environment flag
// test('Demo feature flag gating alignment', async ({ page }) => {
//   const flagEndpoint = 'http://localhost:3001/api/demo/flag';
//   try {
//     const resp = await page.request.get(flagEndpoint);
//     if (resp.status() >= 400) {
//       test.skip(`Backend demo flag endpoint not reachable (status ${resp.status()})`);
//       return;
//     }
//     const json = await resp.json();
//     const enabled = !!json.enabled;
//     const expected = process.env.VITE_DEMO_FEATURE_ENABLED === 'true';
//     expect(enabled).toBe(expected);
//   } catch {
//     test.skip('Backend demo flag endpoint not reachable');
//   }
// });
//
