// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHitDelaySetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHitDelaySetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/NoHitDelaySetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
//
// public class NoHitDelaySetting extends Setting {
//    public NoHitDelaySetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @EventHandler(
//       priority = EventPriority.NORMAL,
//       ignoreCancelled = true
//    )
//    public void onDamageByEntity(@Nonnull EntityDamageEvent event) {
//       if (event.getEntity() instanceof LivingEntity) {
//          if (this.shouldExecuteEffect()) {
//             Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), () -> {
//                ((LivingEntity)event.getEntity()).setNoDamageTicks(0);
//             }, 1L);
//          }
//       }
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.FEATHER, Message.forName("item-no-hit-delay-setting"));
//    }
// }
//
