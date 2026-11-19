// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/OldPvPSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/OldPvPSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/OldPvPSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Setting;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import org.bukkit.Material;
// import org.bukkit.attribute.Attribute;
// import org.bukkit.attribute.AttributeInstance;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
// import org.bukkit.event.player.PlayerChangedWorldEvent;
// import org.bukkit.event.player.PlayerJoinEvent;
// import org.bukkit.event.player.PlayerQuitEvent;
//
// @Since("2.0")
// public class OldPvPSetting extends Setting {
//    public static final double DISABLED = 32.0D;
//    public static final double NORMAL = 4.0D;
//
//    public OldPvPSetting() {
//       super(MenuType.SETTINGS);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.IRON_SWORD, Message.forName("item-old-pvp-setting"));
//    }
//
//    protected void onDisable() {
//       broadcast((player) -> {
//          this.setAttackSpeed(player, 4.0D);
//       });
//    }
//
//    protected void onEnable() {
//       broadcast((player) -> {
//          this.setAttackSpeed(player, 32.0D);
//       });
//    }
//
//    @EventHandler
//    public void onChangeWorldEvent(@Nonnull PlayerChangedWorldEvent event) {
//       if (this.isEnabled()) {
//          this.setAttackSpeed(event.getPlayer(), 32.0D);
//       }
//    }
//
//    @EventHandler
//    public void onJoin(@Nonnull PlayerJoinEvent event) {
//       if (this.isEnabled()) {
//          this.setAttackSpeed(event.getPlayer(), 32.0D);
//       }
//    }
//
//    @EventHandler
//    public void onQuit(@Nonnull PlayerQuitEvent event) {
//       this.setAttackSpeed(event.getPlayer(), 4.0D);
//    }
//
//    @EventHandler
//    public void onSweepDamage(@Nonnull EntityDamageEvent event) {
//       if (this.isEnabled()) {
//          if (event.getCause() == DamageCause.ENTITY_SWEEP_ATTACK) {
//             event.setCancelled(true);
//          }
//       }
//    }
//
//    protected void setAttackSpeed(@Nonnull Player player, double value) {
//       AttributeInstance attribute = player.getAttribute(Attribute.GENERIC_ATTACK_SPEED);
//       if (attribute != null) {
//          attribute.setBaseValue(value);
//       }
//    }
// }
//
