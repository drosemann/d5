// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/PlayerCountChart.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/PlayerCountChart.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/PlayerCountChart.tsx), unveraendert, als Inline-Doku ----
// interface PlayerCountChartProps {
//   data: Array<{ time: string; count: number }>;
//   height?: number;
// }
//
// export const PlayerCountChart = ({
//   data,
//   height = 160,
// }: PlayerCountChartProps) => {
//   if (data.length === 0) {
//     return (
//       <div className="card p-4">
//         <p className="text-sm text-white/45 mb-3">Players Over Time</p>
//         <div className="flex items-center justify-center" style={{ height }}>
//           <p className="text-white/40 text-sm">No data available</p>
//         </div>
//       </div>
//     );
//   }
//
//   const max = Math.max(...data.map((d) => d.count), 1);
//   const barWidth = Math.max(4, Math.floor(100 / data.length));
//
//   return (
//     <div className="card p-4">
//       <p className="text-sm text-white/45 mb-3">Players Over Time</p>
//       <div className="flex items-end gap-1" style={{ height }}>
//         {data.map((d, i) => (
//           <div
//             key={i}
//             className="flex-1 rounded-t bg-blue-500/70 transition-opacity hover:opacity-100"
//             style={{
//               height: `${(d.count / max) * 100}%`,
//               minHeight: d.count > 0 ? '2px' : '0',
//             }}
//             title={`${d.time}: ${d.count} players`}
//           />
//         ))}
//       </div>
//       <div className="flex items-center justify-between mt-2 text-xs text-white/40">
//         <span>{data[0]?.time || ''}</span>
//         <span>{data[data.length - 1]?.time || ''}</span>
//       </div>
//     </div>
//   );
// };
//
// export default PlayerCountChart;
//
