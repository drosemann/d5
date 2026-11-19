package net.codingarea.challenges.plugin.utils.misc;

import java.util.LinkedList;
import org.bukkit.ChatColor;

public class FontUtils {
   private static final char[] SMALL_CAPS_ALPHABET = "ᴀʙᴄᴅᴇғɢʜɪᴊᴋʟᴍɴᴏᴘǫʀsᴛᴜᴠᴡxʏᴢ".toCharArray();

   public static String[] toSmallCaps(String[] text) {
      LinkedList strings = new LinkedList();
      String[] var2 = text;
      int var3 = text.length;

      for(int var4 = 0; var4 < var3; ++var4) {
         String s = var2[var4];
         strings.add(toSmallCaps(s));
      }

      return (String[])strings.toArray(new String[0]);
   }

   public static String toSmallCaps(String text) {
      if (null == text) {
         return null;
      } else {
         int length = text.length();
         StringBuilder smallCaps = new StringBuilder(length);

         for(int i = 0; i < length; ++i) {
            char c = text.charAt(i);
            if (c >= 'a' && c <= 'z') {
               if (i >= 1) {
                  char charBefore = text.charAt(i - 1);
                  if (charBefore == 167 && ChatColor.getByChar(c) != null) {
                     smallCaps.append(c);
                     continue;
                  }
               }

               smallCaps.append(SMALL_CAPS_ALPHABET[c - 97]);
            } else {
               smallCaps.append(c);
            }
         }

         return smallCaps.toString();
      }
   }
}
