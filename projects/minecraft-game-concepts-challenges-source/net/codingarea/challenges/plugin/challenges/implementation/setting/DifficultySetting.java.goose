// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DifficultySetting.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DifficultySetting.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/setting/DifficultySetting.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.setting;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nonnull;
// import net.anweisen.utilities.common.config.Document;
// import net.codingarea.challenges.plugin.ChallengeAPI;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.Modifier;
// import net.codingarea.challenges.plugin.challenges.type.helper.ChallengeHelper;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.utils.bukkit.command.SenderCommand;
// import net.codingarea.challenges.plugin.utils.bukkit.misc.BukkitStringUtils;
// import net.codingarea.challenges.plugin.utils.item.DefaultItem;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
// import net.md_5.bungee.api.ChatColor;
// import net.md_5.bungee.api.chat.BaseComponent;
// import net.md_5.bungee.api.chat.TranslatableComponent;
// import org.bukkit.Bukkit;
// import org.bukkit.Difficulty;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.World.Environment;
// import org.bukkit.command.Command;
// import org.bukkit.command.CommandSender;
// import org.bukkit.command.TabCompleter;
// import org.jetbrains.annotations.Nullable;
//
// public class DifficultySetting extends Modifier implements SenderCommand, TabCompleter {
//    public DifficultySetting() {
//       super(MenuType.SETTINGS, 0, 3, 2);
//    }
//
//    protected void onValueChange() {
//       this.setDifficulty(this.getDifficultyByValue(this.getValue()));
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.GLISTERING_MELON_SLICE, Message.forName("item-difficulty-setting"));
//    }
//
//    @Nonnull
//    public ItemBuilder createSettingsItem() {
//       switch(this.getValue()) {
//       case 0:
//          return DefaultItem.create(Material.LIME_DYE, this.getDifficultyName());
//       case 1:
//          return DefaultItem.create(MinecraftNameWrapper.GREEN_DYE, this.getDifficultyName());
//       case 2:
//          return DefaultItem.create(Material.ORANGE_DYE, this.getDifficultyName());
//       default:
//          return DefaultItem.create(MinecraftNameWrapper.RED_DYE, this.getDifficultyName());
//       }
//    }
//
//    private String getDifficultyName() {
//       return this.getDifficultyComponent().toLegacyText();
//    }
//
//    public void playValueChangeTitle() {
//       ChallengeHelper.playChangeChallengeValueTitle(this, (Object)this.getDifficultyName());
//    }
//
//    private void setDifficulty(Difficulty difficulty) {
//       Bukkit.dispatchCommand(Bukkit.getConsoleSender(), "minecraft:difficulty " + difficulty.name().toLowerCase());
//       Iterator var2 = Bukkit.getWorlds().iterator();
//
//       while(var2.hasNext()) {
//          World world = (World)var2.next();
//          world.setDifficulty(difficulty);
//       }
//
//    }
//
//    @Nonnull
//    private Difficulty getCurrentDifficulty() {
//       return Bukkit.getWorlds().isEmpty() ? Difficulty.NORMAL : ChallengeAPI.getGameWorld(Environment.NORMAL).getDifficulty();
//    }
//
//    @Nonnull
//    private Difficulty getDifficultyByValue(int value) {
//       Difficulty difficulty = Difficulty.values()[value];
//       return difficulty == null ? Difficulty.NORMAL : difficulty;
//    }
//
//    public void loadSettings(@Nonnull Document document) {
//       if (!document.contains("value")) {
//          this.setValue(this.getCurrentDifficulty().ordinal());
//       }
//
//       super.loadSettings(document);
//    }
//
//    public void onCommand(@Nonnull CommandSender sender, @Nonnull String[] args) throws Exception {
//       if (args.length == 0) {
//          Message.forName("command-difficulty-current").send(sender, Prefix.CHALLENGES, this.getDifficultyComponent());
//       } else {
//          int difficulty = this.getDifficultyValue(args[0]);
//          if (difficulty == -1) {
//             Message.forName("syntax").send(sender, Prefix.CHALLENGES, "difficulty <difficulty>");
//          } else {
//             this.setValue(difficulty);
//             Message.forName("command-difficulty-change").broadcast(Prefix.CHALLENGES, this.getDifficultyComponent());
//          }
//       }
//    }
//
//    private BaseComponent getDifficultyComponent() {
//       TranslatableComponent name = BukkitStringUtils.getDifficultyName(this.getDifficultyByValue(this.getValue()));
//       switch(this.getValue()) {
//       case 0:
//          name.setColor(ChatColor.GREEN);
//          break;
//       case 1:
//          name.setColor(ChatColor.DARK_GREEN);
//          break;
//       case 2:
//          name.setColor(ChatColor.GOLD);
//          break;
//       default:
//          name.setColor(ChatColor.RED);
//       }
//
//       return name;
//    }
//
//    @Nullable
//    public List onTabComplete(@Nonnull CommandSender sender, @Nonnull Command command, @Nonnull String alias, @Nonnull String[] args) {
//       return (List)(args.length > 1 ? new ArrayList() : Arrays.asList("peaceful", "easy", "normal", "hard"));
//    }
//
//    private int getDifficultyValue(@Nonnull String input) {
//       String var2 = input.toLowerCase();
//       byte var3 = -1;
//       switch(var2.hashCode()) {
//       case -1039745817:
//          if (var2.equals("normal")) {
//             var3 = 2;
//          }
//          break;
//       case -58612657:
//          if (var2.equals("peaceful")) {
//             var3 = 0;
//          }
//          break;
//       case 3105794:
//          if (var2.equals("easy")) {
//             var3 = 1;
//          }
//          break;
//       case 3195115:
//          if (var2.equals("hard")) {
//             var3 = 3;
//          }
//       }
//
//       switch(var3) {
//       case 0:
//          return 0;
//       case 1:
//          return 1;
//       case 2:
//          return 2;
//       case 3:
//          return 3;
//       default:
//          try {
//             int value = Integer.parseInt(input);
//             return value >= 0 && value <= 3 ? value : -1;
//          } catch (Exception var4) {
//             return -1;
//          }
//       }
//    }
// }
//
