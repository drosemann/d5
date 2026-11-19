package net.anweisen.utilities.bukkit.utils.misc;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.logging.ILogger;
import org.bukkit.entity.Player;
import org.bukkit.event.inventory.InventoryClickEvent;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class CompatibilityUtils {
   protected static final ILogger logger = ILogger.forThisClass();
   private static final Logger log = LoggerFactory.getLogger(CompatibilityUtils.class);

   private CompatibilityUtils() {
   }

   public static Inventory getTopInventory(@Nonnull Player player) {
      InventoryView view = player.getOpenInventory();

      try {
         Method getTopInventory = InventoryView.class.getMethod("getTopInventory");
         return (Inventory)getTopInventory.invoke(view);
      } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var3) {
         logger.error("Failed to get top inventory", var3);
         return null;
      }
   }

   public static Inventory getTopInventory(@Nonnull InventoryClickEvent event) {
      InventoryView view = event.getView();

      try {
         Method getTopInventory = InventoryView.class.getMethod("getTopInventory");
         return (Inventory)getTopInventory.invoke(view);
      } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var3) {
         logger.error("Failed to get top inventory", var3);
         return null;
      }
   }
}
