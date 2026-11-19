// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/CompatibilityUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/CompatibilityUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/misc/CompatibilityUtils.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.misc;
//
// import java.lang.reflect.InvocationTargetException;
// import java.lang.reflect.Method;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.logging.ILogger;
// import org.bukkit.entity.Player;
// import org.bukkit.event.inventory.InventoryClickEvent;
// import org.bukkit.inventory.Inventory;
// import org.bukkit.inventory.InventoryView;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
//
// public class CompatibilityUtils {
//    protected static final ILogger logger = ILogger.forThisClass();
//    private static final Logger log = LoggerFactory.getLogger(CompatibilityUtils.class);
//
//    private CompatibilityUtils() {
//    }
//
//    public static Inventory getTopInventory(@Nonnull Player player) {
//       InventoryView view = player.getOpenInventory();
//
//       try {
//          Method getTopInventory = InventoryView.class.getMethod("getTopInventory");
//          return (Inventory)getTopInventory.invoke(view);
//       } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var3) {
//          logger.error("Failed to get top inventory", var3);
//          return null;
//       }
//    }
//
//    public static Inventory getTopInventory(@Nonnull InventoryClickEvent event) {
//       InventoryView view = event.getView();
//
//       try {
//          Method getTopInventory = InventoryView.class.getMethod("getTopInventory");
//          return (Inventory)getTopInventory.invoke(view);
//       } catch (InvocationTargetException | IllegalAccessException | NoSuchMethodException var3) {
//          logger.error("Failed to get top inventory", var3);
//          return null;
//       }
//    }
// }
//
