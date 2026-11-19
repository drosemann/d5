// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/misc/BukkitStringUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/misc/BukkitStringUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/misc/BukkitStringUtils.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.bukkit.misc;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Iterator;
// import java.util.LinkedList;
// import java.util.List;
// import java.util.concurrent.Callable;
// import java.util.function.Supplier;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
// import net.anweisen.utilities.common.collection.WrappedException;
// import net.anweisen.utilities.common.logging.ILogger;
// import net.codingarea.challenges.plugin.content.Prefix;
// import net.md_5.bungee.api.chat.BaseComponent;
// import net.md_5.bungee.api.chat.ComponentBuilder;
// import net.md_5.bungee.api.chat.HoverEvent;
// import net.md_5.bungee.api.chat.TextComponent;
// import net.md_5.bungee.api.chat.TranslatableComponent;
// import net.md_5.bungee.api.chat.HoverEvent.Action;
// import org.bukkit.ChatColor;
// import org.bukkit.Difficulty;
// import org.bukkit.GameMode;
// import org.bukkit.Material;
// import org.bukkit.NamespacedKey;
// import org.bukkit.advancement.Advancement;
// import org.bukkit.block.Biome;
// import org.bukkit.entity.EntityType;
// import org.bukkit.loot.LootTable;
// import org.bukkit.potion.PotionEffectType;
//
// public class BukkitStringUtils {
//    @Nonnull
//    public static BaseComponent[] format(@Nullable Prefix prefix, @Nonnull String[] array, @Nonnull Object... args) {
//       List results = new ArrayList();
//       String[] var4 = array;
//       int var5 = array.length;
//
//       for(int var6 = 0; var6 < var5; ++var6) {
//          String value = var4[var6];
//          String s = value;
//          if (!value.trim().isEmpty() && prefix != null) {
//             s = prefix + value;
//          }
//
//          BaseComponent comp = null;
//          Iterator var10 = format(s, args).iterator();
//
//          while(var10.hasNext()) {
//             BaseComponent component = (BaseComponent)var10.next();
//             if (comp == null) {
//                comp = component;
//             } else {
//                comp.addExtra(component);
//             }
//          }
//
//          results.add(comp);
//       }
//
//       return (BaseComponent[])results.toArray(new BaseComponent[0]);
//    }
//
//    @Nonnull
//    public static List format(@Nonnull String sequence, @Nonnull Object... args) {
//       args = replaceArguments(args, false);
//       List results = new ArrayList();
//       char start = '{';
//       char end = '}';
//       boolean inArgument = false;
//       boolean lastWasParagraph = false;
//       ChatColor currentColor = null;
//       List currentFormatting = new LinkedList();
//       StringBuilder argument = new StringBuilder();
//       TextComponent currentText = new TextComponent();
//       char[] var11 = sequence.toCharArray();
//       int var12 = var11.length;
//
//       for(int var13 = 0; var13 < var12; ++var13) {
//          char c = var11[var13];
//          if (c == 167) {
//             lastWasParagraph = true;
//          } else {
//             if (lastWasParagraph) {
//                ChatColor newColor = ChatColor.getByChar(c);
//                if (!newColor.isColor()) {
//                   if (newColor == ChatColor.RESET) {
//                      currentFormatting.clear();
//                      currentColor = null;
//                   } else {
//                      currentFormatting.add(newColor);
//                   }
//                } else {
//                   currentColor = newColor;
//                   currentFormatting.clear();
//                }
//             }
//
//             lastWasParagraph = false;
//          }
//
//          if (c == end && inArgument) {
//             inArgument = false;
//
//             try {
//                int arg = Integer.parseInt(argument.toString());
//                Object current = args[arg];
//                BaseComponent replacement = current instanceof BaseComponent ? (BaseComponent)current : (current instanceof Supplier ? new TextComponent(String.valueOf(((Supplier)current).get())) : (current instanceof Callable ? new TextComponent(String.valueOf(((Callable)current).call())) : new TextComponent(String.valueOf(current))));
//                if (replacement instanceof TextComponent) {
//                   currentText.setText(currentText.getText() + ((TextComponent)replacement).getText());
//                } else {
//                   results.add(currentText);
//                   currentText = new TextComponent();
//                   if (currentColor != null && ((BaseComponent)replacement).getColor() == net.md_5.bungee.api.ChatColor.WHITE) {
//                      ((BaseComponent)replacement).setColor(currentColor.asBungee());
//                   }
//
//                   Iterator var18 = currentFormatting.iterator();
//
//                   while(var18.hasNext()) {
//                      ChatColor color = (ChatColor)var18.next();
//                      switch(color) {
//                      case BOLD:
//                         ((BaseComponent)replacement).setBold(true);
//                         break;
//                      case MAGIC:
//                         ((BaseComponent)replacement).setObfuscated(true);
//                         break;
//                      case ITALIC:
//                         ((BaseComponent)replacement).setItalic(true);
//                         break;
//                      case STRIKETHROUGH:
//                         ((BaseComponent)replacement).setStrikethrough(true);
//                         break;
//                      case UNDERLINE:
//                         ((BaseComponent)replacement).setUnderlined(true);
//                      }
//                   }
//
//                   results.add(replacement);
//                }
//
//                currentColor = null;
//             } catch (IndexOutOfBoundsException | NumberFormatException var20) {
//                ILogger.forThisClass().warn("Invalid argument index '{}'", argument);
//                results.add(new TextComponent(String.valueOf(start)));
//                results.add(new TextComponent(String.valueOf(argument)));
//                results.add(new TextComponent(String.valueOf(end)));
//             } catch (Exception var21) {
//                throw new WrappedException(var21);
//             }
//
//             argument = new StringBuilder();
//          } else if (c == start && !inArgument) {
//             inArgument = true;
//          } else if (inArgument) {
//             argument.append(c);
//          } else {
//             currentText = new TextComponent(currentText.getText() + c);
//          }
//       }
//
//       if (!currentText.getText().isEmpty()) {
//          results.add(currentText);
//       }
//
//       if (argument.length() > 0) {
//          results.add(new TextComponent(String.valueOf(start)));
//          results.add(new TextComponent(String.valueOf(argument)));
//       }
//
//       return results;
//    }
//
//    public static Object[] replaceArguments(Object[] args, boolean toStrings) {
//       args = Arrays.copyOf(args, args.length);
//
//       for(int i = 0; i < args.length; ++i) {
//          Object arg = args[i];
//          arg = arg instanceof Material ? getItemComponent((Material)arg) : (arg instanceof EntityType ? getEntityName((EntityType)arg) : (arg instanceof PotionEffectType ? getPotionEffectName((PotionEffectType)arg) : (arg instanceof Biome ? getBiomeName((Biome)arg) : (arg instanceof GameMode ? getGameModeName((GameMode)arg) : (arg instanceof Advancement ? getAdvancementComponent((Advancement)arg) : (arg instanceof LootTable ? getEntityName((LootTable)arg) : (arg instanceof Difficulty ? getDifficultyName((Difficulty)arg) : arg)))))));
//          if (toStrings && arg instanceof BaseComponent) {
//             arg = ((BaseComponent)arg).toPlainText();
//          }
//
//          args[i] = arg;
//       }
//
//       return args;
//    }
//
//    public static TranslatableComponent getItemName(@Nonnull Material material) {
//       NamespacedKey key = material.getKey();
//       return new TranslatableComponent((material.isBlock() ? "block" : "item") + "." + key.getNamespace() + "." + key.getKey(), new Object[0]);
//    }
//
//    @Nullable
//    public static BaseComponent getMusicDiscName(@Nonnull Material material) {
//       if (!material.name().startsWith("MUSIC_DISC")) {
//          return null;
//       } else {
//          String key = "item.minecraft." + material.name().toLowerCase() + ".desc";
//          return new TranslatableComponent(key, new Object[0]);
//       }
//    }
//
//    public static BaseComponent getItemComponent(@Nonnull Material material) {
//       BaseComponent component = getItemName(material);
//       BaseComponent musicDiscName = getMusicDiscName(material);
//       if (musicDiscName != null) {
//          component.addExtra(" (");
//          component.addExtra(musicDiscName);
//          component.addExtra(")");
//       }
//
//       return component;
//    }
//
//    public static TranslatableComponent getEntityName(@Nonnull EntityType type) {
//       String namespace = "minecraft";
//       String key;
//       if (MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_14)) {
//          NamespacedKey namespacedKey = type.getKey();
//          key = namespacedKey.getKey();
//          namespace = namespacedKey.getNamespace();
//       } else {
//          key = type.getName();
//       }
//
//       return new TranslatableComponent("entity." + namespace + "." + key, new Object[0]);
//    }
//
//    public static TranslatableComponent getEntityName(@Nonnull LootTable type) {
//       NamespacedKey key = type.getKey();
//       return new TranslatableComponent("entity." + key.getNamespace() + "." + key.getKey().replace("entities/", ""), new Object[0]);
//    }
//
//    public static TranslatableComponent getPotionEffectName(@Nonnull PotionEffectType type) {
//       String namespace = "minecraft";
//       String key;
//       if (MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_14)) {
//          NamespacedKey namespacedKey = type.getKey();
//          key = namespacedKey.getKey();
//          namespace = namespacedKey.getNamespace();
//       } else {
//          key = type.getName().toLowerCase();
//       }
//
//       return new TranslatableComponent("effect." + namespace + "." + key, new Object[0]);
//    }
//
//    public static TranslatableComponent getBiomeName(@Nonnull Biome biome) {
//       String namespace = "minecraft";
//       String key;
//       if (MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_14)) {
//          NamespacedKey namespacedKey = biome.getKey();
//          key = namespacedKey.getKey();
//          namespace = namespacedKey.getNamespace();
//       } else {
//          key = biome.name().toLowerCase();
//       }
//
//       return new TranslatableComponent("biome." + namespace + "." + key, new Object[0]);
//    }
//
//    public static TranslatableComponent getGameModeName(@Nonnull GameMode gameMode) {
//       return new TranslatableComponent("selectWorld.gameMode." + gameMode.name().toLowerCase(), new Object[0]);
//    }
//
//    public static BaseComponent getAdvancementTitle(@Nonnull Advancement advancement) {
//       String replace = advancement.getKey().getKey().replace("/", ".");
//       return new TranslatableComponent("advancements." + correctAdvancementKeys(replace) + ".title", new Object[0]);
//    }
//
//    public static BaseComponent getAdvancementDescription(@Nonnull Advancement advancement) {
//       String replace = advancement.getKey().getKey().replace("/", ".");
//       return new TranslatableComponent("advancements." + correctAdvancementKeys(replace) + ".description", new Object[0]);
//    }
//
//    public static BaseComponent getAdvancementComponent(@Nonnull Advancement advancement) {
//       BaseComponent title = getAdvancementTitle(advancement);
//       BaseComponent description = getAdvancementDescription(advancement);
//       description.setColor(net.md_5.bungee.api.ChatColor.GREEN);
//       title.setHoverEvent(new HoverEvent(Action.SHOW_TEXT, (new ComponentBuilder(description)).create()));
//       return title;
//    }
//
//    private static String correctAdvancementKeys(String s) {
//       return s.replace("bred_all_animals", "breed_all_animals").replace("obtain_netherite_hoe", "netherite_hoe");
//    }
//
//    public static TranslatableComponent getDifficultyName(@Nonnull Difficulty difficulty) {
//       return new TranslatableComponent("options.difficulty." + difficulty.name().toLowerCase(), new Object[0]);
//    }
// }
//
