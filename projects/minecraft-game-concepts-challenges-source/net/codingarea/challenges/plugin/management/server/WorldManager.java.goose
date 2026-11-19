// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/WorldManager.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/WorldManager.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/server/WorldManager.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.server;
//
// import java.io.File;
// import java.io.IOException;
// import java.io.InputStream;
// import java.io.OutputStream;
// import java.nio.file.Files;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.Map;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import lombok.Generated;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.anweisen.utilities.common.config.Document;
// import net.anweisen.utilities.common.config.FileDocument;
// import net.anweisen.utilities.common.misc.FileUtils;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.utils.bukkit.container.PlayerData;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.GameRule;
// import org.bukkit.Location;
// import org.bukkit.World;
// import org.bukkit.WorldCreator;
// import org.bukkit.WorldType;
// import org.bukkit.World.Environment;
// import org.bukkit.command.CommandSender;
// import org.bukkit.entity.Player;
//
// public final class WorldManager {
//    private static final String customSeedWorldPrefix = "pregenerated_";
//    private final boolean restartOnReset;
//    private final boolean enableFreshReset;
//    private final long customSeed;
//    private final String levelName;
//    private final String[] worlds;
//    private final Map playerData = new HashMap();
//    private boolean shutdownBecauseOfReset = false;
//    private boolean useCustomSeed;
//    private WorldManager.WorldSettings settings = new WorldManager.WorldSettings();
//    private World flatWorld;
//    private boolean worldInUse;
//
//    public WorldManager() {
//       Document pluginConfig = Challenges.getInstance().getConfigDocument();
//       this.restartOnReset = pluginConfig.getBoolean("restart-on-reset");
//       this.enableFreshReset = pluginConfig.getBoolean("enable-fresh-reset");
//       Document seedConfig = pluginConfig.getDocument("custom-seed");
//       this.useCustomSeed = seedConfig.getBoolean("config");
//       this.customSeed = seedConfig.getLong("seed");
//       Document sessionConfig = Challenges.getInstance().getConfigManager().getSessionConfig();
//       this.levelName = sessionConfig.getString("level-name", "world");
//       this.worlds = new String[]{this.levelName, this.levelName + "_nether", this.levelName + "_the_end"};
//    }
//
//    public void load() {
//       this.executeWorldResetIfNecessary();
//    }
//
//    public void enable() {
//       this.loadExtraWorld();
//    }
//
//    public void prepareWorldReset(@Nullable CommandSender requestedBy) {
//       this.prepareWorldReset(requestedBy, this.customSeed);
//    }
//
//    public void prepareWorldReset(@Nullable CommandSender requestedBy, @Nullable Long seed) {
//       if (seed == null && this.useCustomSeed) {
//          seed = this.customSeed;
//       }
//
//       if (seed != null) {
//          this.useCustomSeed = true;
//       }
//
//       this.shutdownBecauseOfReset = true;
//       ChallengeAPI.pauseTimer(false);
//       Challenges.getInstance().getScheduler().stop();
//       this.resetConfigs();
//       String requester = requestedBy instanceof Player ? NameHelper.getName((Player)requestedBy) : "§4§lConsole";
//       String kickMessage = Message.forName("server-reset").asString(requester);
//       Bukkit.getOnlinePlayers().forEach((player) -> {
//          player.kickPlayer(kickMessage);
//       });
//       if (seed != null) {
//          this.generateCustomSeedWorlds(seed);
//       }
//
//       Bukkit.getScheduler().runTaskLater(Challenges.getInstance(), this::stopServerNow, 3L);
//    }
//
//    private void generateCustomSeedWorlds(long seed) {
//       Logger.debug("Generating custom seed worlds with seed " + seed);
//       String[] var3 = this.worlds;
//       int var4 = var3.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          String name = var3[var5];
//          World world = Bukkit.getWorld(name);
//          if (world == null) {
//             Logger.error("Could not find world {}", name);
//          } else {
//             String newWorldName = "pregenerated_" + name;
//             File folder = new File(Bukkit.getWorldContainer(), newWorldName);
//             if (folder.exists()) {
//                FileUtils.deleteWorldFolder(folder);
//             }
//
//             WorldCreator creator = (new WorldCreator(newWorldName)).seed(seed).environment(world.getEnvironment());
//             creator.createWorld();
//             Logger.debug("Created custom seed world {}", newWorldName);
//          }
//       }
//
//    }
//
//    private void resetConfigs() {
//       FileDocument sessionConfig = Challenges.getInstance().getConfigManager().getSessionConfig();
//       sessionConfig.clear();
//       sessionConfig.set("reset", true);
//       sessionConfig.set("seed-reset", this.useCustomSeed);
//       if (!Bukkit.getWorlds().isEmpty()) {
//          sessionConfig.set("level-name", ChallengeAPI.getGameWorld(Environment.NORMAL).getName());
//       }
//
//       sessionConfig.save();
//       FileDocument gamestateConfig = Challenges.getInstance().getConfigManager().getGamestateConfig();
//       gamestateConfig.clear();
//       gamestateConfig.save();
//    }
//
//    private void loadExtraWorld() {
//       if (!Challenges.getInstance().isReloaded()) {
//          this.deleteWorld("challenges-extra");
//       }
//
//       try {
//          this.flatWorld = (new WorldCreator("challenges-extra")).type(WorldType.FLAT).generateStructures(false).createWorld();
//          if (this.flatWorld == null) {
//             return;
//          }
//
//          this.flatWorld.setSpawnFlags(false, false);
//          this.disableGameRuleInFlatWorld("doMobSpawning");
//          this.disableGameRuleInFlatWorld("doTraderSpawning");
//          this.disableGameRuleInFlatWorld("doWeatherCycle");
//          this.disableGameRuleInFlatWorld("doDaylightCycle");
//          this.disableGameRuleInFlatWorld("disableRaids");
//          this.disableGameRuleInFlatWorld("mobGriefing");
//       } catch (Exception var2) {
//          Logger.error("Could not load extra world!", var2);
//          Logger.error("Probably the server version or server system was changed and the old world is not compatible with it");
//          Logger.error("Please delete all worlds and try again!");
//          return;
//       }
//
//       this.teleportPlayersOutOfExtraWorld();
//    }
//
//    private void teleportPlayersOutOfExtraWorld() {
//       Iterator var1 = Bukkit.getOnlinePlayers().iterator();
//
//       while(var1.hasNext()) {
//          Player player = (Player)var1.next();
//          if (player.getWorld() == this.flatWorld) {
//             Location location = player.getRespawnLocation();
//             if (location == null) {
//                World world = Bukkit.getWorld(this.levelName);
//                if (world == null) {
//                   world = ChallengeAPI.getGameWorld(Environment.NORMAL);
//                }
//
//                location = world.getSpawnLocation();
//             }
//
//             player.teleport(location);
//          }
//       }
//
//    }
//
//    private void disableGameRuleInFlatWorld(@Nonnull String name) {
//       GameRule gamerule = GameRule.getByName(name);
//       if (gamerule != null) {
//          this.flatWorld.setGameRule(gamerule, false);
//       }
//    }
//
//    private void executeWorldResetIfNecessary() {
//       if (Challenges.getInstance().getConfigManager().getSessionConfig().getBoolean("reset")) {
//          this.executeWorldReset();
//       }
//
//    }
//
//    public void executeWorldReset() {
//       FileDocument sessionConfig = Challenges.getInstance().getConfigManager().getSessionConfig();
//       boolean seedReset = sessionConfig.getBoolean("seed-reset");
//       Logger.info("Deleting worlds..");
//       String[] var3 = this.worlds;
//       int var4 = var3.length;
//
//       for(int var5 = 0; var5 < var4; ++var5) {
//          String world = var3[var5];
//          this.deleteWorld(world);
//          if (seedReset) {
//             this.copyPreGeneratedWorld(world);
//          } else {
//             this.deletePreGeneratedWorld(world);
//          }
//       }
//
//       Iterator var7 = Challenges.getInstance().getGameWorldStorage().getCustomGeneratedGameWorlds().iterator();
//
//       while(var7.hasNext()) {
//          String world = (String)var7.next();
//          this.deleteWorld(world);
//       }
//
//       sessionConfig.set("reset", false);
//       sessionConfig.set("seed-reset", false);
//       sessionConfig.save();
//    }
//
//    private void deleteWorld(@Nonnull String name) {
//       File folder = new File(Bukkit.getWorldContainer(), name);
//       FileUtils.deleteWorldFolder(folder);
//       Logger.info("Deleted world {}", name);
//    }
//
//    private void copyPreGeneratedWorld(@Nonnull String name) {
//       File source = new File(Bukkit.getWorldContainer(), "pregenerated_" + name);
//       if (source.exists() && source.isDirectory()) {
//          File target = new File(Bukkit.getWorldContainer(), name);
//
//          try {
//             this.copy(source, target);
//             Logger.debug("Copied pre generated custom seed world {}", name);
//          } catch (IOException var5) {
//             Logger.error("Unable to copy pre generated custom seed world {}", name, var5);
//          }
//
//       } else {
//          Logger.warn("Custom seed world '{}' does not exist!", name);
//       }
//    }
//
//    private void deletePreGeneratedWorld(@Nonnull String name) {
//       File source = new File(Bukkit.getWorldContainer(), "pregenerated_" + name);
//       if (source.exists() && source.isDirectory()) {
//          FileUtils.deleteWorldFolder(source);
//          Logger.debug("Deleted pre generated custom seed world {}", name);
//       }
//    }
//
//    public void copy(@Nonnull File source, @Nonnull File target) throws IOException {
//       if (source.isDirectory()) {
//          this.copyDirectory(source, target);
//       } else {
//          this.copyFile(source, target);
//       }
//
//    }
//
//    private void copyDirectory(@Nonnull File source, @Nonnull File target) throws IOException {
//       if (target.exists() || target.mkdir()) {
//          String[] list = source.list();
//          if (list != null) {
//             String[] var4 = list;
//             int var5 = list.length;
//
//             for(int var6 = 0; var6 < var5; ++var6) {
//                String child = var4[var6];
//                if (!"session.lock".equals(child)) {
//                   this.copy(new File(source, child), new File(target, child));
//                }
//             }
//
//          }
//       }
//    }
//
//    private void copyFile(@Nonnull File source, @Nonnull File target) throws IOException {
//       InputStream in = Files.newInputStream(source.toPath());
//
//       try {
//          OutputStream out = Files.newOutputStream(target.toPath());
//
//          try {
//             byte[] buf = new byte[1024];
//
//             int length;
//             while((length = in.read(buf)) > 0) {
//                out.write(buf, 0, length);
//             }
//          } catch (Throwable var9) {
//             if (out != null) {
//                try {
//                   out.close();
//                } catch (Throwable var8) {
//                   var9.addSuppressed(var8);
//                }
//             }
//
//             throw var9;
//          }
//
//          if (out != null) {
//             out.close();
//          }
//       } catch (Throwable var10) {
//          if (in != null) {
//             try {
//                in.close();
//             } catch (Throwable var7) {
//                var10.addSuppressed(var7);
//             }
//          }
//
//          throw var10;
//       }
//
//       if (in != null) {
//          in.close();
//       }
//
//    }
//
//    private void stopServerNow() {
//       if (!this.restartOnReset) {
//          Bukkit.shutdown();
//       } else {
//          try {
//             Bukkit.spigot().restart();
//          } catch (NoSuchMethodError var2) {
//             Bukkit.shutdown();
//          }
//
//       }
//    }
//
//    public void setWorldInUse(boolean worldInUse) {
//       this.worldInUse = worldInUse;
//       if (worldInUse) {
//          this.cachePlayerData();
//       } else {
//          this.settings = new WorldManager.WorldSettings();
//          this.restorePlayerData();
//       }
//
//    }
//
//    private void cachePlayerData() {
//       Bukkit.getOnlinePlayers().forEach(this::cachePlayerData);
//    }
//
//    public void cachePlayerData(@Nonnull Player player) {
//       this.playerData.put(player.getUniqueId(), new PlayerData(player));
//    }
//
//    public void restorePlayerData() {
//       Bukkit.getOnlinePlayers().forEach(this::restorePlayerData);
//    }
//
//    public void restorePlayerData(@Nonnull Player player) {
//       PlayerData data = (PlayerData)this.playerData.remove(player.getUniqueId());
//       if (data != null) {
//          data.apply(player);
//       }
//    }
//
//    public boolean hasPlayerData(@Nonnull Player player) {
//       return this.playerData.containsKey(player.getUniqueId());
//    }
//
//    @Nonnull
//    public World getExtraWorld() {
//       return this.flatWorld;
//    }
//
//    @Nonnull
//    public WorldManager.WorldSettings getSettings() {
//       return this.settings;
//    }
//
//    @Generated
//    public boolean isEnableFreshReset() {
//       return this.enableFreshReset;
//    }
//
//    @Generated
//    public boolean isShutdownBecauseOfReset() {
//       return this.shutdownBecauseOfReset;
//    }
//
//    @Generated
//    public boolean isWorldInUse() {
//       return this.worldInUse;
//    }
//
//    public static class WorldSettings {
//       private boolean placeBlocks = false;
//       private boolean destroyBlocks = false;
//       private boolean dropItems = false;
//       private boolean pickupItems = false;
//
//       @Generated
//       public void setPlaceBlocks(boolean placeBlocks) {
//          this.placeBlocks = placeBlocks;
//       }
//
//       @Generated
//       public void setDestroyBlocks(boolean destroyBlocks) {
//          this.destroyBlocks = destroyBlocks;
//       }
//
//       @Generated
//       public void setDropItems(boolean dropItems) {
//          this.dropItems = dropItems;
//       }
//
//       @Generated
//       public void setPickupItems(boolean pickupItems) {
//          this.pickupItems = pickupItems;
//       }
//
//       @Generated
//       public boolean isPlaceBlocks() {
//          return this.placeBlocks;
//       }
//
//       @Generated
//       public boolean isDestroyBlocks() {
//          return this.destroyBlocks;
//       }
//
//       @Generated
//       public boolean isDropItems() {
//          return this.dropItems;
//       }
//
//       @Generated
//       public boolean isPickupItems() {
//          return this.pickupItems;
//       }
//    }
// }
//
