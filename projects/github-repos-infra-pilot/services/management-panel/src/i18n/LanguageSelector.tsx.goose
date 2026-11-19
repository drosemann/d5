// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/i18n/LanguageSelector.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/i18n/LanguageSelector.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/i18n/LanguageSelector.tsx), unveraendert, als Inline-Doku ----
// import { useIntl } from 'react-intl';
// import { useI18n } from './index';
// import { SUPPORTED_LOCALES } from './locale-detector';
//
// const localeNames: Record<string, string> = {
//   en: 'English',
//   de: 'Deutsch',
//   zh: 'ä¸­æ–‡',
//   es: 'EspaÃ±ol',
//   fr: 'FranÃ§ais',
//   ja: 'æ—¥æœ¬èªž',
//   pt: 'PortuguÃªs',
//   ru: 'Ð ÑƒÑÑÐºÐ¸Ð¹',
//   ar: 'Ø§Ù„Ø¹Ø±Ø¨ÙŠØ©',
//   ko: 'í•œêµ­ì–´',
//   tr: 'TÃ¼rkÃ§e',
// };
//
// export const LanguageSelector = () => {
//   const intl = useIntl();
//   const { locale, setLocale } = useI18n();
//   const label = intl.formatMessage({ id: 'language.label' });
//
//   return (
//     <div className="flex items-center gap-2">
//       <label htmlFor="language-select" className="text-sm text-slate-400">
//         {label}
//       </label>
//       <select
//         id="language-select"
//         value={locale}
//         onChange={(e) => setLocale(e.target.value as any)}
//         className="input-field w-auto text-sm"
//         aria-label={label}
//       >
//         {SUPPORTED_LOCALES.map((code) => (
//           <option key={code} value={code}>
//             {localeNames[code]}
//           </option>
//         ))}
//       </select>
//     </div>
//   );
// };
//
