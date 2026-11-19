// Goose-Port-Spiegel von: projects/github-repos-streuland/src/invitations/InviteRepository.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/invitations/InviteRepository.js");
}

// ---- Original-Code (projects/github-repos-streuland/src/invitations/InviteRepository.js), unveraendert, als Inline-Doku ----
// // Minimal in-memory Invite repository for MVP. Persistency to SQLite comes later.
// class InviteRepository {
//   constructor() {
//     this.invites = new Map(); // code -> InviteCode-like object
//   }
//
//   async create(invite) {
//     this.invites.set(invite.code, invite);
//     return invite;
//   }
//
//   async find(code) {
//     return this.invites.get(code) || null;
//   }
//
//   async list({ owner } = {}) {
//     const arr = Array.from(this.invites.values());
//     if (!owner) return arr;
//     return arr.filter((i) => i.owner === owner);
//   }
//
//   async update(code, updates) {
//     const existing = this.invites.get(code);
//     if (!existing) return null;
//     const updated = Object.assign({}, existing, updates);
//     this.invites.set(code, updated);
//     return updated;
//   }
//
//   async revoke(code) {
//     return this.invites.delete(code);
//   }
// }
//
// module.exports = InviteRepository;
//
