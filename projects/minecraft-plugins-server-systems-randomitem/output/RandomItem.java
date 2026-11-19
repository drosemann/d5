import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import org.bukkit.Bukkit;
import org.bukkit.ChatColor;
import org.bukkit.GameMode;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.java.JavaPlugin;
import org.bukkit.scheduler.BukkitRunnable;

public class RandomItem extends JavaPlugin {
   private boolean isRunning = false;
   private int timeInterval = 10;
   private int itemCount = 1;
   private int maxItemNumber = 1;
   private List items = new ArrayList();

   public void onEnable() {
      this.loadAllItems();
      this.getLogger().info("RandomItemPlugin has been enabled!");
   }

   public void onDisable() {
      this.getLogger().info("RandomItemPlugin has been disabled!");
   }

   public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
      if (!(sender instanceof Player)) {
         sender.sendMessage("Only players can use this command!");
         return false;
      } else {
         Player player = (Player)sender;
         if (cmd.getName().equalsIgnoreCase("RandomItem")) {
            if (args.length < 1) {
               this.sendHelpMessage(player);
               return true;
            } else {
               String var6 = args[0].toLowerCase();
               byte var7 = -1;
               switch(var6.hashCode()) {
               case -1034364087:
                  if (var6.equals("number")) {
                     var7 = 3;
                  }
                  break;
               case 3198785:
                  if (var6.equals("help")) {
                     var7 = 5;
                  }
                  break;
               case 3242771:
                  if (var6.equals("item")) {
                     var7 = 2;
                  }
                  break;
               case 3540994:
                  if (var6.equals("stop")) {
                     var7 = 4;
                  }
                  break;
               case 3560141:
                  if (var6.equals("time")) {
                     var7 = 1;
                  }
                  break;
               case 109757538:
                  if (var6.equals("start")) {
                     var7 = 0;
                  }
               }

               int newMaxItemNumber;
               switch(var7) {
               case 0:
                  if (!this.isRunning) {
                     this.startRandomItems(player);
                     this.isRunning = true;
                     player.sendTitle(ChatColor.GREEN + "RandomItem Start", "Time Interval: " + this.timeInterval + " seconds");
                     Bukkit.broadcastMessage(ChatColor.GREEN + "RandomItem has started!");
                  } else {
                     player.sendMessage("RandomItem is already running!");
                  }
                  break;
               case 1:
                  if (args.length < 2) {
                     player.sendMessage("Usage: /RandomItem time <timeInSeconds>");
                     return false;
                  }

                  try {
                     newMaxItemNumber = Integer.parseInt(args[1]);
                     this.timeInterval = newMaxItemNumber;
                     player.sendMessage("Time interval set to " + this.timeInterval + " seconds.");
                  } catch (NumberFormatException var11) {
                     player.sendMessage("Invalid time format! Please enter a valid number.");
                  }
                  break;
               case 2:
                  if (args.length < 2) {
                     player.sendMessage("Usage: /RandomItem item <itemCount>");
                     return false;
                  }

                  try {
                     newMaxItemNumber = Integer.parseInt(args[1]);
                     this.itemCount = newMaxItemNumber;
                     player.sendMessage("Item count set to " + this.itemCount + ".");
                  } catch (NumberFormatException var10) {
                     player.sendMessage("Invalid item count format! Please enter a valid number.");
                  }
                  break;
               case 3:
                  if (args.length < 2) {
                     player.sendMessage("Usage: /RandomItem number <maxItemNumber>");
                     return false;
                  }

                  try {
                     newMaxItemNumber = Integer.parseInt(args[1]);
                     this.maxItemNumber = newMaxItemNumber;
                     player.sendMessage("Max item number set to " + this.maxItemNumber + ".");
                  } catch (NumberFormatException var9) {
                     player.sendMessage("Invalid max item number format! Please enter a valid number.");
                  }
                  break;
               case 4:
                  if (this.isRunning) {
                     this.isRunning = false;
                     player.sendTitle(ChatColor.RED + "RandomItem Stop", "", 10, 70, 20);
                     Bukkit.broadcastMessage(ChatColor.RED + "RandomItem has stopped!");
                  } else {
                     player.sendMessage("RandomItem is not running!");
                  }
                  break;
               case 5:
                  this.sendHelpMessage(player);
                  break;
               default:
                  this.sendHelpMessage(player);
                  return false;
               }

               return true;
            }
         } else {
            return false;
         }
      }
   }

   private void loadAllItems() {
      Material[] materials = Material.values();
      Material[] var2 = materials;
      int var3 = materials.length;

      for(int var4 = 0; var4 < var3; ++var4) {
         Material material = var2[var4];
         if (material.isItem() && material.isLegacy() && !material.isAir()) {
            this.items.add(new ItemStack(material));
         }
      }

   }

   private void startRandomItems(Player player) {
      (new BukkitRunnable() {
         public void run() {
            if (RandomItem.this.isRunning) {
               Random random = new Random();
               Iterator var2 = Bukkit.getOnlinePlayers().iterator();

               while(true) {
                  Player onlinePlayer;
                  do {
                     if (!var2.hasNext()) {
                        return;
                     }

                     onlinePlayer = (Player)var2.next();
                  } while(onlinePlayer.getGameMode() == GameMode.SPECTATOR);

                  int randomItemCount = random.nextInt(RandomItem.this.itemCount) + 1;

                  for(int i = 0; i < randomItemCount; ++i) {
                     ItemStack randomItem = (ItemStack)RandomItem.this.items.get(random.nextInt(RandomItem.this.items.size()));
                     randomItem.setAmount(random.nextInt(RandomItem.this.maxItemNumber) + 1);
                     onlinePlayer.getInventory().addItem(new ItemStack[]{randomItem});
                  }
               }
            } else {
               this.cancel();
            }
         }
      }).runTaskTimer(this, 0L, (long)(this.timeInterval * 20));
   }

   private void sendHelpMessage(Player player) {
      player.sendMessage(ChatColor.GREEN + "RandomItem Help:");
      player.sendMessage(ChatColor.YELLOW + "/RandomItem start" + ChatColor.WHITE + " - Start the RandomItem plugin.");
      player.sendMessage(ChatColor.YELLOW + "/RandomItem stop" + ChatColor.WHITE + " - Stop the RandomItem plugin.");
      player.sendMessage(ChatColor.YELLOW + "/RandomItem time <timeInSeconds>" + ChatColor.WHITE + " - Set the time interval for giving random items.");
      player.sendMessage(ChatColor.YELLOW + "/RandomItem item <itemCount>" + ChatColor.WHITE + " - Set the number of items to give to players each time.");
      player.sendMessage(ChatColor.YELLOW + "/RandomItem number <maxItemNumber>" + ChatColor.WHITE + " - Set the maximum number of each item that may be given to each player.");
   }
}
