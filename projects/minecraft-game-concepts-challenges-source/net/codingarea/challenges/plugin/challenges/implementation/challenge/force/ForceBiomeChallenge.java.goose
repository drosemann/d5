// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceBiomeChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceBiomeChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/force/ForceBiomeChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.force;
//
// import java.util.Arrays;
// import java.util.function.BiConsumer;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.CompletableForceChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.challenges.annotations.ExcludeFromRandomChallenges;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Material;
// import org.bukkit.block.Biome;
// import org.bukkit.boss.BarColor;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.0")
// @ExcludeFromRandomChallenges
// public class ForceBiomeChallenge extends CompletableForceChallenge {
//    private Biome biome;
//
//    public ForceBiomeChallenge() {
//       super(MenuType.CHALLENGES, 2, 20, 5);
//       this.setCategory(SettingCategory.FORCE);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.CHAINMAIL_BOOTS, Message.forName("item-force-biome-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return ChallengeHelper.getTimeRangeSettingsDescription(this, 180, 60);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 * 3 - 60, this.getValue() * 60 * 3 + 60);
//    }
//
//    @Nonnull
//    protected BiConsumer setupBossbar() {
//       return (bossbar, player) -> {
//          if (this.getState() == 0) {
//             bossbar.setTitle(Message.forName("bossbar-force-biome-waiting").asString());
//          } else {
//             bossbar.setColor(BarColor.GREEN);
//             bossbar.setProgress((double)this.getProgress());
//             bossbar.setTitle(Message.forName("bossbar-force-biome-instruction").asComponent(this.biome, ChallengeAPI.formatTime((long)this.getSecondsLeftUntilNextActivation())));
//          }
//       };
//    }
//
//    protected void broadcastFailedMessage() {
//       Message.forName("force-biome-fail").broadcast(Prefix.CHALLENGES, BukkitStringUtils.getBiomeName(this.biome));
//    }
//
//    protected void broadcastSuccessMessage(@Nonnull Player player) {
//       Message.forName("force-biome-success").broadcast(Prefix.CHALLENGES, NameHelper.getName(player), BukkitStringUtils.getBiomeName(this.biome));
//    }
//
//    protected void chooseForcing() {
//       Biome[] biomes = (Biome[])Arrays.stream(Biome.values()).filter((biome) -> {
//          return !biome.name().contains("END");
//       }).filter((biome) -> {
//          return !biome.name().contains("MUSHROOM");
//       }).filter((biome) -> {
//          return !biome.name().contains("VOID");
//       }).filter((biome) -> {
//          return !biome.name().equals("CUSTOM");
//       }).toArray((x$0) -> {
//          return new Biome[x$0];
//       });
//       this.biome = (Biome)globalRandom.choose((Object[])biomes);
//    }
//
//    protected int getForcingTime() {
//       return globalRandom.around(this.getRarity(this.biome) * 60 * 6, 60);
//    }
//
//    private int getRarity(@Nonnull Biome biome) {
//       Object[][] mapping = new Object[][]{{"BADLANDS", 5}, {"JUNGLE", 4}, {"BAMBOO", 4}, {"MODIFIED", 3}, {"TALL", 3}, {"SWAMP", 2}};
//       Object[][] var3 = mapping;
//       int var4 = mapping.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          Object[] pair = var3[var5];
//          String key = (String)pair[0];
//          if (biome.name().contains(key)) {
//             return (Integer)pair[1];
//          }
//       }
//
//       return 1;
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60 * 3, 60);
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (event.getTo() != null) {
//             if (event.getTo().getBlock().getBiome() == this.biome) {
//                this.completeForcing(event.getPlayer());
//             }
//          }
//       }
//    }
//
//    public void loadGameState(@NotNull Document document) {
//       super.loadGameState(document);
//       if (document.contains("target")) {
//          this.biome = (Biome)document.getEnum("target", Biome.class);
//          this.setState(this.biome == null ? 0 : 1);
//       }
//
//    }
//
//    public void writeGameState(@NotNull Document document) {
//       super.writeGameState(document);
//       document.set("target", this.biome);
//    }
// }
//
