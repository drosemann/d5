// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/i18n/locale-detector.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/i18n/locale-detector.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/i18n/locale-detector.ts), unveraendert, als Inline-Doku ----
// const SUPPORTED_LOCALES = ['en', 'de', 'zh', 'es', 'fr', 'ja', 'pt', 'ru', 'ar', 'ko', 'tr'] as const;
// export type SupportedLocale = typeof SUPPORTED_LOCALES[number];
//
// export function detectBrowserLocale(): SupportedLocale {
//   const stored = localStorage.getItem('locale') as SupportedLocale | null;
//   if (stored && SUPPORTED_LOCALES.includes(stored)) return stored;
//
//   try {
//     const raw = navigator.language || (navigator as any).userLanguage || 'en';
//     const lang = raw.split('-')[0].toLowerCase();
//     if (SUPPORTED_LOCALES.includes(lang as SupportedLocale)) return lang as SupportedLocale;
//   } catch {}
//
//   return 'en';
// }
//
// export function isRTL(locale: SupportedLocale): boolean {
//   return locale === 'ar';
// }
//
// export { SUPPORTED_LOCALES };
//
