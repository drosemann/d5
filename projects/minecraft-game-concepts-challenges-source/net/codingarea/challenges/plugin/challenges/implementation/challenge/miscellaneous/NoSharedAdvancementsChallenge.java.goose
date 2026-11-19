// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoSharedAdvancementsChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoSharedAdvancementsChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/NoSharedAdvancementsChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.advancement.Advancement;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerAdvancementDoneEvent;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.2.0")
// public class NoSharedAdvancementsChallenge extends Setting {
//    private final List advancementsDone = new LinkedList();
//
//    public NoSharedAdvancementsChallenge() {
//       super(MenuType.CHALLENGES);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.KNOWLEDGE_BOOK, Message.forName("item-no-shared-advancements-challenge"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH,
//       ignoreCancelled = true
//    )
//    public void onAdvancementDone(PlayerAdvancementDoneEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!event.getAdvancement().getKey().toString().contains(":recipes/")) {
//             if (this.advancementsDone.contains(event.getAdvancement())) {
//                ChallengeHelper.kill(event.getPlayer());
//             } else {
//                this.advancementsDone.add(event.getAdvancement());
//             }
//
//          }
//       }
//    }
//
//    public void loadGameState(@NotNull Document document) {
//       this.advancementsDone.clear();
//       List advancementKeys = document.getStringList("advancements");
//       Iterator var3 = advancementKeys.iterator();
//
//       while(var3.hasNext()) {
//          String advancementKey = (String)var3.next();
//
//          try {
//             this.advancementsDone.add(Bukkit.getAdvancement(BukkitReflectionUtils.fromString(advancementKey)));
//          } catch (Exception var6) {
//          }
//       }
//
//    }
//
//    public void writeGameState(@NotNull Document document) {
//       List foundItems = new LinkedList();
//       Iterator var3 = this.advancementsDone.iterator();
//
//       while(var3.hasNext()) {
//          Advancement advancement = (Advancement)var3.next();
//          foundItems.add(advancement.getKey().toString());
//       }
//
//       document.set("advancements", foundItems);
//    }
// }
//
