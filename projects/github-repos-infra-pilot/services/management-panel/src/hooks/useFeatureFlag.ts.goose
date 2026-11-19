// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/hooks/useFeatureFlag.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/hooks/useFeatureFlag.ts");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/hooks/useFeatureFlag.ts), unveraendert, als Inline-Doku ----
// import { useCallback, useEffect, useState } from 'react';
// import { fetchEvaluatedFlags, readCachedFlag, invalidateFlagCache } from '../lib/feature-flags';
//
// /** Reactive boolean/variant flag for the current user. Resolves to `fallback` while loading. */
// export function useFeatureFlag(key: string, fallback: boolean | string = false): boolean | string {
//   const [value, setValue] = useState<boolean | string>(() => readCachedFlag(key, fallback));
//
//   useEffect(() => {
//     let live = true;
//     fetchEvaluatedFlags()
//       .then((flags) => {
//         if (live) setValue(key in flags ? flags[key] : fallback);
//       })
//       .catch(() => {
//         if (live) setValue(fallback);
//       });
//     const onChanged = () => {
//       invalidateFlagCache();
//       fetchEvaluatedFlags(true).then((flags) => {
//         if (live) setValue(key in flags ? flags[key] : fallback);
//       }).catch(() => {});
//     };
//     window.addEventListener('feature-flags:changed', onChanged);
//     return () => {
//       live = false;
//       window.removeEventListener('feature-flags:changed', onChanged);
//     };
//   }, [key]);
//
//   const refresh = useCallback(async () => {
//     invalidateFlagCache();
//     const flags = await fetchEvaluatedFlags(true);
//     setValue(key in flags ? flags[key] : fallback);
//   }, [key, fallback]);
//
//   return value as boolean | string;
// }
//
