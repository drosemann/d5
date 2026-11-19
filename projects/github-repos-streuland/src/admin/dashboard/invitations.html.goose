// Goose-Port-Spiegel von: projects/github-repos-streuland/src/admin/dashboard/invitations.html
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/admin/dashboard/invitations.html");
}

// ---- Original-Code (projects/github-repos-streuland/src/admin/dashboard/invitations.html), unveraendert, als Inline-Doku ----
// <!doctype html>
// <html>
//   <head><title>Admin Invitations</title></head>
//   <body>
//     <h1>Admin Invitations (MVP)</h1>
//     <p>Manage invite codes. This UI is wired to the MVP API gateway.</p>
//     <div id="inviteList"></div>
//     <script>
//       // Basic fetch to show that API is wired (no auth in MVP placeholder)
//       fetch('/api/dashboard/ops/invitations').then(r => r.json()).then(data => {
//         const el = document.getElementById('inviteList');
//         el.textContent = JSON.stringify(data, null, 2);
//       }).catch(() => {
//         document.getElementById('inviteList').textContent = 'Not connected (stub)';
//       });
//     </script>
//   </body>
// </html>
//
