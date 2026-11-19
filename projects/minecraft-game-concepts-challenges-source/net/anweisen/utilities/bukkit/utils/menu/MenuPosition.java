package net.anweisen.utilities.bukkit.utils.menu;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.bukkit.utils.menu.positions.EmptyMenuPosition;
import org.bukkit.entity.Player;
import org.bukkit.inventory.InventoryHolder;

@FunctionalInterface
public interface MenuPosition {
   InventoryHolder HOLDER = new MenuPositionHolder();

   static void set(@Nonnull Player player, @Nullable MenuPosition position) {
      MenuPosition.Holder.positions.put(player, position);
   }

   static void remove(@Nonnull Player player) {
      MenuPosition.Holder.positions.remove(player);
   }

   @Nullable
   static MenuPosition get(@Nonnull Player player) {
      return (MenuPosition)MenuPosition.Holder.positions.get(player);
   }

   static void setEmpty(@Nonnull Player player) {
      set(player, new EmptyMenuPosition());
   }

   void handleClick(@Nonnull MenuClickInfo var1);

   public static final class Holder {
      private static final Map positions = new ConcurrentHashMap();

      private Holder() {
      }
   }
}
