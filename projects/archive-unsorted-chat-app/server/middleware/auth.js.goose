// Goose-Port-Spiegel von: projects/archive-unsorted-chat-app/server/middleware/auth.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-chat-app/server/middleware/auth.js");
}

// ---- Original-Code (projects/archive-unsorted-chat-app/server/middleware/auth.js), unveraendert, als Inline-Doku ----
// const jwt = require('jsonwebtoken');
//
// module.exports = (req, res, next) => {
//     try {
//         const token = req.headers.authorization.split(' ')[1];
//         const decoded = jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key');
//         req.user = { id: decoded.userId };
//         next();
//     } catch (error) {
//         res.status(401).json({ message: 'Authentication failed' });
//     }
// };
//
