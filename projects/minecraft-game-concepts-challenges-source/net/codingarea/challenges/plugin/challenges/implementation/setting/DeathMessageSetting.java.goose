// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DeathMessageSetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DeathMessageSetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DeathMessageSetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import javax.annotation.Nonnull;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Modifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import net.codingarea.challenges.plugin.utils.misc.NameHelper;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.event.EventHandler;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.entity.EntityDamageEvent;
// import org.bukkit.event.entity.PlayerDeathEvent;
// import org.bukkit.event.entity.EntityDamageEvent.DamageCause;
//
// public class DeathMessageSetting extends Modifier {
//    public static final int ENABLED = 2;
//    public static final int VANILLA = 3;
//    private boolean hide;
//
//    public DeathMessageSetting() {
//       super(MenuType.SETTINGS, 1, 3, 2);
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.BOW, Message.forName("item-death-message-setting"));
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       switch(this.getValue()) {
//       case 2:
//          return DefaultItem.enabled();
//       case 3:
//          return DefaultItem.create(MinecraftNameWrapper.SIGN, Message.forName("item-death-message-setting-vanilla"));
//       default:
//          return DefaultItem.disabled();
//       }
//    }
//
//    public void playValueChangeTitle() {
//       switch(this.getValue()) {
//       case 2:
//          ChallengeHelper.playToggleChallengeTitle(this, true);
//          return;
//       case 3:
//          ChallengeHelper.playChangeChallengeValueTitle(this, (Object)Message.forName("item-death-message-setting-vanilla"));
//          return;
//       default:
//          ChallengeHelper.playToggleChallengeTitle(this, false);
//       }
//    }
//
//    @EventHandler(
//       priority = EventPriority.NORMAL,
//       ignoreCancelled = true
//    )
//    public void onDeath(@Nonnull PlayerDeathEvent event) {
//       event.setDeathMessage((String)null);
//       if (!this.hide) {
//          String original = event.getDeathMessage();
//          Player entity = event.getEntity();
//          switch(this.getValue()) {
//          case 2:
//             EntityDamageEvent cause = entity.getLastDamageCause();
//             if (cause != null && cause.getCause() != DamageCause.CUSTOM) {
//                Message.forName("death-message-cause").broadcast(Prefix.CHALLENGES, NameHelper.getName(entity), DamageDisplaySetting.getCause(cause));
//             } else {
//                Message.forName("death-message").broadcast(Prefix.CHALLENGES, NameHelper.getName(entity));
//             }
//
//             return;
//          case 3:
//             if (original != null) {
//                Bukkit.broadcastMessage(Prefix.CHALLENGES + "§7" + original);
//             }
//          default:
//          }
//       }
//    }
//
//    public void setHideMessagesTemporarily(boolean hide) {
//       this.hide = hide;
//    }
// }
//
