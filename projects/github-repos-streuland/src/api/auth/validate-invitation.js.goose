// Goose-Port-Spiegel von: projects/github-repos-streuland/src/api/auth/validate-invitation.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/api/auth/validate-invitation.js");
}

// ---- Original-Code (projects/github-repos-streuland/src/api/auth/validate-invitation.js), unveraendert, als Inline-Doku ----
// // MVP endpoint: validate an invitation code
// const InviteRepository = require('../../invitations/InviteRepository');
//
// module.exports = async function validateInvitation(req, res) {
//   const { code } = req.query || {};
//   const repo = new InviteRepository();
//   const invite = await repo.find(code);
//   if (!invite) {
//     res.statusCode = 404;
//     return res.end(JSON.stringify({ valid: false }));
//   }
//   res.statusCode = 200;
//   res.end(JSON.stringify({ valid: true, invite }));
// };
//
