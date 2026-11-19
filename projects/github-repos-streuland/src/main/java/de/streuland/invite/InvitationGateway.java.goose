// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/invite/InvitationGateway.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/invite/InvitationGateway.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/invite/InvitationGateway.java), unveraendert, als Inline-Doku ----
// package de.streuland.invite;
//
// import java.time.Instant;
// import java.util.List;
//
// /**
//  * Abstraction for invitation management (MVP).
//  * Implementations may be in-memory, DB-backed, etc.
//  */
// public interface InvitationGateway {
//     InvitationCode create(InvitationCode code);
//     List<InvitationCode> listAll();
//     InvitationCode getById(String id);
//     InvitationCode getByCode(String code);
//     InvitationCode revoke(String id);
//     InvitationCode update(String id, String expiresAt, Integer maxUses, List<String> allowedRoles, Boolean isRevoked);
//     void incrementUses(String id);
//     boolean consumeIfValid(String code, Instant now);
// }
//
