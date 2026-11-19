// Goose-Port-Spiegel von: projects/utilities-desktop-tools-speedsnap/static/script.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-desktop-tools-speedsnap/static/script.js");
}

// ---- Original-Code (projects/utilities-desktop-tools-speedsnap/static/script.js), unveraendert, als Inline-Doku ----
// document.getElementById('test-speed').addEventListener('click', function() {
//     fetch('/api/speedtest')
//         .then(response => response.json())
//         .then(data => {
//             const resultsDiv = document.getElementById('results');
//             resultsDiv.innerHTML = `
//                 <p>Download Speed: ${data.download_speed.toFixed(2)} Mbps</p>
//                 <p>Upload Speed: ${data.upload_speed.toFixed(2)} Mbps</p>
//                 <p>Ping: ${data.ping} ms</p>
//             `;
//         })
//         .catch(error => {
//             console.error('Error:', error);
//         });
// });
//
