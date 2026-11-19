// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/ImmediateRespawnSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/ImmediateRespawnSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/ImmediateRespawnSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.GameRule;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.PlayerDeathEvent;
//
// @Since("2.0")
// public class ImmediateRespawnSetting extends Setting {
//    private boolean respawnWithEvent;
//
//    public ImmediateRespawnSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.GOLDEN_APPLE, Message.forName("item-immediate-respawn-setting"));
//    }
//
//    protected void onEnable() {
//       if (!this.respawnWithEvent) {
//          try {
//             Iterator var1 = Bukkit.getWorlds().iterator();
//
//             while(var1.hasNext()) {
//                World world = (World)var1.next();
//                world.setGameRule(GameRule.DO_IMMEDIATE_RESPAWN, true);
//             }
//          } catch (NoSuchFieldError var3) {
//             this.respawnWithEvent = true;
//          }
//
//       }
//    }
//
//    protected void onDisable() {
//       if (!this.respawnWithEvent) {
//          try {
//             Iterator var1 = Bukkit.getWorlds().iterator();
//
//             while(var1.hasNext()) {
//                World world = (World)var1.next();
//                world.setGameRule(GameRule.DO_IMMEDIATE_RESPAWN, false);
//             }
//          } catch (NoSuchFieldError var3) {
//          }
//
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onPlayerDeath(@Nonnull PlayerDeathEvent event) {
//       if (this.isEnabled()) {
//          if (this.respawnWithEvent) {
//             Bukkit.getScheduler().scheduleSyncDelayedTask(plugin, () -> {
//                event.getEntity().spigot().respawn();
//             }, 1L);
//          }
//       }
//    }
// }
//
