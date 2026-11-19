// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/container/PlayerData.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/container/PlayerData.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/container/PlayerData.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.bukkit.container;
//
// import java.util.Arrays;
// import java.util.Collection;
// import java.util.Iterator;
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import org.bukkit.GameMode;
// import org.bukkit.Location;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.potion.PotionEffect;
//
// public final class PlayerData {
//    private final GameMode gamemode;
//    private final Location location;
//    private final ItemStack[] inventory;
//    private final ItemStack[] armor;
//    private final Collection effects;
//    private final double health;
//    private final int food;
//    private final float saturation;
//    private final int heldItemSlot;
//    private final boolean allowedFlight;
//    private final boolean flying;
//
//    public PlayerData(@Nonnull Player player) {
//       this(player.getGameMode(), player.getLocation(), player.getInventory().getContents(), player.getInventory().getArmorContents(), player.getActivePotionEffects(), player.getHealth(), player.getFoodLevel(), player.getSaturation(), player.getInventory().getHeldItemSlot(), player.getAllowFlight(), player.isFlying());
//    }
//
//    public PlayerData(@Nonnull GameMode gamemode, @Nonnull Location location, @Nonnull ItemStack[] inventory, @Nonnull ItemStack[] armor, @Nonnull Collection effects, double health, int food, float saturation, int heldItemSlot, boolean allowedFlight, boolean flying) {
//       this.gamemode = gamemode;
//       this.location = location;
//       this.inventory = inventory;
//       this.armor = armor;
//       this.effects = effects;
//       this.health = health;
//       this.food = food;
//       this.saturation = saturation;
//       this.heldItemSlot = heldItemSlot;
//       this.allowedFlight = allowedFlight;
//       this.flying = allowedFlight && flying;
//    }
//
//    public void apply(@Nonnull Player player) {
//       Iterator var2 = player.getActivePotionEffects().iterator();
//
//       while(var2.hasNext()) {
//          PotionEffect effect = (PotionEffect)var2.next();
//          player.removePotionEffect(effect.getType());
//       }
//
//       player.setGameMode(this.gamemode);
//       player.teleport(this.location);
//       player.setHealth(this.health);
//       player.setFoodLevel(this.food);
//       player.setSaturation(this.saturation);
//       player.getInventory().setContents(this.inventory);
//       player.getInventory().setArmorContents(this.armor);
//       player.getInventory().setHeldItemSlot(this.heldItemSlot);
//       player.addPotionEffects(this.effects);
//       player.setAllowFlight(this.allowedFlight);
//       player.setFlying(this.flying);
//    }
//
//    @Generated
//    public GameMode getGamemode() {
//       return this.gamemode;
//    }
//
//    @Generated
//    public Location getLocation() {
//       return this.location;
//    }
//
//    @Generated
//    public ItemStack[] getInventory() {
//       return this.inventory;
//    }
//
//    @Generated
//    public ItemStack[] getArmor() {
//       return this.armor;
//    }
//
//    @Generated
//    public Collection getEffects() {
//       return this.effects;
//    }
//
//    @Generated
//    public double getHealth() {
//       return this.health;
//    }
//
//    @Generated
//    public int getFood() {
//       return this.food;
//    }
//
//    @Generated
//    public float getSaturation() {
//       return this.saturation;
//    }
//
//    @Generated
//    public int getHeldItemSlot() {
//       return this.heldItemSlot;
//    }
//
//    @Generated
//    public boolean isAllowedFlight() {
//       return this.allowedFlight;
//    }
//
//    @Generated
//    public boolean isFlying() {
//       return this.flying;
//    }
//
//    @Generated
//    public boolean equals(Object o) {
//       if (o == this) {
//          return true;
//       } else if (!(o instanceof PlayerData)) {
//          return false;
//       } else {
//          PlayerData other = (PlayerData)o;
//          if (Double.compare(this.getHealth(), other.getHealth()) != 0) {
//             return false;
//          } else if (this.getFood() != other.getFood()) {
//             return false;
//          } else if (Float.compare(this.getSaturation(), other.getSaturation()) != 0) {
//             return false;
//          } else if (this.getHeldItemSlot() != other.getHeldItemSlot()) {
//             return false;
//          } else if (this.isAllowedFlight() != other.isAllowedFlight()) {
//             return false;
//          } else if (this.isFlying() != other.isFlying()) {
//             return false;
//          } else {
//             Object this$gamemode = this.getGamemode();
//             Object other$gamemode = other.getGamemode();
//             if (this$gamemode == null) {
//                if (other$gamemode != null) {
//                   return false;
//                }
//             } else if (!this$gamemode.equals(other$gamemode)) {
//                return false;
//             }
//
//             label60: {
//                Object this$location = this.getLocation();
//                Object other$location = other.getLocation();
//                if (this$location == null) {
//                   if (other$location == null) {
//                      break label60;
//                   }
//                } else if (this$location.equals(other$location)) {
//                   break label60;
//                }
//
//                return false;
//             }
//
//             if (!Arrays.deepEquals(this.getInventory(), other.getInventory())) {
//                return false;
//             } else if (!Arrays.deepEquals(this.getArmor(), other.getArmor())) {
//                return false;
//             } else {
//                Object this$effects = this.getEffects();
//                Object other$effects = other.getEffects();
//                if (this$effects == null) {
//                   if (other$effects != null) {
//                      return false;
//                   }
//                } else if (!this$effects.equals(other$effects)) {
//                   return false;
//                }
//
//                return true;
//             }
//          }
//       }
//    }
//
//    @Generated
//    public int hashCode() {
//       int PRIME = true;
//       int result = 1;
//       long $health = Double.doubleToLongBits(this.getHealth());
//       int result = result * 59 + (int)($health >>> 32 ^ $health);
//       result = result * 59 + this.getFood();
//       result = result * 59 + Float.floatToIntBits(this.getSaturation());
//       result = result * 59 + this.getHeldItemSlot();
//       result = result * 59 + (this.isAllowedFlight() ? 79 : 97);
//       result = result * 59 + (this.isFlying() ? 79 : 97);
//       Object $gamemode = this.getGamemode();
//       result = result * 59 + ($gamemode == null ? 43 : $gamemode.hashCode());
//       Object $location = this.getLocation();
//       result = result * 59 + ($location == null ? 43 : $location.hashCode());
//       result = result * 59 + Arrays.deepHashCode(this.getInventory());
//       result = result * 59 + Arrays.deepHashCode(this.getArmor());
//       Object $effects = this.getEffects();
//       result = result * 59 + ($effects == null ? 43 : $effects.hashCode());
//       return result;
//    }
//
//    @Generated
//    public String toString() {
//       return "PlayerData(gamemode=" + this.getGamemode() + ", location=" + this.getLocation() + ", inventory=" + Arrays.deepToString(this.getInventory()) + ", armor=" + Arrays.deepToString(this.getArmor()) + ", effects=" + this.getEffects() + ", health=" + this.getHealth() + ", food=" + this.getFood() + ", saturation=" + this.getSaturation() + ", heldItemSlot=" + this.getHeldItemSlot() + ", allowedFlight=" + this.isAllowedFlight() + ", flying=" + this.isFlying() + ")";
//    }
// }
//
