// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/InfoMenuGenerator.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/InfoMenuGenerator.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/management/menu/generator/implementation/custom/InfoMenuGenerator.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Collection;
// import java.util.Collections;
// import java.util.HashMap;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.Map;
// import java.util.UUID;
// import javax.annotation.Nonnull;
// import lombok.Generated;
// import net.anweisen.utilities.bukkit.utils.animation.SoundSample;
// import net.anweisen.utilities.bukkit.utils.menu.MenuClickInfo;
// import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
// import net.anweisen.utilities.common.collection.IRandom;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.challenges.custom.CustomChallenge;
// import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
// import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
// import net.codingarea.challenges.plugin.challenges.custom.settings.trigger.ChallengeTrigger;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.InventoryTitleManager;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.ChallengeMenuGenerator;
// import net.codingarea.challenges.plugin.management.menu.generator.MenuGenerator;
// import net.codingarea.challenges.plugin.spigot.listener.ChatInputListener;
// import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Bukkit;
// import org.bukkit.ChatColor;
// import org.bukkit.Material;
// import org.bukkit.Sound;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.Inventory;
//
// public class InfoMenuGenerator extends MenuGenerator implements IParentCustomGenerator {
//    public static final int DELETE_SLOT = 28;
//    public static final int SAVE_SLOT = 34;
//    public static final int CONDITION_SLOT = 30;
//    public static final int ACTION_SLOT = 32;
//    public static final int MATERIAL_SLOT = 14;
//    public static final int NAME_SLOT = 12;
//    private static final Material[] defaultMaterials;
//    private static final boolean savePlayerChallenges = Challenges.getInstance().getConfigDocument().getBoolean("save-player_challenges");
//    private final UUID uuid;
//    private String name;
//    private Material material;
//    private ChallengeTrigger trigger;
//    private Map subTriggers;
//    private ChallengeAction action;
//    private Map subActions;
//    private Inventory inventory;
//
//    public InfoMenuGenerator(CustomChallenge customChallenge) {
//       this.uuid = customChallenge.getUniqueId();
//       this.material = customChallenge.getMaterial();
//       this.name = customChallenge.getDisplayName();
//       this.trigger = customChallenge.getTrigger();
//       this.subTriggers = customChallenge.getSubTriggers();
//       this.action = customChallenge.getAction();
//       this.subActions = customChallenge.getSubActions();
//    }
//
//    public InfoMenuGenerator() {
//       this.trigger = null;
//       this.action = null;
//       this.subTriggers = new HashMap();
//       this.subActions = new HashMap();
//       this.uuid = UUID.randomUUID();
//       this.material = (Material)IRandom.threadLocal().choose((Object[])defaultMaterials);
//       this.name = "§7Custom §e#" + (Challenges.getInstance().getCustomChallengesLoader().getCustomChallenges().size() + 1);
//    }
//
//    public static List getSubSettingsDisplay(SubSettingsBuilder builder, Map activated) {
//       List display = new LinkedList();
//       Iterator var3 = builder.getAllChildren().iterator();
//
//       while(var3.hasNext()) {
//          SubSettingsBuilder child = (SubSettingsBuilder)var3.next();
//          display.addAll(child.getDisplay(activated));
//       }
//
//       return display;
//    }
//
//    public void generateInventories() {
//       this.inventory = Bukkit.createInventory(MenuPosition.HOLDER, 54, InventoryTitleManager.getTitle(MenuType.CUSTOM, "Info"));
//       InventoryUtils.fillInventory(this.inventory, ItemBuilder.FILL_ITEM);
//       this.updateItems();
//       InventoryUtils.setNavigationItems(this.inventory, new int[]{45}, true, InventoryUtils.InventorySetter.INVENTORY, 0, 1);
//    }
//
//    public void updateItems() {
//       String currently = Message.forName("custom-info-currently").asString();
//       String none = Message.forName("none").asString();
//       this.inventory.setItem(28, (new ItemBuilder(Material.BARRIER, Message.forName("item-custom-info-delete"))).build());
//       this.inventory.setItem(34, (new ItemBuilder(Material.LIME_DYE, Message.forName("item-custom-info-save"))).build());
//       ItemBuilder triggerItem = (new ItemBuilder(Material.WITHER_SKELETON_SKULL, Message.forName("item-custom-info-trigger"))).appendLore(currently + (this.trigger != null ? Message.forName(this.trigger.getMessage()) : none));
//       if (this.trigger != null) {
//          triggerItem.appendLore((Collection)getSubSettingsDisplay(this.trigger.getSubSettingsBuilder(), this.subTriggers));
//       }
//
//       this.inventory.setItem(30, triggerItem.build());
//       ItemBuilder actionItem = (new ItemBuilder(Material.NETHER_STAR, Message.forName("item-custom-info-action"))).appendLore(currently + (this.action != null ? Message.forName(this.action.getMessage()) : none));
//       if (this.action != null) {
//          actionItem.appendLore((Collection)getSubSettingsDisplay(this.action.getSubSettingsBuilder(), this.subActions));
//       }
//
//       this.inventory.setItem(32, actionItem.build());
//       this.inventory.setItem(14, (new ItemBuilder(this.material == null ? Material.BARRIER : this.material, Message.forName("item-custom-info-material"))).appendLore(currently + (this.material != null ? BukkitStringUtils.getItemName(this.material).toPlainText() : none)).build());
//       this.inventory.setItem(12, (new ItemBuilder(Material.NAME_TAG, Message.forName("item-custom-info-name"))).appendLore(currently + "§7" + this.name).build());
//    }
//
//    public List getInventories() {
//       return Collections.singletonList(this.inventory);
//    }
//
//    public MenuPosition getMenuPosition(int page) {
//       return new InfoMenuGenerator.InfoMenuPosition(page, this);
//    }
//
//    public void open(@Nonnull Player player, int page) {
//       if (this.inventory == null) {
//          this.generateInventories();
//       }
//
//       super.open(player, page);
//    }
//
//    public void accept(Player player, SettingType type, Map data) {
//       this.open(player, 0);
//       switch(type) {
//       case CONDITION:
//          this.trigger = Challenges.getInstance().getCustomSettingsLoader().getTriggerByName(((String[])data.remove("trigger"))[0]);
//          this.subTriggers = data;
//          break;
//       case ACTION:
//          this.action = Challenges.getInstance().getCustomSettingsLoader().getActionByName(((String[])data.remove("action"))[0]);
//          this.subActions = data;
//          break;
//       case MATERIAL:
//          this.material = Material.valueOf(((String[])data.remove("material"))[0]);
//          this.updateItems();
//       }
//
//       this.updateItems();
//    }
//
//    public void setName(String name) {
//       this.name = name;
//       this.updateItems();
//    }
//
//    public void decline(Player player) {
//       this.open(player, 0);
//    }
//
//    public CustomChallenge save() {
//       return Challenges.getInstance().getCustomChallengesLoader().registerCustomChallenge(this.uuid, this.material, this.name, this.trigger, this.subTriggers, this.action, this.subActions, true);
//    }
//
//    public void openChallengeMenu(Player player) {
//       CustomChallenge challenge = (CustomChallenge)Challenges.getInstance().getCustomChallengesLoader().getCustomChallenges().get(this.uuid);
//       if (challenge == null) {
//          Challenges.getInstance().getMenuManager().openMenu(player, MenuType.CUSTOM, 0);
//       } else {
//          ChallengeMenuGenerator menuGenerator = (ChallengeMenuGenerator)MenuType.CUSTOM.getMenuGenerator();
//          int page = menuGenerator.getPageOfChallenge(challenge) + 1;
//          Challenges.getInstance().getMenuManager().openMenu(player, MenuType.CUSTOM, page);
//       }
//
//    }
//
//    @Generated
//    public String toString() {
//       return "InfoMenuGenerator(uuid=" + this.uuid + ", name=" + this.name + ", material=" + this.material + ", trigger=" + this.trigger + ", subTriggers=" + this.subTriggers + ", action=" + this.action + ", subActions=" + this.subActions + ", inventory=" + this.inventory + ")";
//    }
//
//    static {
//       ArrayList list = new ArrayList(Arrays.asList(ExperimentalUtils.getMaterials()));
//       list.removeIf((material1) -> {
//          return !material1.isItem();
//       });
//       defaultMaterials = (Material[])list.toArray(new Material[0]);
//    }
//
//    public class InfoMenuPosition implements MenuPosition {
//       private final int page;
//       private final InfoMenuGenerator generator;
//
//       public InfoMenuPosition(int page, InfoMenuGenerator generator) {
//          this.page = page;
//          this.generator = generator;
//       }
//
//       public void handleClick(@Nonnull MenuClickInfo info) {
//          if (!InventoryUtils.handleNavigationClicking(this.generator, new int[]{45}, this.page, info, () -> {
//             Challenges.getInstance().getMenuManager().openMenu(info.getPlayer(), MenuType.CUSTOM, 0);
//          })) {
//             if (ChallengeMenuGenerator.playNoPermissionsEffect(info.getPlayer())) {
//                info.getPlayer().closeInventory();
//             } else {
//                Player player = info.getPlayer();
//                switch(info.getSlot()) {
//                case 12:
//                   Message.forName("custom-name-info").send(player, Prefix.CUSTOM);
//                   player.closeInventory();
//                   ChatInputListener.setInputAction(player, (event) -> {
//                      int maxNameLength = Challenges.getInstance().getCustomChallengesLoader().getMaxNameLength();
//                      if (event.getMessage().length() > maxNameLength) {
//                         Message.forName("custom-chars-max_length").send(event.getPlayer(), Prefix.CUSTOM, maxNameLength);
//                      } else {
//                         Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
//                            InfoMenuGenerator.this.setName(ChatColor.translateAlternateColorCodes('&', event.getMessage()));
//                            InfoMenuGenerator.this.open(event.getPlayer(), 0);
//                         });
//                      }
//                   });
//                   break;
//                case 14:
//                   MaterialMenuGenerator materialMenuGenerator = new MaterialMenuGenerator(this.generator);
//                   materialMenuGenerator.open(player, 0);
//                   SoundSample.CLICK.play(player);
//                   break;
//                case 28:
//                   if (!Challenges.getInstance().getCustomChallengesLoader().getCustomChallenges().containsKey(InfoMenuGenerator.this.uuid)) {
//                      Message.forName("custom-not-deleted").send(player, Prefix.CUSTOM);
//                      SoundSample.BASS_OFF.play(player);
//                   } else {
//                      InfoMenuGenerator.this.openChallengeMenu(player);
//                      Challenges.getInstance().getCustomChallengesLoader().unregisterCustomChallenge(InfoMenuGenerator.this.uuid);
//                      (new SoundSample()).addSound(Sound.ENTITY_WITHER_BREAK_BLOCK, 0.4F).play(player);
//                   }
//                   break;
//                case 30:
//                   (new CustomMainSettingsMenuGenerator(this.generator, SettingType.CONDITION, "trigger", Message.forName("custom-title-trigger").asString(), ChallengeTrigger.getMenuItems(), (s) -> {
//                      return Challenges.getInstance().getCustomSettingsLoader().getTriggerByName(s);
//                   })).open(player, 0);
//                   SoundSample.CLICK.play(player);
//                   break;
//                case 32:
//                   (new CustomMainSettingsMenuGenerator(this.generator, SettingType.ACTION, "action", Message.forName("custom-title-action").asString(), ChallengeAction.getMenuItems(), (s) -> {
//                      return Challenges.getInstance().getCustomSettingsLoader().getActionByName(s);
//                   })).open(player, 0);
//                   SoundSample.CLICK.play(player);
//                   break;
//                case 34:
//                   String defaults = (new InfoMenuGenerator()).toString();
//                   String current = InfoMenuGenerator.this.toString();
//                   if (defaults.equals(current)) {
//                      Message.forName("custom-no-changes").send(player, Prefix.CUSTOM);
//                      SoundSample.BASS_OFF.play(player);
//                      return;
//                   }
//
//                   InfoMenuGenerator.this.save();
//                   InfoMenuGenerator.this.openChallengeMenu(player);
//                   Message.forName("custom-saved").send(player, Prefix.CUSTOM);
//                   if (InfoMenuGenerator.savePlayerChallenges) {
//                      Message.forName("custom-saved-db").send(player, Prefix.CUSTOM);
//                   }
//
//                   SoundSample.LEVEL_UP.play(player);
//                   break;
//                default:
//                   SoundSample.CLICK.play(player);
//                }
//
//             }
//          }
//       }
//
//       @Generated
//       public InfoMenuGenerator getGenerator() {
//          return this.generator;
//       }
//    }
// }
//
