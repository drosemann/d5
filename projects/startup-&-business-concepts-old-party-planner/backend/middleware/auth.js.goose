// Goose-Port-Spiegel von: projects/startup-&-business-concepts-old-party-planner/backend/middleware/auth.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-old-party-planner/backend/middleware/auth.js");
}

// ---- Original-Code (projects/startup-&-business-concepts-old-party-planner/backend/middleware/auth.js), unveraendert, als Inline-Doku ----
// const jwt = require('jsonwebtoken');
//
// module.exports = (req, res, next) => {
//   const auth = req.headers.authorization;
//   if (!auth) return res.sendStatus(401);
//
//   try {
//     const token = auth.split(' ')[1];
//     const decoded = jwt.verify(token, process.env.JWT_SECRET);
//     req.user = decoded;
//     next();
//   } catch {
//     res.sendStatus(403);
//   }
// };
//
