// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/EnderGamesChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/EnderGamesChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/miscellaneous/EnderGamesChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.miscellaneous;
//
// import java.util.Iterator;
// import java.util.List;
// import java.util.stream.Collectors;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
//
// @Since("2.0")
// public class EnderGamesChallenge extends TimedChallenge {
//    public EnderGamesChallenge() {
//       super(MenuType.CHALLENGES, 1, 10, 5, false);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ENDER_PEARL, Message.forName("item-ender-games-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-time-seconds-range-description").asArray(this.getValue() * 60 - 20, this.getValue() * 60 + 20);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsRangeValueChangeTitle(this, this.getValue() * 60 - 20, this.getValue() * 60 + 20);
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return globalRandom.around(this.getValue() * 60, 20);
//    }
//
//    protected void onTimeActivation() {
//       this.restartTimer();
//       Iterator var1 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var1.hasNext()) {
//          Player player = (Player)var1.next();
//          if (!ignorePlayer(player)) {
//             this.teleportRandom(player);
//          }
//       }
//
//       SoundSample.TELEPORT.broadcast();
//    }
//
//    private void teleportRandom(@Nonnull Player player) {
//       List list = (List)player.getWorld().getNearbyEntities(player.getLocation(), 200.0D, 200.0D, 200.0D).stream().filter((entity) -> {
//          return !(entity instanceof Player);
//       }).filter((entity) -> {
//          return entity instanceof LivingEntity;
//       }).collect(Collectors.toList());
//       Entity targetEntity = (Entity)list.get(globalRandom.nextInt(list.size()));
//       Location playerLocation = player.getLocation().clone();
//       player.teleport(targetEntity.getLocation());
//       Message.forName("endergames-teleport").send(player, Prefix.CHALLENGES, targetEntity.getType());
//       targetEntity.teleport(playerLocation);
//    }
// }
//
