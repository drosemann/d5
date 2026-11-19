// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/ResourceMonitor.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/ResourceMonitor.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/ResourceMonitor.tsx), unveraendert, als Inline-Doku ----
// import { useState, useEffect } from 'react';
// import { apiClient } from '../lib/api';
// import { SystemGauge } from './SystemGauge';
//
// interface RealtimeData {
//   cpu: { current: number; unit: string };
//   memory: { current: number; total: number; unit: string; percent: number };
//   disk: { current: number; total: number; unit: string; percent: number };
//   network: { rx: number; tx: number; unit: string };
// }
//
// const toGB = (value: number, unit: string) =>
//   unit === 'MB' ? value / 1024 : value;
//
// export const ResourceMonitor = () => {
//   const [data, setData] = useState<RealtimeData | null>(null);
//   const [unavailable, setUnavailable] = useState(false);
//
//   useEffect(() => {
//     let active = true;
//     const load = async () => {
//       try {
//         const stats = await apiClient.getRealtimeMetrics();
//         if (active) {
//           setData(stats);
//           setUnavailable(false);
//         }
//       } catch {
//         if (active) setUnavailable(true);
//       }
//     };
//     load();
//     const interval = setInterval(load, 30000);
//     return () => {
//       active = false;
//       clearInterval(interval);
//     };
//   }, []);
//
//   if (!data) {
//     return (
//       <div className="space-y-4">
//         <h3 className="text-lg font-semibold text-white">Resource Monitoring</h3>
//         <div className="card p-6 text-center">
//           <p className="text-white/55">
//             {unavailable ? 'Host metrics unavailable.' : 'Loading host metrics…'}
//           </p>
//         </div>
//       </div>
//     );
//   }
//
//   return (
//     <div className="space-y-4">
//       <h3 className="text-lg font-semibold text-white">Resource Monitoring</h3>
//       <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
//         <SystemGauge label="CPU Usage" value={data.cpu.current} max={100} unit="%" color="blue" />
//         <SystemGauge
//           label="Memory"
//           value={Math.round(toGB(data.memory.current, data.memory.unit) * 10) / 10}
//           max={Math.round(toGB(data.memory.total, data.memory.unit) * 10) / 10}
//           unit="GB"
//           color="purple"
//         />
//         <SystemGauge label="Disk" value={data.disk.current} max={data.disk.total} unit="GB" color="cyan" />
//         <SystemGauge label="Network RX" value={data.network.rx} max={1000} unit={data.network.unit || 'KB/s'} color="green" />
//       </div>
//     </div>
//   );
// };
//
// export default ResourceMonitor;
//
