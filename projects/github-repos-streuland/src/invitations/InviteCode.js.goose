// Goose-Port-Spiegel von: projects/github-repos-streuland/src/invitations/InviteCode.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/invitations/InviteCode.js");
}

// ---- Original-Code (projects/github-repos-streuland/src/invitations/InviteCode.js), unveraendert, als Inline-Doku ----
// // Minimal InviteCode model for MVP (SQLite-backed persistence later)
// class InviteCode {
//   constructor({ code, owner, expiresAt = null, maxUses = null, uses = 0, roles = [] } = {}) {
//     this.code = code;
//     this.owner = owner;
//     this.expiresAt = expiresAt; // ISO string or null
//     this.maxUses = maxUses; // number or null
//     this.uses = uses; // number of times used
//     this.roles = roles;
//   }
//
//   isExpired(now = new Date()) {
//     if (!this.expiresAt) return false;
//     return new Date(this.expiresAt) < now;
//   }
//
//   canUse() {
//     if (this.maxUses != null && this.uses >= this.maxUses) return false;
//     return !this.isExpired();
//   }
// }
//
// module.exports = InviteCode;
//
