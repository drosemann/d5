// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/PlayerJumpTrigger.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/PlayerJumpTrigger.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/trigger/impl/PlayerJumpTrigger.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.trigger.impl;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
// import net.codingarea.challenges.plugin.spigot.events.PlayerJumpEvent;
// import org.bukkit.Material;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
//
// public class PlayerJumpTrigger extends ChallengeTrigger {
//    public PlayerJumpTrigger(String name) {
//       super(name);
//    }
//
//    public Material getMaterial() {
//       return Material.RABBIT_FOOT;
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onJump(@Nonnull PlayerJumpEvent event) {
//       this.createData().entity(event.getPlayer()).execute();
//    }
// }
//
