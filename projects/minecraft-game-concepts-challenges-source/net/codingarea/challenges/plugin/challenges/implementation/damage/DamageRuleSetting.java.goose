// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/damage/DamageRuleSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/damage/DamageRuleSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/damage/DamageRuleSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.damage;
//
// import java.util.Arrays;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
// import org.jetbrains.annotations.NotNull;
//
// public class DamageRuleSetting extends Setting {
//    private final List causes;
//    private final String name;
//    private final ItemBuilder preset;
//
//    public DamageRuleSetting(@Nonnull ItemBuilder preset, @Nonnull String name, @Nonnull DamageCause... causes) {
//       super(MenuType.DAMAGE, true);
//       this.causes = Arrays.asList(causes);
//       this.name = name;
//       this.preset = preset;
//    }
//
//    @NotNull
//    public String getUniqueName() {
//       return super.getUniqueName() + this.name;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return this.preset.clone().applyFormat(Message.forName("item-damage-rule-" + this.name).asItemDescription());
//    }
//
//    @EventHandler(
//       priority = EventPriority.NORMAL
//    )
//    public void onDamage(@Nonnull EntityDamageEvent event) {
//       if (!ChallengeAPI.isWorldInUse()) {
//          if (!this.isEnabled()) {
//             if (event.getEntity() instanceof Player) {
//                if (event.getCause() != DamageCause.VOID && event.getCause() != DamageCause.CUSTOM) {
//                   if (this.causes.contains(event.getCause())) {
//                      event.setCancelled(true);
//                   }
//                }
//             }
//          }
//       }
//    }
// }
//
