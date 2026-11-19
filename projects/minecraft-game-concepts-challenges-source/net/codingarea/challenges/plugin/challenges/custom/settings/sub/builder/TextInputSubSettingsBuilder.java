package net.codingarea.challenges.plugin.challenges.custom.settings.sub.builder;

import com.google.common.collect.Lists;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Consumer;
import java.util.function.Predicate;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;
import net.codingarea.challenges.plugin.management.menu.generator.implementation.custom.IParentCustomGenerator;
import net.codingarea.challenges.plugin.spigot.listener.ChatInputListener;
import net.codingarea.challenges.plugin.utils.item.DefaultItem;
import net.codingarea.challenges.plugin.utils.misc.MapUtils;
import org.bukkit.Bukkit;
import org.bukkit.entity.Player;

public class TextInputSubSettingsBuilder extends SubSettingsBuilder {
   private final Consumer onOpen;
   private final Predicate isValid;

   public TextInputSubSettingsBuilder(String key) {
      this(key, (SubSettingsBuilder)null);
   }

   public TextInputSubSettingsBuilder(String key, SubSettingsBuilder parent) {
      this(key, parent, (event) -> {
      }, (event) -> {
         return true;
      });
   }

   public TextInputSubSettingsBuilder(String key, Consumer onOpen, Predicate isValid) {
      super(key);
      this.onOpen = onOpen;
      this.isValid = isValid;
   }

   public TextInputSubSettingsBuilder(String key, SubSettingsBuilder parent, Consumer onOpen, Predicate isValid) {
      super(key, parent);
      this.onOpen = onOpen;
      this.isValid = isValid;
   }

   public boolean open(Player player, IParentCustomGenerator parentGenerator, String title) {
      player.closeInventory();
      this.onOpen.accept(player);
      ChatInputListener.setInputAction(player, (event) -> {
         if (!this.isValid.test(event)) {
            Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
               parentGenerator.decline(player);
            });
         } else {
            Bukkit.getScheduler().runTask(Challenges.getInstance(), () -> {
               parentGenerator.accept(player, (SettingType)null, MapUtils.createStringArrayMap(this.getKey(), event.getMessage()));
            });
         }
      });
      return true;
   }

   public List getDisplay(Map activated) {
      List display = Lists.newLinkedList();
      Iterator var3 = activated.entrySet().iterator();

      while(true) {
         Entry entry;
         do {
            if (!var3.hasNext()) {
               return display;
            }

            entry = (Entry)var3.next();
         } while(!((String)entry.getKey()).equals(this.getKey()));

         String[] var5 = (String[])entry.getValue();
         int var6 = var5.length;

         for(int var7 = 0; var7 < var6; ++var7) {
            String value = var5[var7];
            display.add("§7" + this.getKeyTranslation() + " " + DefaultItem.getItemPrefix() + value);
         }
      }
   }

   public boolean hasSettings() {
      return true;
   }
}
