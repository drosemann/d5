// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/i18n/CrowdinIntegration.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/i18n/CrowdinIntegration.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/i18n/CrowdinIntegration.ts), unveraendert, als Inline-Doku ----
// const CROWDIN_OTA_URL = (import.meta as any).env?.VITE_CROWDIN_OTA_URL || '';
//
// export interface CrowdinTranslation {
//   id: string;
//   locale: string;
//   key: string;
//   value: string;
// }
//
// export class CrowdinIntegration {
//   private distributionHash: string;
//
//   constructor(distributionHash: string) {
//     this.distributionHash = distributionHash;
//   }
//
//   async fetchTranslations(locale: string): Promise<Record<string, string>> {
//     if (!CROWDIN_OTA_URL || !this.distributionHash) return {};
//     try {
//       const res = await fetch(
//         `${CROWDIN_OTA_URL}/${this.distributionHash}/translations/${locale}.json`
//       );
//       if (!res.ok) return {};
//       return await res.json();
//     } catch {
//       return {};
//     }
//   }
//
//   async fetchLanguages(): Promise<string[]> {
//     if (!CROWDIN_OTA_URL || !this.distributionHash) return [];
//     try {
//       const res = await fetch(
//         `${CROWDIN_OTA_URL}/${this.distributionHash}/languages.json`
//       );
//       if (!res.ok) return [];
//       const data = await res.json();
//       return data.languages || [];
//     } catch {
//       return [];
//     }
//   }
// }
//
// export const crowdinClient = new CrowdinIntegration(
//   (import.meta as any).env?.VITE_CROWDIN_DISTRIBUTION_HASH || ''
// );
//
