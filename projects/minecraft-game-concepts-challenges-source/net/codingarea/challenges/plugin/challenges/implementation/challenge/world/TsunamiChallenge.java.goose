// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/TsunamiChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/TsunamiChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/world/TsunamiChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;
//
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.List;
// import java.util.Map;
// import java.util.function.BiConsumer;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
// import net.anweisen.utilities.common.annotations.Since;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.ListBuilder;
// import org.bukkit.Bukkit;
// import org.bukkit.Chunk;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.block.Block;
// import org.bukkit.boss.BarColor;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.player.PlayerMoveEvent;
// import org.bukkit.event.player.PlayerTeleportEvent;
// import org.bukkit.event.world.ChunkUnloadEvent;
//
// @Since("2.0")
// public class TsunamiChallenge extends TimedChallenge {
//    public static final int RANGE = 5;
//    private final List floodedChunks = new ArrayList();
//    private int waterHeight = Integer.MAX_VALUE;
//    private int lavaHeight = 0;
//
//    public TsunamiChallenge() {
//       super(MenuType.CHALLENGES, 1, 40, 4);
//       this.setCategory(SettingCategory.WORLD);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.ICE, Message.forName("item-tsunami-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-time-seconds-description").asArray(this.getValue() * 15);
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChallengeSecondsValueChangeTitle(this, this.getValue() * 15);
//    }
//
//    protected void onEnable() {
//       if (this.waterHeight == Integer.MAX_VALUE) {
//          this.waterHeight = BukkitReflectionUtils.getMinHeight(ChallengeAPI.getGameWorld(Environment.NORMAL));
//       }
//
//       this.bossbar.setContent((bossbar, player) -> {
//          World world = player.getWorld();
//          Environment environment = world.getEnvironment();
//          int height = environment == Environment.NORMAL ? this.waterHeight : this.lavaHeight;
//          if (height < world.getMaxHeight() - 1) {
//             bossbar.setProgress((double)this.getProgress());
//          }
//
//          if (environment == Environment.NORMAL) {
//             bossbar.setColor(BarColor.BLUE);
//             bossbar.setTitle(Message.forName("bossbar-tsunami-water").asString(this.waterHeight));
//          } else if (environment == Environment.NETHER) {
//             bossbar.setColor(BarColor.RED);
//             bossbar.setTitle(Message.forName("bossbar-tsunami-lava").asString(this.lavaHeight));
//          } else {
//             bossbar.setVisible(false);
//          }
//
//       });
//       this.bossbar.show();
//    }
//
//    protected void onDisable() {
//       this.bossbar.hide();
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return this.getValue() * 15;
//    }
//
//    protected void handleCountdown() {
//       this.bossbar.update();
//    }
//
//    protected void onTimeActivation() {
//       this.restartTimer();
//       Iterator var1 = ChallengeAPI.getGameWorlds().iterator();
//
//       while(var1.hasNext()) {
//          World world = (World)var1.next();
//          if (!world.getPlayers().isEmpty()) {
//             if (world.getEnvironment() == Environment.NORMAL) {
//                if (this.waterHeight < world.getMaxHeight() - 1) {
//                   ++this.waterHeight;
//                }
//             } else if (world.getEnvironment() == Environment.NETHER && this.lavaHeight < world.getMaxHeight() - 1) {
//                ++this.lavaHeight;
//             }
//          }
//       }
//
//       List previouslyFlooded = new ArrayList(this.floodedChunks);
//       this.bossbar.update();
//       this.floodedChunks.clear();
//       Iterator var5 = this.getChunksToFlood().iterator();
//
//       while(var5.hasNext()) {
//          Chunk chunk = (Chunk)var5.next();
//          this.floodChunk(chunk, !previouslyFlooded.contains(chunk));
//       }
//
//    }
//
//    @EventHandler(
//       priority = EventPriority.MONITOR,
//       ignoreCancelled = true
//    )
//    private void onPlayerMove(@Nonnull PlayerMoveEvent event) {
//       if (this.shouldExecuteEffect()) {
//          if (!ignorePlayer(event.getPlayer())) {
//             if (event.getTo() != null) {
//                Chunk newChunk = event.getTo().getChunk();
//                if (event.getFrom().getChunk() != newChunk) {
//                   Iterator var3 = this.getChunksAroundChunk(newChunk).iterator();
//
//                   while(var3.hasNext()) {
//                      Chunk chunk = (Chunk)var3.next();
//                      this.floodChunk(chunk, true);
//                   }
//
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
//    public void onTeleport(@Nonnull PlayerTeleportEvent event) {
//       if (!ignorePlayer(event.getPlayer())) {
//          if (this.shouldExecuteEffect()) {
//             if (event.getTo() != null) {
//                Chunk newChunk = event.getTo().getChunk();
//                if (event.getFrom().getChunk() != newChunk) {
//                   this.bossbar.update();
//                   Iterator var3 = this.getChunksAroundChunk(newChunk).iterator();
//
//                   while(var3.hasNext()) {
//                      Chunk chunk = (Chunk)var3.next();
//                      this.floodChunk(chunk, true);
//                   }
//
//                }
//             }
//          }
//       }
//    }
//
//    @EventHandler
//    public void onChunkUnload(@Nonnull ChunkUnloadEvent event) {
//       this.floodedChunks.remove(event.getChunk());
//    }
//
//    private void floodChunk(@Nonnull Chunk chunk, boolean discovered) {
//       if (!this.floodedChunks.contains(chunk)) {
//          this.floodedChunks.add(chunk);
//          if (chunk.getWorld().getEnvironment() != Environment.THE_END) {
//             boolean overworld = chunk.getWorld().getEnvironment() == Environment.NORMAL;
//             int height = overworld ? this.waterHeight : this.lavaHeight;
//             this.floodChunk0(chunk, discovered ? null : height - 1, height, overworld, (delay, task) -> {
//                Bukkit.getScheduler().runTaskLater(plugin, task, (long)delay);
//             });
//          }
//       }
//    }
//
//    private void floodChunk0(@Nonnull Chunk chunk, @Nullable Integer givenStartAt, int height, boolean overworld, @Nonnull BiConsumer executor) {
//       int startAt = givenStartAt != null ? Math.max(BukkitReflectionUtils.getMinHeight(chunk.getWorld()) + 1, givenStartAt) : BukkitReflectionUtils.getMinHeight(chunk.getWorld()) + 1;
//       Map blocksByDelay = new HashMap();
//       Bukkit.getScheduler().runTaskAsynchronously(plugin, () -> {
//          for(int x = 0; x < 16; ++x) {
//             for(int z = 0; z < 16; ++z) {
//                for(int y = startAt + 1; y <= height; ++y) {
//                   List blocks = (List)blocksByDelay.computeIfAbsent(0, (key) -> {
//                      return new ArrayList(16);
//                   });
//                   Block block = chunk.getBlock(x, y, z);
//                   Material type = block.getType();
//                   if (type != Material.WATER && type != Material.LAVA && block.isPassable() || overworld && type == Material.LAVA) {
//                      blocks.add(block);
//                   }
//                }
//             }
//          }
//
//          blocksByDelay.forEach((delay, blocksx) -> {
//             executor.accept(delay, () -> {
//                Iterator var2 = blocksx.iterator();
//
//                while(var2.hasNext()) {
//                   Block block = (Block)var2.next();
//                   block.setType(overworld ? Material.WATER : Material.LAVA, false);
//                }
//
//             });
//          });
//       });
//    }
//
//    private List getChunksToFlood() {
//       return (new ListBuilder(new Chunk[0])).fill((chunkListBuilder) -> {
//          broadcastFiltered((player) -> {
//             chunkListBuilder.addAllIfNotContains((Collection)this.getChunksAroundChunk(player.getLocation().getChunk()));
//          });
//       }).build();
//    }
//
//    private List getChunksAroundChunk(@Nonnull Chunk origin) {
//       return (new ListBuilder(new Chunk[0])).fill((builder) -> {
//          for(int x = -5; x <= 5; ++x) {
//             for(int z = -5; z <= 5; ++z) {
//                builder.addIfNotContains(origin.getWorld().getChunkAt(origin.getX() + x, origin.getZ() + z));
//             }
//          }
//
//       }).build();
//    }
//
//    public void writeGameState(@Nonnull Document document) {
//       super.writeGameState(document);
//       document.set("waterHeight", this.waterHeight);
//       document.set("lavaHeight", this.lavaHeight);
//    }
//
//    public void loadGameState(@Nonnull Document document) {
//       super.loadGameState(document);
//       this.waterHeight = document.getInt("waterHeight");
//       this.lavaHeight = document.getInt("lavaHeight");
//    }
// }
//
