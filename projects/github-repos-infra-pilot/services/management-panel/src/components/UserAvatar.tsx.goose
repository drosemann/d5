// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/UserAvatar.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/UserAvatar.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/UserAvatar.tsx), unveraendert, als Inline-Doku ----
// import { useEffect, useRef } from "react";
// import { update } from "jdenticon";
//
// interface UserAvatarProps {
//   value: string;
//   size?: number;
//   className?: string;
// }
//
// export const UserAvatar = ({ value, size = 36, className }: UserAvatarProps) => {
//   const ref = useRef<SVGSVGElement>(null);
//
//   useEffect(() => {
//     if (ref.current) {
//       update(ref.current, value);
//     }
//   }, [value]);
//
//   return (
//     <svg
//       ref={ref}
//       width={size}
//       height={size}
//       className={className}
//       data-jdenticon-value={value}
//     />
//   );
// };
//
