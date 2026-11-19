// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/MobsRespawnInEndChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/MobsRespawnInEndChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/entities/MobsRespawnInEndChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.entities;
//
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import java.util.Map.Entry;
// import java.util.concurrent.ThreadLocalRandom;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.spigot.events.EntityDeathByPlayerEvent;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Location;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.boss.BarColor;
// import org.bukkit.entity.EnderDragon;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.EntityType;
// import org.bukkit.entity.LivingEntity;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerTeleportEvent;
// import org.bukkit.util.Vector;
// import org.jetbrains.annotations.NotNull;
//
// @Since("2.1.2")
// public class MobsRespawnInEndChallenge extends Setting {
//    private final Map toSpawnEntities = new HashMap();
//    private int totalMobsInEnd = 0;
//
//    public MobsRespawnInEndChallenge() {
//       super(MenuType.CHALLENGES);
//       this.setCategory(SettingCategory.ENTITIES);
//    }
//
//    @NotNull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ENDER_EYE, Message.forName("item-respawn-end-challenge"));
//    }
//
//    protected void onEnable() {
//       this.bossbar.setContent((bar, player) -> {
//          bar.setColor(BarColor.PURPLE);
//          bar.setTitle(Message.forName("bossbar-respawn-end").asString(this.totalMobsInEnd));
//       });
//       this.bossbar.show();
//    }
//
//    protected void onDisable() {
//       this.bossbar.hide();
//    }
//
//    public void writeGameState(@NotNull Document document) {
//       document.set("total", this.totalMobsInEnd);
//    }
//
//    public void loadGameState(@NotNull Document document) {
//       this.totalMobsInEnd = document.getInt("total");
//    }
//
//    private void addEntityToSpawn(EntityType type) {
//       if (!ChallengeAPI.isPlayerInGameWorld(Environment.THE_END)) {
//          this.increaseEntityToSpawnCount(type);
//       } else {
//          this.spawnEntityInEnd(type, 1);
//       }
//
//       ++this.totalMobsInEnd;
//       this.bossbar.update();
//    }
//
//    private void spawnEntityInEnd(EntityType type, int count) {
//       World world = ChallengeAPI.getGameWorld(Environment.THE_END);
//       Location spawnLocation = world.getHighestBlockAt(0, 0).getLocation().add(0.5D, 1.0D, 0.5D);
//
//       for(int i = 0; i < count; ++i) {
//          Entity entity = world.spawnEntity(spawnLocation, type);
//          if (entity instanceof LivingEntity) {
//             entity.setVelocity(Vector.getRandom().multiply(ThreadLocalRandom.current().nextBoolean() ? -1 : 1).setY(0));
//             ((LivingEntity)entity).setNoDamageTicks(100);
//          }
//       }
//
//    }
//
//    private void increaseEntityToSpawnCount(EntityType type) {
//       Integer count = (Integer)this.toSpawnEntities.getOrDefault(type, 0);
//       this.toSpawnEntities.put(type, count + 1);
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onMobKill(EntityDeathByPlayerEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!(event.getEntity() instanceof Player) && !(event.getEntity() instanceof EnderDragon)) {
//             if (event.getEntity().getLocation().getWorld() != null) {
//                if (event.getEntity().getLocation().getWorld().getEnvironment() != Environment.THE_END) {
//                   if (!ChallengeHelper.ignoreDamager(event.getKiller())) {
//                      this.addEntityToSpawn(event.getEntityType());
//                      SoundSample.PLING.play(event.getKiller());
//                   }
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    public void onWorldChange(PlayerTeleportEvent event) {
//       if (event.getTo() != null && event.getTo().getWorld() != null && event.getTo().getWorld() != event.getFrom().getWorld()) {
//          if (event.getTo().getWorld().getEnvironment() == Environment.THE_END) {
//             Iterator var2 = this.toSpawnEntities.entrySet().iterator();
//
//             while(var2.hasNext()) {
//                Entry entry = (Entry)var2.next();
//                EntityType type = (EntityType)entry.getKey();
//                Integer count = (Integer)entry.getValue();
//                this.spawnEntityInEnd(type, count);
//             }
//
//             this.toSpawnEntities.clear();
//          }
//       }
//    }
// }
//
