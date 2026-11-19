// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceHeightChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceHeightChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceHeightChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.force;
//
// import java.util.function.BiConsumer;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.EndingForceChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.challenges.annotations.ExcludeFromRandomChallenges;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.boss.BarColor;
// import org.bukkit.entity.Player;
// import org.jetbrains.annotations.NotNull;
//
// @ExcludeFromRandomChallenges
// public class ForceHeightChallenge extends EndingForceChallenge {
//    private int height;
//
//    public ForceHeightChallenge() {
//       super(MenuType.CHALLENGES, 2, 15);
//       this.setCategory(SettingCategory.FORCE);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.IRON_BOOTS, Message.forName("item-force-height-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return ChallengeHelper.getTimeRangeSettingsDescription(this, 60, 30);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 30, this.getValue() * 60 + 30);
//    }
//
//    @Nonnull
//    protected BiConsumer setupBossbar() {
//       return (bossbar, player) -> {
//          if (this.getState() == 0) {
//             bossbar.setTitle(Message.forName("bossbar-force-height-waiting").asString());
//          } else {
//             bossbar.setColor(BarColor.GREEN);
//             bossbar.setProgress((double)this.getProgress());
//             bossbar.setTitle(Message.forName("bossbar-force-height-instruction").asString(this.height, ChallengeAPI.formatTime((long)this.getSecondsLeftUntilNextActivation())));
//          }
//       };
//    }
//
//    protected boolean isFailing(@Nonnull Player player) {
//       return player.getLocation().getBlockY() != this.height;
//    }
//
//    protected void broadcastFailedMessage(@Nonnull Player player) {
//       Message.forName("force-height-fail").broadcast(Prefix.CHALLENGES, NameHelper.getName(player), player.getLocation().getBlockY());
//    }
//
//    protected void broadcastSuccessMessage() {
//       Message.forName("force-height-success").broadcast(Prefix.CHALLENGES);
//    }
//
//    protected void chooseForcing() {
//       World world = ChallengeAPI.getGameWorld(Environment.NORMAL);
//       this.height = globalRandom.range(BukkitReflectionUtils.getMinHeight(world), world.getMaxHeight());
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60, 30);
//    }
//
//    protected int getForcingTime() {
//       return globalRandom.range(210, 300);
//    }
//
//    public void loadGameState(@NotNull Document document) {
//       super.loadGameState(document);
//       if (document.contains("target")) {
//          this.height = document.getInt("target");
//          this.setState(1);
//       }
//
//    }
//
//    public void writeGameState(@NotNull Document document) {
//       super.writeGameState(document);
//       document.set("target", this.height);
//    }
// }
//
