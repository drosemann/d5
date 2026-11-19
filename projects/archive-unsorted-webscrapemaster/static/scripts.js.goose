// Goose-Port-Spiegel von: projects/archive-unsorted-webscrapemaster/static/scripts.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-webscrapemaster/static/scripts.js");
}

// ---- Original-Code (projects/archive-unsorted-webscrapemaster/static/scripts.js), unveraendert, als Inline-Doku ----
// document.getElementById('urlForm').addEventListener('submit', function(event) {
//     event.preventDefault();
//     const url = document.getElementById('urlInput').value;
//
//     fetch('/submit-url', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json',
//         },
//         body: JSON.stringify({ url }),
//     })
//     .then(response => response.json())
//     .then(data => {
//         document.getElementById('response').innerText = data.message;
//     })
//     .catch(error => console.error('Error:', error));
// });
//
