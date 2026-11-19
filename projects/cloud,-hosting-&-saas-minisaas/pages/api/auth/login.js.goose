// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-minisaas/pages/api/auth/login.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-minisaas/pages/api/auth/login.js");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-minisaas/pages/api/auth/login.js), unveraendert, als Inline-Doku ----
// let users = {};
//
// export default function handler(req, res) {
//   if (req.method === 'POST') {
//     const { username, password } = req.body;
//     if (!users[username] || users[username].password !== password) {
//       res.status(401).json({ error: 'Invalid credentials' });
//       return;
//     }
//     res.setHeader('Set-Cookie', `user=${encodeURIComponent(username)}; HttpOnly; Path=/`);
//     res.status(200).json({ success: true });
//   } else {
//     res.status(405).json({ error: 'Method not allowed' });
//   }
// }
//
