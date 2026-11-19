// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-notenest/src/server.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-notenest/src/server.js");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-notenest/src/server.js), unveraendert, als Inline-Doku ----
// const http = require('http');
// const fs = require('fs');
// const path = require('path');
// const Note = require('./models/Note');
// require('dotenv').config();
//
// const server = http.createServer(async (req, res) => {
//     // CORS headers
//     res.setHeader('Access-Control-Allow-Origin', '*');
//     res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
//     res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
//
//     if (req.method === 'OPTIONS') {
//         res.writeHead(204);
//         res.end();
//         return;
//     }
//
//     // Basic authentication middleware
//     const auth = req.headers.authorization;
//     if (!auth) {
//         res.writeHead(401, { 'Content-Type': 'application/json' });
//         res.end(JSON.stringify({ error: 'Authentication required' }));
//         return;
//     }
//
//     try {
//         if (req.method === 'POST' && req.url === '/api/notes') {
//             let body = '';
//             req.on('data', chunk => {
//                 body += chunk.toString();
//             });
//
//             req.on('end', async () => {
//                 try {
//                     const { title, content } = JSON.parse(body);
//                     const noteId = await Note.create(1, title, content); // Using 1 as dummy userId
//                     res.writeHead(201, { 'Content-Type': 'application/json' });
//                     res.end(JSON.stringify({ id: noteId }));
//                 } catch (error) {
//                     res.writeHead(400, { 'Content-Type': 'application/json' });
//                     res.end(JSON.stringify({ error: 'Invalid request' }));
//                 }
//             });
//         } else if (req.method === 'GET' && req.url.startsWith('/api/notes/')) {
//             const noteId = req.url.split('/')[3];
//             const note = await Note.get(noteId, 1); // Using 1 as dummy userId
//
//             if (note) {
//                 res.writeHead(200, { 'Content-Type': 'application/json' });
//                 res.end(JSON.stringify(note));
//             } else {
//                 res.writeHead(404, { 'Content-Type': 'application/json' });
//                 res.end(JSON.stringify({ error: 'Note not found' }));
//             }
//         } else {
//             res.writeHead(404, { 'Content-Type': 'application/json' });
//             res.end(JSON.stringify({ error: 'Not found' }));
//         }
//     } catch (error) {
//         res.writeHead(500, { 'Content-Type': 'application/json' });
//         res.end(JSON.stringify({ error: 'Internal server error' }));
//     }
// });
//
// const PORT = process.env.PORT || 3000;
// server.listen(PORT, () => {
//     console.log(`Server running on port ${PORT}`);
// });
