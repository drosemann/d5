// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/AllAdvancementGoal.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/AllAdvancementGoal.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/goal/AllAdvancementGoal.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.goal;
//
// import java.util.Collections;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.Objects;
// import java.util.concurrent.atomic.AtomicInteger;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.PointsGoal;
// import net.codingarea.challenges.plugin.challenges.type.helper.GoalHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.management.server.ChallengeEndCause;
// import net.codingarea.challenges.plugin.management.server.scoreboard.ChallengeScoreboard;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.advancement.Advancement;
// import org.bukkit.advancement.AdvancementProgress;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerAdvancementDoneEvent;
// import org.bukkit.event.player.PlayerGameModeChangeEvent;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.scheduler.BukkitScheduler;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.0")
// public class AllAdvancementGoal extends PointsGoal {
//    private final List allAdvancements;
//    private final int advancementCount;
//
//    public AllAdvancementGoal() {
//       this.setCategory(SettingCategory.FASTEST_TIME);
//       this.allAdvancements = new LinkedList();
//       Bukkit.getServer().advancementIterator().forEachRemaining((advancement) -> {
//          if (!advancement.getKey().toString().contains(":recipes/")) {
//             this.allAdvancements.add(advancement);
//          }
//
//       });
//       this.advancementCount = this.allAdvancements.size();
//    }
//
//    protected void onEnable() {
//       this.updateAdvancements();
//       this.scoreboard.setContent(GoalHelper.createScoreboard(() -> {
//          return this.getPoints(new AtomicInteger(), true);
//       }, (player) -> {
//          return Collections.singletonList(Message.forName("all-advancements-goal").asString(this.advancementCount));
//       }));
//       this.scoreboard.show();
//    }
//
//    protected void onDisable() {
//       this.scoreboard.hide();
//    }
//
//    public void getWinnersOnEnd(@NotNull List winners) {
//       broadcastFiltered((player) -> {
//          if (this.hasWon(player)) {
//             winners.add(player);
//          }
//
//       });
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BOOK, Message.forName("item-all-advancements-goal"));
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onAdvancement(PlayerAdvancementDoneEvent event) {
//       if (!event.getAdvancement().getKey().toString().contains(":recipes/")) {
//          if (this.shouldExecuteEffect()) {
//             if (!ignorePlayer(event.getPlayer())) {
//                this.updateAdvancements(event.getPlayer());
//                this.scoreboard.update();
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onJoin(PlayerJoinEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             this.updateAdvancements(event.getPlayer());
//             this.scoreboard.update();
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.HIGH
//    )
//    public void onGamemodeChange(PlayerGameModeChangeEvent event) {
//       if (this.shouldExecuteEffect()) {
//          BukkitScheduler var10000 = Bukkit.getScheduler();
//          Challenges var10001 = plugin;
//          ChallengeScoreboard var10002 = this.scoreboard;
//          Objects.requireNonNull(var10002);
//          var10000.runTask(var10001, var10002::update);
//       }
//    }
//
//    protected void updateAdvancements() {
//       broadcastFiltered(this::updateAdvancements);
//    }
//
//    protected void updateAdvancements(@Nonnull Player player) {
//       int done = 0;
//       Iterator var3 = this.allAdvancements.iterator();
//
//       while(var3.hasNext()) {
//          Advancement advancement = (Advancement)var3.next();
//          AdvancementProgress progress = player.getAdvancementProgress(advancement);
//          if (progress.isDone()) {
//             ++done;
//          }
//       }
//
//       this.setPoints(player.getUniqueId(), done);
//       this.checkForWinning(player);
//    }
//
//    protected void checkForWinning(Player player) {
//       if (this.hasWon(player)) {
//          ChallengeAPI.endChallenge(ChallengeEndCause.GOAL_REACHED);
//       }
//
//    }
//
//    protected boolean hasWon(@Nonnull Player player) {
//       return this.getPoints(player.getUniqueId()) >= this.advancementCount;
//    }
// }
//
