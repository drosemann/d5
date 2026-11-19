// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/main.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/main.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/main.tsx), unveraendert, als Inline-Doku ----
// /**
//  * @file Application entry point.
//  * Renders the root React component and optionally registers the service worker.
//  */
//
// import { StrictMode } from "react";
// import { createRoot } from "react-dom/client";
// import "./index.css";
// import App from "./App";
//
// /** Register service worker for caching if available */
// if ('serviceWorker' in navigator) {
//   window.addEventListener('load', () => {
//     navigator.serviceWorker.register('/sw.js');
//   });
// }
//
// /**
//  * Mount the React application to the DOM.
//  */
// createRoot(document.getElementById("root")!).render(
//   <StrictMode>
//     <App />
//   </StrictMode>,
// );
//
