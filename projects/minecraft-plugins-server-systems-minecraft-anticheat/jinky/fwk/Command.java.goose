// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/fwk/Command.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/fwk/Command.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/fwk/Command.java), unveraendert, als Inline-Doku ----
// package me.jinky.fwk;
//
// import java.lang.annotation.ElementType;
// import java.lang.annotation.Retention;
// import java.lang.annotation.RetentionPolicy;
// import java.lang.annotation.Target;
//
// @Target({ElementType.METHOD})
// @Retention(RetentionPolicy.RUNTIME)
// public @interface Command {
//    String name();
//
//    String permission() default "";
//
//    String noPerm() default "§8[§cCenix§8] §7You don't have permission to do this!";
//
//    String[] aliases() default {};
//
//    String description() default "";
//
//    String usage() default "";
// }
//
