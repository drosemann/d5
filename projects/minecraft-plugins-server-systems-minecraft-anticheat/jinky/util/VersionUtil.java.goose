// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/VersionUtil.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/VersionUtil.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/VersionUtil.java), unveraendert, als Inline-Doku ----
// package me.jinky.util;
//
// import java.util.Iterator;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.block.BlockFace;
// import org.bukkit.enchantments.Enchantment;
// import org.bukkit.entity.Player;
// import org.bukkit.potion.PotionEffect;
// import org.bukkit.potion.PotionEffectType;
//
// public class VersionUtil {
//    public static String getVersion() {
//       return Bukkit.getServer().getClass().getPackage().getName().replace(".", ",").split(",")[3];
//    }
//
//    public static boolean isFlying(Player p) {
//       return p.isFlying();
//    }
//
//    public static boolean isSwimming(Player p) {
//       if (p.getLocation().getBlock().isLiquid()) {
//          return true;
//       } else if (p.getLocation().getBlock().getType() == Material.WATER) {
//          return true;
//       } else if (p.getLocation().getBlock().getRelative(BlockFace.DOWN).getType() == Material.WATER) {
//          return true;
//       } else if (p.getLocation().getBlock().getRelative(BlockFace.UP).getType() == Material.STATIONARY_WATER) {
//          return true;
//       } else if (p.getLocation().getBlock().getType() == Material.STATIONARY_WATER) {
//          return true;
//       } else {
//          return p.getLocation().getBlock().getRelative(BlockFace.DOWN).getType() == Material.STATIONARY_WATER;
//       }
//    }
//
//    public static int getPotAmplifier(Player p, PotionEffectType t) {
//       Iterator var3 = p.getActivePotionEffects().iterator();
//
//       while(var3.hasNext()) {
//          PotionEffect e = (PotionEffect)var3.next();
//          if (e.getType() == t) {
//             return e.getAmplifier();
//          }
//       }
//
//       return 0;
//    }
//
//    public static boolean hasEfficiency(Player player) {
//       if (player.hasPotionEffect(PotionEffectType.FAST_DIGGING)) {
//          return true;
//       } else if (player.getItemInHand() != null) {
//          return player.getItemInHand().containsEnchantment(Enchantment.DIG_SPEED);
//       } else {
//          return false;
//       }
//    }
// }
//
