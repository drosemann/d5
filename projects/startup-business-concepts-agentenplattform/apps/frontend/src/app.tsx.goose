// Goose-Port-Spiegel von: projects/startup-business-concepts-agentenplattform/apps/frontend/src/app.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-agentenplattform/apps/frontend/src/app.tsx");
}

// ---- Original-Code (projects/startup-business-concepts-agentenplattform/apps/frontend/src/app.tsx), unveraendert, als Inline-Doku ----
// import React, { useEffect, useState } from "react";
// import { Link, Outlet } from "react-router-dom";
//
// export function Layout() {
//   const [bereit, setBereit] = useState("Prüfe Backend …");
//   useEffect(() => {
//     fetch("/health/ready").then(r => r.json()).then(d => setBereit(d.demo_modus ? "Bereit (Demo-Modus)" : "Bereit")).catch(() => setBereit("Backend nicht erreichbar (Demo-Daten sichtbar)"));
//   }, []);
//   return (
//     <div className="layout">
//       <aside className="seite">
//         <h1>Agentenplattform</h1>
//         <p style={{color:"var(--muted)"}}>{bereit}</p>
//         <nav aria-label="Hauptbereiche">
//           <Link className="fokus-sichtbar" to="/">Dashboard</Link>
//           <Link className="fokus-sichtbar" to="/agenten">Agenten</Link>
//           <Link className="fokus-sichtbar" to="/chat">Chat & Aufgaben</Link>
//           <Link className="fokus-sichtbar" to="/angebote">Angebote</Link>
//           <Link className="fokus-sichtbar" to="/kalender">Kalender</Link>
//           <Link className="fokus-sichtbar" to="/sicherheit">Standort & SOS</Link>
//           <Link className="fokus-sichtbar" to="/freigaben">Freigaben</Link>
//           <Link className="fokus-sichtbar" to="/einstellungen">Einstellungen</Link>
//         </nav>
//       </aside>
//       <main className="inhalt"><Outlet /></main>
//     </div>
//   );
// }
//
