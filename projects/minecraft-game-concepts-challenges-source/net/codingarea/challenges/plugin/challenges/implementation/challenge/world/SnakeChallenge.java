package net.codingarea.challenges.plugin.challenges.implementation.challenge.world;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.content.Prefix;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.BlockUtils;
import net.codingarea.challenges.plugin.utils.misc.NameHelper;
import org.bukkit.Bukkit;
import org.bukkit.GameMode;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.player.PlayerMoveEvent;

public class SnakeChallenge extends Setting {
   private final ArrayList blocks = new ArrayList();

   public SnakeChallenge() {
      super(MenuType.CHALLENGES);
      this.setCategory(SettingCategory.WORLD);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.BLUE_TERRACOTTA, Message.forName("item-snake-challenge"));
   }

   protected void onEnable() {
   }

   protected void onDisable() {
      this.blocks.clear();
   }

   public void writeGameState(@Nonnull Document document) {
      super.writeGameState(document);
      List locations = (List)this.blocks.stream().map(Block::getLocation).collect(Collectors.toList());
      document.set("blocks", locations);
   }

   public void loadGameState(@Nonnull Document document) {
      super.loadGameState(document);
      this.blocks.addAll((Collection)document.getSerializableList("blocks", Location.class).stream().map(Location::getBlock).collect(Collectors.toList()));
   }

   @EventHandler(
      priority = EventPriority.HIGH,
      ignoreCancelled = true
   )
   public void onMove(@Nonnull PlayerMoveEvent event) {
      if (this.shouldExecuteEffect()) {
         if (event.getTo() != null) {
            if (!event.getFrom().getBlock().equals(event.getTo().getBlock())) {
               if (event.getPlayer().getGameMode() != GameMode.SPECTATOR && event.getPlayer().getGameMode() != GameMode.CREATIVE) {
                  Block from = event.getFrom().clone().subtract(0.0D, 1.0D, 0.0D).getBlock();
                  Block to = event.getTo().clone().subtract(0.0D, 0.15D, 0.0D).getBlock();
                  if (from.getType().isSolid()) {
                     from.setType(BlockUtils.getTerracotta(this.getPlayersColor(event.getPlayer())), false);
                     this.blocks.add(from);
                  }

                  if (this.blocks.contains(to)) {
                     Message.forName("snake-failed").broadcast(Prefix.CHALLENGES, NameHelper.getName(event.getPlayer()));
                     this.kill(event.getPlayer());
                  } else {
                     if (to.getType().isSolid()) {
                        to.setType(Material.BLACK_TERRACOTTA, false);
                        Block block = event.getPlayer().getLocation().getBlock();
                        if (!block.getType().isSolid()) {
                           block.breakNaturally();
                        }
                     }

                  }
               }
            }
         }
      }
   }

   public int getPlayersColor(Player player) {
      int i = 0;
      Iterator var3 = Bukkit.getOnlinePlayers().iterator();

      Player currentPlayer;
      do {
         if (!var3.hasNext()) {
            return 0;
         }

         currentPlayer = (Player)var3.next();
         ++i;
         if (i > 17) {
            i = 0;
         }
      } while(currentPlayer != player);

      return i;
   }
}
