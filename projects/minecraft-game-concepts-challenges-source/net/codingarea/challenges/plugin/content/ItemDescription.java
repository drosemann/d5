package net.codingarea.challenges.plugin.content;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.utils.misc.ColorConversions;

public final class ItemDescription {
   private static final Document config = Challenges.getInstance().getConfigDocument().getDocument("design");
   private final String[] colors;
   private final String[] lore;
   private final String name;
   private final String originalName;

   public ItemDescription(@Nonnull String[] themeColors, @Nonnull String name, @Nonnull String[] formattedLore) {
      this.colors = themeColors;
      this.name = Message.forName("item-prefix") + name;
      this.originalName = name;
      this.lore = formattedLore;
   }

   public ItemDescription(@Nonnull String[] description) {
      if (description.length == 0) {
         throw new IllegalArgumentException("Invalid item description: Cannot be empty");
      } else {
         this.originalName = description[0];
         this.name = Message.forName("item-prefix") + this.originalName;
         this.colors = this.determineColors(this.originalName);
         List loreOutput = new ArrayList();
         this.fillLore(description, loreOutput);
         this.lore = (String[])loreOutput.toArray(new String[0]);
      }
   }

   public static ItemDescription empty() {
      return new ItemDescription(new String[]{"§e"}, "§r§fN/A", new String[0]);
   }

   @Nonnull
   public String getName() {
      return this.name;
   }

   @Nonnull
   public String getOriginalName() {
      return this.originalName;
   }

   @Nonnull
   public String[] getTheme() {
      return this.colors;
   }

   @Nonnull
   public String[] getLore() {
      return this.lore;
   }

   private void fillLore(@Nonnull String[] origin, @Nonnull List output) {
      String colorBefore = "§7";
      boolean inColor = false;
      boolean nextIsColor = false;
      int themeIndex = 0;

      for(int i = 1; i < origin.length; ++i) {
         StringBuilder line = new StringBuilder();
         line.append(colorBefore);
         char[] var9 = origin[i].toCharArray();
         int var10 = var9.length;

         for(int var11 = 0; var11 < var10; ++var11) {
            char c = var9[var11];
            if (c == '*') {
               if (inColor) {
                  line.append(colorBefore);
                  inColor = false;
               } else {
                  line.append(this.colors[themeIndex]);
                  ++themeIndex;
                  if (themeIndex >= this.colors.length) {
                     themeIndex = 0;
                  }

                  inColor = true;
               }
            } else {
               line.append(c);
               if (c == 167) {
                  nextIsColor = true;
               } else if (nextIsColor) {
                  nextIsColor = false;
                  if (ColorConversions.isValidColorCode(c)) {
                     colorBefore = "";
                  }

                  colorBefore = colorBefore + "§" + c;
               }
            }
         }

         output.add(line.toString());
      }

      if (!output.isEmpty()) {
         if (config.getBoolean("empty-line-above")) {
            output.add(0, " ");
         }

         if (config.getBoolean("empty-line-underneath")) {
            output.add(" ");
         }

      }
   }

   private String[] determineColors(@Nonnull String input) {
      List colors = new LinkedList();
      int colorIndex = 0;
      boolean nextIsCode = false;
      char[] var5 = input.toCharArray();
      int var6 = var5.length;

      for(int var7 = 0; var7 < var6; ++var7) {
         char c = var5[var7];
         if (c == 167) {
            nextIsCode = true;
         } else if (nextIsCode) {
            nextIsCode = false;
            String latestColors = "";
            if (colors.size() > colorIndex) {
               latestColors = (String)colors.remove(colorIndex);
            }

            colors.add(latestColors + '§' + c);
            if (ColorConversions.isValidColorCode(c)) {
               ++colorIndex;
            }
         }
      }

      if (colors.isEmpty()) {
         colors.add("§e");
      }

      return (String[])colors.toArray(new String[0]);
   }
}
