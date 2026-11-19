// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/DamageTeleportChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/DamageTeleportChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/DamageTeleportChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge;
//
// import java.util.concurrent.ThreadLocalRandom;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.SettingModifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
//
// @Since("2.0.2")
// public class DamageTeleportChallenge extends SettingModifier {
//    private static final int PLAYER = 1;
//    private static final int EVERYONE = 2;
//
//    public DamageTeleportChallenge() {
//       super(MenuType.CHALLENGES, 1, 2);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.SHULKER_SHELL, Message.forName("item-damage-teleport-challenge"));
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       return this.getValue() == 1 ? DefaultItem.create(Material.ENDER_CHEST, Message.forName("everyone")) : DefaultItem.create(Material.PLAYER_HEAD, Message.forName("player"));
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChangeChallengeValueTitle(this, (Object)(this.getValue() == 0 ? Message.forName("everyone").asString() : Message.forName("player").asString()));
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onDamage(@Nonnull EntityDamageEvent event) {
//       if (event.getEntity() instanceof Player) {
//          if (this.shouldExecuteEffect()) {
//             if (!ChallengeHelper.finalDamageIsNull(event)) {
//                this.handleDamage((Player)event.getEntity());
//             }
//          }
//       }
//    }
//
//    private void handleDamage(@Nonnull Player player) {
//       Location location = player.getWorld().getHighestBlockAt(this.getRandomLocation(player.getWorld())).getLocation();
//       location.setY(location.getY() + 1.0D);
//       location.getChunk().load(true);
//       if (this.getValue() == 1) {
//          player.teleport(location);
//       } else {
//          broadcastFiltered((player1) -> {
//             player1.teleport(location);
//          });
//       }
//
//    }
//
//    public Location getRandomLocation(World world) {
//       double size = world.getWorldBorder().getSize() / 2.0D;
//       --size;
//       double randomX = ThreadLocalRandom.current().nextDouble(-size, size);
//       double randomY = ThreadLocalRandom.current().nextDouble(-size, size);
//       return world.getWorldBorder().getCenter().add(randomX, 0.0D, randomY);
//    }
// }
//
