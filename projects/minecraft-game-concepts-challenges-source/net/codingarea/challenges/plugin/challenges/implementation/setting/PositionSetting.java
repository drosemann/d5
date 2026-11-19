package net.codingarea.challenges.plugin.challenges.implementation.setting;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.ChallengeAPI;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeConfigHelper;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.bukkit.command.PlayerCommand;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import net.codingarea.challenges.plugin.utils.misc.ParticleUtils;
import net.codingarea.challenges.plugin.utils.misc.Utils;
import org.bukkit.Bukkit;
import org.bukkit.Color;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.World;
import org.bukkit.Particle.DustOptions;
import org.bukkit.World.Environment;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.command.TabCompleter;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class PositionSetting extends Setting implements PlayerCommand, TabCompleter {
   private final Map positions = new HashMap();
   private final boolean particleLines = ChallengeConfigHelper.getSettingsDocument().getBoolean("position-particle-lines");

   public PositionSetting() {
      super(MenuType.SETTINGS, true);
      Challenges.getInstance().registerCommand(new PositionSetting.DelPosCommand(), new String[]{"delposition"});
      Challenges.getInstance().registerCommand(new PositionSetting.SetPosCommand(), new String[]{"setposition"});
   }

   public static Environment getWorldEnvironment(@Nonnull String name) {
      String var1 = name.toLowerCase();
      byte var2 = -1;
      switch(var1.hashCode()) {
      case -1048926120:
         if (var1.equals("nether")) {
            var2 = 2;
         }
         break;
      case -745159874:
         if (var1.equals("overworld")) {
            var2 = 1;
         }
         break;
      case 100571:
         if (var1.equals("end")) {
            var2 = 3;
         }
      }

      switch(var2) {
      case 1:
         return Environment.NORMAL;
      case 2:
         return Environment.NETHER;
      case 3:
         return Environment.THE_END;
      default:
         return null;
      }
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BLUE_BANNER, Message.forName("item-position-setting"));
   }

   public void onCommand(@Nonnull Player player, @Nonnull String[] args) {
      if (!this.isEnabled()) {
         Message.forName("positions-disabled").send(player, Prefix.POSITION);
         SoundSample.BASS_OFF.play(player);
      } else {
         if (args.length == 0) {
            if (this.positions.entrySet().stream().noneMatch((entry) -> {
               return player.getWorld() == ((Location)entry.getValue()).getWorld();
            })) {
               Message.forName("no-positions").send(player, Prefix.POSITION, "position <name>");
               return;
            }

            this.positions.entrySet().stream().filter((entry) -> {
               return player.getWorld() == ((Location)entry.getValue()).getWorld();
            }).sorted(Comparator.comparingDouble((entry) -> {
               return ((Location)entry.getValue()).distance(player.getLocation());
            }).reversed()).forEach((entry) -> {
               Location location = (Location)entry.getValue();
               Message.forName("position").send(player, Prefix.POSITION, location.getBlockX(), location.getBlockY(), location.getBlockZ(), this.getWorldName(location), entry.getKey(), (int)location.distance(player.getLocation()));
            });
         } else if (args.length == 1) {
            String name = args[0].toLowerCase();
            Location position = (Location)this.positions.get(name);
            if (position != null) {
               if (position.getWorld() != player.getLocation().getWorld()) {
                  Message.forName("position-other-world").send(player, Prefix.POSITION, this.getWorldName(position));
                  SoundSample.BASS_OFF.play(player);
                  return;
               }

               Message.forName("position").send(player, Prefix.POSITION, position.getBlockX(), position.getBlockY(), position.getBlockZ(), this.getWorldName(position), name, (int)position.distance(player.getLocation()));
               this.playParticleLine(player, position);
            } else if (ChallengeAPI.isPaused()) {
               Message.forName("timer-not-started").send(player, Prefix.POSITION);
               SoundSample.BASS_OFF.play(player);
            } else {
               this.positions.put(name, position = player.getLocation());
               Message.forName("position-set").broadcast(Prefix.POSITION, position.getBlockX(), position.getBlockY(), position.getBlockZ(), this.getWorldName(position), name, NameHelper.getName(player));
               SoundSample.BASS_ON.play(player);
               this.broadcastParticleLine(position);
            }
         } else {
            Message.forName("syntax").send(player, Prefix.POSITION, "position [name]");
         }

      }
   }

   @Nullable
   public List onTabComplete(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String alias, @Nonnull String[] args) {
      return (List)(args.length > 1 ? new ArrayList() : Utils.filterRecommendations(args[0], (String[])this.positions.keySet().toArray(new String[0])));
   }

   public String getWorldName(@Nonnull Location location) {
      if (location.getWorld() == null) {
         return "?";
      } else {
         switch(location.getWorld().getEnvironment()) {
         case NETHER:
            return "Nether";
         case THE_END:
            return "End";
         default:
            return "Overworld";
         }
      }
   }

   public boolean containsPosition(@Nonnull String name) {
      return this.positions.containsKey(name);
   }

   private void broadcastParticleLine(@Nonnull Location location) {
      broadcast((player) -> {
         this.playParticleLine(player, location);
      });
   }

   private void playParticleLine(@Nonnull Player player, @Nonnull Location position) {
      if (this.particleLines) {
         if (player.getWorld() == position.getWorld()) {
            Location target = position.clone().add(0.0D, 0.3D, 0.0D);
            int[] current = new int[]{0};
            Bukkit.getScheduler().runTaskTimer(plugin, (task) -> {
               int var10002 = current[0]++;
               if (current[0] >= 10) {
                  task.cancel();
               }

               ParticleUtils.drawLine(player, player.getLocation(), target, MinecraftNameWrapper.REDSTONE_DUST, new DustOptions(Color.LIME, 1.0F), 1, 0.5D, 50);
            }, 0L, 10L);
         }
      }
   }

   public void loadGameState(@Nonnull Document document) {
      this.positions.clear();
      Iterator var2 = document.keys().iterator();

      while(var2.hasNext()) {
         String name = (String)var2.next();
         this.positions.put(name, (Location)document.getSerializable(name, Location.class));
      }

   }

   public void writeGameState(@Nonnull Document document) {
      Iterator var2 = document.keys().iterator();

      while(var2.hasNext()) {
         String key = (String)var2.next();
         document.remove(key);
      }

      Map var10000 = this.positions;
      Objects.requireNonNull(document);
      var10000.forEach(document::set);
   }

   public class DelPosCommand implements PlayerCommand, TabCompleter {
      public void onCommand(@NotNull Player player, @NotNull String[] args) throws Exception {
         if (!PositionSetting.this.isEnabled()) {
            Message.forName("positions-disabled").send(player, Prefix.POSITION);
            SoundSample.BASS_OFF.play(player);
         } else if (!ChallengeAPI.isStarted()) {
            Message.forName("timer-not-started").send(player, Prefix.POSITION);
            SoundSample.BASS_OFF.play(player);
         } else {
            if (args.length == 0) {
               if (PositionSetting.this.positions.isEmpty()) {
                  Message.forName("no-positions-global").send(player, Prefix.POSITION, "position <name>");
                  return;
               }

               PositionSetting.this.positions.entrySet().stream().sorted(Comparator.comparingDouble((entry) -> {
                  return ((Location)entry.getValue()).distance(player.getLocation());
               }).reversed()).forEach((entry) -> {
                  Location location = (Location)entry.getValue();
                  Message.forName("position").send(player, Prefix.POSITION, location.getBlockX(), location.getBlockY(), location.getBlockZ(), PositionSetting.this.getWorldName(location), entry.getKey(), (int)location.distance(player.getLocation()));
               });
            } else if (args.length == 1) {
               String name = args[0].toLowerCase();
               Location position = (Location)PositionSetting.this.positions.get(name);
               if (position != null) {
                  PositionSetting.this.positions.remove(name);
                  Message.forName("position-deleted").broadcast(Prefix.POSITION, position.getBlockX(), position.getBlockY(), position.getBlockZ(), PositionSetting.this.getWorldName(position), name, NameHelper.getName(player));
               } else {
                  Message.forName("position-not-exists").send(player, Prefix.POSITION);
               }
            } else {
               Message.forName("syntax").send(player, Prefix.POSITION, "delposition <name>");
            }

         }
      }

      @Nullable
      public List onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String alias, @NotNull String[] args) {
         return (List)(args.length > 1 ? new ArrayList() : Utils.filterRecommendations(args[0], (String[])PositionSetting.this.positions.keySet().toArray(new String[0])));
      }
   }

   public class SetPosCommand implements PlayerCommand, TabCompleter {
      public void onCommand(@NotNull Player player, @NotNull String[] args) throws Exception {
         if (!PositionSetting.this.isEnabled()) {
            Message.forName("positions-disabled").send(player, Prefix.POSITION);
            SoundSample.BASS_OFF.play(player);
         } else if (!ChallengeAPI.isStarted()) {
            Message.forName("timer-not-started").send(player, Prefix.POSITION);
            SoundSample.BASS_OFF.play(player);
         } else if (args.length < 5) {
            Message.forName("syntax").send(player, Prefix.POSITION, "setposition <name> <world> <x> <y> <z>");
         } else {
            String name = args[0].toLowerCase();
            if (PositionSetting.this.positions.containsKey(name)) {
               Message.forName("position-already-exists").send(player, Prefix.POSITION, name);
            } else {
               String worldName = args[1];
               String x = args[2];
               String y = args[3];
               String z = args[4];

               try {
                  Environment environment = PositionSetting.getWorldEnvironment(worldName);
                  World world = ChallengeAPI.getGameWorld(environment);
                  if (world == null) {
                     throw new IllegalArgumentException();
                  }

                  double doubleX = Double.parseDouble(x);
                  double doubleY = Double.parseDouble(y);
                  double doubleZ = Double.parseDouble(z);
                  Location position = new Location(world, doubleX, doubleY, doubleZ);
                  PositionSetting.this.positions.put(name, position);
                  Message.forName("position-set").broadcast(Prefix.POSITION, position.getBlockX(), position.getBlockY(), position.getBlockZ(), PositionSetting.this.getWorldName(position), name, NameHelper.getName(player));
                  SoundSample.BASS_ON.play(player);
                  PositionSetting.this.broadcastParticleLine(position);
               } catch (Exception var17) {
                  Message.forName("syntax").send(player, Prefix.POSITION, "setposition <name> <world> <x> <y> <z>");
               }

            }
         }
      }

      @Nullable
      public List onTabComplete(@NotNull CommandSender sender, @NotNull Command command, @NotNull String alias, @NotNull String[] args) {
         if (!(sender instanceof Player)) {
            return new LinkedList();
         } else {
            Player player = (Player)sender;
            if (args.length > 5) {
               return new LinkedList();
            } else if (args.length > 2) {
               int arg = args.length - 2;
               Location location = player.getLocation();
               double cord;
               switch(arg) {
               case 1:
                  cord = (double)location.getBlockX() + 0.5D;
                  break;
               case 2:
                  cord = (double)location.getBlockY();
                  break;
               default:
                  cord = (double)location.getBlockZ() + 0.5D;
               }

               return Collections.singletonList(String.valueOf(cord));
            } else {
               return (List)(args.length > 1 ? Arrays.asList("Overworld", "Nether", "End") : new LinkedList());
            }
         }
      }
   }
}
