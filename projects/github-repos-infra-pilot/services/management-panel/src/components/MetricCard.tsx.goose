// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/MetricCard.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/MetricCard.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/MetricCard.tsx), unveraendert, als Inline-Doku ----
// interface MetricCardProps {
//   icon?: string;
//   label: string;
//   value: number | string;
//   change?: {
//     value: number;
//     type: "up" | "down" | "neutral";
//     timeframe: string;
//   };
//   trend?: "up" | "down" | "stable";
//   accentColor?: string;
//   hint?: string;
// }
//
// export const MetricCard = ({
//   icon,
//   label,
//   value,
//   change,
//   hint,
// }: MetricCardProps) => {
//   return (
//     <div className="rounded-3xl border border-white/10 bg-white/[0.04] p-5">
//       <p className="text-sm text-white/45">{label}</p>
//       <p className="mt-2 text-3xl font-semibold tracking-tight text-white">
//         {icon ? (
//           <span className="mr-2" aria-hidden="true">
//             {icon}
//           </span>
//         ) : null}
//         {value}
//       </p>
//       {hint && <p className="mt-2 text-xs text-white/35">{hint}</p>}
//       {change && (
//         <p className="mt-2 text-xs text-white/35">vs {change.timeframe}</p>
//       )}
//     </div>
//   );
// };
//
