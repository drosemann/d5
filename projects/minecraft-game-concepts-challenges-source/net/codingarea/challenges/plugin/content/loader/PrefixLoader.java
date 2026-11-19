package net.codingarea.challenges.plugin.content.loader;

import java.io.File;
import java.util.Iterator;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.common.config.FileDocument;
import net.anweisen.utilities.common.misc.FileUtils;
import net.codingarea.challenges.plugin.content.Prefix;

public final class PrefixLoader extends ContentLoader {
   protected void load() {
      try {
         File file = this.getMessageFile("prefix", "properties");
         FileUtils.createFilesIfNecessary(file);
         FileDocument document = FileDocument.readPropertiesFile(file);
         boolean changed = false;
         Iterator var4 = Prefix.values().iterator();

         while(var4.hasNext()) {
            Prefix prefix = (Prefix)var4.next();
            if (!document.contains(prefix.getName())) {
               document.set(prefix.getName(), prefix.toString());
               changed = true;
            } else {
               prefix.setValue(document.getString(prefix.getName()));
            }
         }

         if (changed) {
            document.save();
         }

         Logger.info("Successfully loaded {} prefixes from config file", Prefix.values().size());
      } catch (Exception var6) {
         Logger.error("Could not load prefixes", var6);
      }

   }
}
