// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/ColorConversions.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/ColorConversions.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/ColorConversions.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import java.awt.Color;
// import java.util.HashMap;
// import java.util.Map;
// import java.util.Optional;
// import java.util.Map.Entry;
// import javax.annotation.Nonnull;
// import org.bukkit.ChatColor;
// import org.bukkit.DyeColor;
// import org.bukkit.Material;
//
// public final class ColorConversions {
//    private static final Map colorsByChatColor = new HashMap();
//
//    private ColorConversions() {
//    }
//
//    @Nonnull
//    public static ChatColor convertDyeColorToChatColor(@Nonnull DyeColor color) {
//       switch(color) {
//       case RED:
//          return ChatColor.RED;
//       case BLUE:
//          return ChatColor.DARK_BLUE;
//       case CYAN:
//          return ChatColor.DARK_AQUA;
//       case GRAY:
//          return ChatColor.DARK_GRAY;
//       case LIME:
//          return ChatColor.GREEN;
//       case GREEN:
//          return ChatColor.DARK_GREEN;
//       case PURPLE:
//          return ChatColor.DARK_PURPLE;
//       case YELLOW:
//          return ChatColor.YELLOW;
//       case LIGHT_BLUE:
//          return ChatColor.BLUE;
//       case LIGHT_GRAY:
//          return ChatColor.GRAY;
//       case BLACK:
//          return ChatColor.BLACK;
//       case BROWN:
//       case ORANGE:
//          return ChatColor.GOLD;
//       case PINK:
//       case MAGENTA:
//          return ChatColor.LIGHT_PURPLE;
//       case WHITE:
//       default:
//          return ChatColor.WHITE;
//       }
//    }
//
//    @Nonnull
//    public static Material convertDyeColorToMaterial(@Nonnull DyeColor color) {
//       switch(color) {
//       case RED:
//          return MinecraftNameWrapper.RED_DYE;
//       case BLUE:
//          return Material.LAPIS_LAZULI;
//       case CYAN:
//          return Material.CYAN_DYE;
//       case GRAY:
//          return Material.GRAY_DYE;
//       case LIME:
//          return Material.LIME_DYE;
//       case GREEN:
//          return MinecraftNameWrapper.GREEN_DYE;
//       case PURPLE:
//          return Material.PURPLE_DYE;
//       case YELLOW:
//          return MinecraftNameWrapper.YELLOW_DYE;
//       case LIGHT_BLUE:
//          return Material.LIGHT_BLUE_DYE;
//       case LIGHT_GRAY:
//          return Material.LIGHT_GRAY_DYE;
//       case BLACK:
//          return Material.INK_SAC;
//       case BROWN:
//          return Material.COCOA_BEANS;
//       case ORANGE:
//          return Material.ORANGE_DYE;
//       case PINK:
//          return Material.PINK_DYE;
//       case MAGENTA:
//          return Material.MAGENTA_DYE;
//       case WHITE:
//       default:
//          return Material.BONE_MEAL;
//       }
//    }
//
//    @Nonnull
//    public static ChatColor convertAwtColorToChatColor(@Nonnull Color color) {
//       return (ChatColor)((Entry)colorsByChatColor.entrySet().stream().min((o1, o2) -> {
//          return (int)((calculateDifferenceBetweenColors(color, (Color)o1.getValue()) - calculateDifferenceBetweenColors(color, (Color)o2.getValue())) * 100.0D);
//       }).orElseThrow(() -> {
//          return new IllegalStateException("Could not find a ChatColor for the given input");
//       })).getKey();
//    }
//
//    @Nonnull
//    public static Color convertChatColorToAwtColor(@Nonnull ChatColor color) {
//       return (Color)Optional.ofNullable((Color)colorsByChatColor.get(color)).orElseThrow(() -> {
//          return new IllegalStateException("Could not find a color for ChatColor." + color.name());
//       });
//    }
//
//    @Nonnull
//    public static float[] convertAwtColorToHSB(@Nonnull Color color) {
//       return Color.RGBtoHSB(color.getRed(), color.getGreen(), color.getBlue(), (float[])null);
//    }
//
//    public static double calculateDifferenceBetweenColors(@Nonnull Color color1, @Nonnull Color color2) {
//       int diffRed = Math.abs(color1.getRed() - color2.getRed());
//       int diffGreen = Math.abs(color1.getGreen() - color2.getGreen());
//       int diffBlue = Math.abs(color1.getBlue() - color2.getBlue());
//       float pctDiffRed = (float)diffRed / 255.0F;
//       float pctDiffGreen = (float)diffGreen / 255.0F;
//       float pctDiffBlue = (float)diffBlue / 255.0F;
//       return (double)((pctDiffRed + pctDiffGreen + pctDiffBlue) / 3.0F * 100.0F);
//    }
//
//    public static boolean isValidColorCode(char code) {
//       ChatColor[] var1 = ChatColor.values();
//       int var2 = var1.length;
//
//       for(int var3 = 0; var3 < var2; ++var3) {
//          ChatColor color = var1[var3];
//          if (color.isColor() && color.getChar() == code) {
//             return true;
//          }
//       }
//
//       return false;
//    }
//
//    public static boolean isValidColorCode(@Nonnull String code) {
//       return code.length() != 1 ? false : isValidColorCode(code.toCharArray()[0]);
//    }
//
//    static {
//       colorsByChatColor.put(ChatColor.BLACK, Color.decode("#000000"));
//       colorsByChatColor.put(ChatColor.DARK_BLUE, Color.decode("#0000A8"));
//       colorsByChatColor.put(ChatColor.DARK_GREEN, Color.decode("#00A800"));
//       colorsByChatColor.put(ChatColor.DARK_AQUA, Color.decode("#00A8A8"));
//       colorsByChatColor.put(ChatColor.DARK_RED, Color.decode("#A80000"));
//       colorsByChatColor.put(ChatColor.DARK_PURPLE, Color.decode("#A800A8"));
//       colorsByChatColor.put(ChatColor.GOLD, Color.decode("#FBA800"));
//       colorsByChatColor.put(ChatColor.GRAY, Color.decode("#A8A8A8"));
//       colorsByChatColor.put(ChatColor.DARK_GRAY, Color.decode("#545454"));
//       colorsByChatColor.put(ChatColor.BLUE, Color.decode("#5454FB"));
//       colorsByChatColor.put(ChatColor.GREEN, Color.decode("#54FB54"));
//       colorsByChatColor.put(ChatColor.AQUA, Color.decode("#54FBFB"));
//       colorsByChatColor.put(ChatColor.RED, Color.decode("#FB5454"));
//       colorsByChatColor.put(ChatColor.LIGHT_PURPLE, Color.decode("#FB54FB"));
//       colorsByChatColor.put(ChatColor.YELLOW, Color.decode("#FBFB54"));
//       colorsByChatColor.put(ChatColor.WHITE, Color.decode("#FBFBFB"));
//    }
// }
//
