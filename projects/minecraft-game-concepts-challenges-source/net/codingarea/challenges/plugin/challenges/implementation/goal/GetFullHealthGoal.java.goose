// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/GetFullHealthGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/GetFullHealthGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/GetFullHealthGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifierGoal;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.attribute.Attribute;
// import org.bukkit.attribute.AttributeInstance;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityRegainHealthEvent;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.2.0")
// public class GetFullHealthGoal extends SettingModifierGoal {
//    public GetFullHealthGoal() {
//       super(MenuType.GOAL, 1, 20, 20);
//       this.setCategory(SettingCategory.FASTEST_TIME);
//    }
//
//    protected void onEnable() {
//       broadcastFiltered((player) -> {
//          player.setHealth((double)this.getValue());
//       });
//    }
//
//    protected void onValueChange() {
//       broadcastFiltered((player) -> {
//          player.setHealth((double)this.getValue());
//       });
//    }
//
//    public void getWinnersOnEnd(@NotNull List winners) {
//       Iterator var2 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var2.hasNext()) {
//          Player player = (Player)var2.next();
//          if (!ignorePlayer(player)) {
//             AttributeInstance attribute = player.getAttribute(Attribute.GENERIC_MAX_HEALTH);
//             if (attribute != null && player.getHealth() >= attribute.getBaseValue()) {
//                winners.add(player);
//             }
//          }
//       }
//
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.AZURE_BLUET, Message.forName("item-get-full-health-goal"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-heart-start-description").asArray((float)this.getValue() / 2.0F);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeHeartsValueChangeTitle(this);
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onHealthChange(EntityRegainHealthEvent event) {
//       if (event.getEntity() instanceof Player) {
//          if (this.shouldExecuteEffect()) {
//             if (!ignorePlayer((Player)event.getEntity())) {
//                AttributeInstance attribute = ((Player)event.getEntity()).getAttribute(Attribute.GENERIC_MAX_HEALTH);
//                Bukkit.getScheduler().runTask(plugin, () -> {
//                   if (attribute != null && ((Player)event.getEntity()).getHealth() >= attribute.getBaseValue()) {
//                      ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
//                   }
//
//                });
//             }
//          }
//       }
//    }
// }
//
