// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictRole.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictRole.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictRole.java), unveraendert, als Inline-Doku ----
// package de.streuland.district;
//
// import de.streuland.plot.Permission;
//
// import java.util.EnumSet;
// import java.util.Set;
//
// public enum DistrictRole {
//     OWNER(EnumSet.allOf(Permission.class)),
//     CO_OWNER(EnumSet.of(Permission.BUILD, Permission.BREAK, Permission.INTERACT, Permission.CONTAINER_ACCESS, Permission.TRANSFER, Permission.ROLE_MANAGE)),
//     MANAGER(EnumSet.of(Permission.BUILD, Permission.BREAK, Permission.INTERACT, Permission.CONTAINER_ACCESS, Permission.ROLE_MANAGE)),
//     BUILDER(EnumSet.of(Permission.BUILD, Permission.BREAK, Permission.INTERACT)),
//     VISITOR(EnumSet.of(Permission.INTERACT));
//
//     private final Set<Permission> grantedPermissions;
//
//     DistrictRole(Set<Permission> grantedPermissions) {
//         this.grantedPermissions = grantedPermissions;
//     }
//
//     public boolean grants(Permission permission) {
//         return permission != null && grantedPermissions.contains(permission);
//     }
//
//     public boolean canManageDistrict() {
//         return this == OWNER || this == CO_OWNER || this == MANAGER;
//     }
// }
//
