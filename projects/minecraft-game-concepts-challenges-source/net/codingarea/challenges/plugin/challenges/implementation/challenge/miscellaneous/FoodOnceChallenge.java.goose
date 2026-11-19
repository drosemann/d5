// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodOnceChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodOnceChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/FoodOnceChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerItemConsumeEvent;
//
// public class FoodOnceChallenge extends SettingModifier {
//    public FoodOnceChallenge() {
//       super(MenuType.CHALLENGES, 2);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.COOKED_BEEF, Message.forName("item-food-once-challenge"));
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       switch(this.getValue()) {
//       case 1:
//          return DefaultItem.create(Material.PLAYER_HEAD, Message.forName("item-food-once-challenge-player"));
//       case 2:
//          return DefaultItem.create(Material.ENDER_CHEST, Message.forName("item-food-once-challenge-everyone"));
//       default:
//          return super.createSettingsItem();
//       }
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() == 1 ? Message.forName("item-food-once-challenge-player") : Message.forName("item-food-once-challenge-everyone")));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onPlayerItemConsume(@Nonnull PlayerItemConsumeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             Material type = event.getItem().getType();
//             if (this.hasEaten(event.getPlayer(), type)) {
//                Message.forName("food-once-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()), type);
//                ChallengeHelper.kill(event.getPlayer(), 1);
//             } else {
//                this.addFood(event.getPlayer(), type);
//                if (this.teamFoodsActivated()) {
//                   Message.forName("food-once-new-food-team").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()), type);
//                } else {
//                   Message.forName("food-once-new-food").send(event.getPlayer(), Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()), type);
//                }
//             }
//
//          }
//       }
//    }
//
//    private void addFood(Player player, Material type) {
//       if (this.teamFoodsActivated()) {
//          this.addTeamFood(type);
//       } else {
//          this.addPlayerFood(player, type);
//       }
//
//    }
//
//    private void addPlayerFood(@Nonnull Player player, @Nonnull Material material) {
//       List foods = this.getPlayerData(player).getEnumList("foods", Material.class);
//       foods.add(material);
//       this.getPlayerData(player).set("foods", foods);
//    }
//
//    private boolean hasEaten(@Nonnull Player player, @Nonnull Material material) {
//       return this.teamFoodsActivated() ? this.hasBeenEatenByTeam(material) : this.getPlayerData(player).getEnumList("foods", Material.class).contains(material);
//    }
//
//    private void addTeamFood(@Nonnull Material material) {
//       List foods = this.getGameStateData().getEnumList("foods", Material.class);
//       foods.add(material);
//       this.getGameStateData().set("foods", foods);
//    }
//
//    private boolean hasBeenEatenByTeam(@Nonnull Material material) {
//       return this.getGameStateData().getEnumList("foods", Material.class).contains(material);
//    }
//
//    private boolean teamFoodsActivated() {
//       return this.getValue() == 2;
//    }
// }
//
