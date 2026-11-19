// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/clan/DiplomacyStatus.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/clan/DiplomacyStatus.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/clan/DiplomacyStatus.java), unveraendert, als Inline-Doku ----
// package de.streuland.clan;
//
// import org.bukkit.ChatColor;
//
// public enum DiplomacyStatus {
//     ALLY("ALLY", "Allianz", "§a§l", ChatColor.GREEN),
//     NEUTRAL("NEUTRAL", "Neutral", "§7§l", ChatColor.GRAY),
//     HOSTILE("HOSTILE", "Feindlich", "§c§l", ChatColor.RED),
//     WAR("WAR", "Krieg", "§4§l", ChatColor.DARK_RED);
//
//     private final String id;
//     private final String displayName;
//     private final String prefix;
//     private final ChatColor chatColor;
//
//     DiplomacyStatus(String id, String displayName, String prefix, ChatColor chatColor) {
//         this.id = id;
//         this.displayName = displayName;
//         this.prefix = prefix;
//         this.chatColor = chatColor;
//     }
//
//     public String getId() {
//         return id;
//     }
//
//     public String getDisplayName() {
//         return displayName;
//     }
//
//     public String getPrefix() {
//         return prefix;
//     }
//
//     public ChatColor getChatColor() {
//         return chatColor;
//     }
//
//     public boolean isHostile() {
//         return this == HOSTILE || this == WAR;
//     }
//
//     public boolean canBeAttacked() {
//         return this == NEUTRAL || this == HOSTILE;
//     }
//
//     public static DiplomacyStatus fromId(String id) {
//         if (id == null) return NEUTRAL;
//         for (DiplomacyStatus status : values()) {
//             if (status.id.equalsIgnoreCase(id)) {
//                 return status;
//             }
//         }
//         return NEUTRAL;
//     }
// }
