package net.codingarea.challenges.plugin.challenges.implementation.challenge.randomizer;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Nonnull;
import net.codingarea.challenges.plugin.challenges.type.abstraction.RandomizerSetting;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.management.menu.MenuType;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.item.ItemUtils;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import org.bukkit.Material;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.inventory.CraftItemEvent;
import org.bukkit.inventory.ItemStack;

public class CraftingRandomizerChallenge extends RandomizerSetting {
   protected final Map randomization = new HashMap();

   public CraftingRandomizerChallenge() {
      super(MenuType.CHALLENGES);
   }

   @Nonnull
   public ItemBuilder createDisplayItem() {
      return new ItemBuilder(Material.CHEST_MINECART, Message.forName("item-crafting-randomizer-challenge"));
   }

   protected void reloadRandomization() {
      List from = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
      from.removeIf((material) -> {
         return !material.isItem() || !ItemUtils.isObtainableInSurvival(material);
      });
      this.random.shuffle(from);
      List to = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
      to.removeIf((material) -> {
         return !material.isItem() || !ItemUtils.isObtainableInSurvival(material);
      });
      this.random.shuffle(to);

      while(!from.isEmpty()) {
         Material item = (Material)from.remove(0);
         Material result = (Material)to.remove(0);
         this.randomization.put(item, result);
      }

   }

   protected void onDisable() {
      this.randomization.clear();
   }

   @EventHandler(
      priority = EventPriority.NORMAL,
      ignoreCancelled = true
   )
   public void onCraftItem(@Nonnull CraftItemEvent event) {
      if (this.isEnabled()) {
         ItemStack item = event.getCurrentItem();
         if (item != null) {
            Material result = (Material)this.randomization.get(item.getType());
            if (result != null) {
               event.setCurrentItem((new ItemBuilder(result)).amount(item.getAmount()).build());
            }
         }
      }
   }
}
