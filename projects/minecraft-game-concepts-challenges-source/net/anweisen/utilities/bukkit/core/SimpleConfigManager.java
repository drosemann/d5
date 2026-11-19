package net.anweisen.utilities.bukkit.core;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.FileDocument;
import net.anweisen.utilities.common.config.document.GsonDocument;
import net.anweisen.utilities.common.config.document.YamlDocument;
import net.anweisen.utilities.common.misc.FileUtils;

public class SimpleConfigManager {
   protected final Map configs = new HashMap();
   protected final BukkitModule module;

   public SimpleConfigManager(@Nonnull BukkitModule module) {
      this.module = module;
   }

   @Nonnull
   public FileDocument getDocument(@Nonnull String filename) {
      if (!filename.contains(".")) {
         filename = filename + ".json";
      }

      return this.getDocument(this.module.getDataFile(filename));
   }

   public synchronized FileDocument getDocument(@Nonnull File file) {
      String extension = FileUtils.getFileExtension(file);
      return (FileDocument)this.configs.computeIfAbsent(file.getName(), (key) -> {
         return FileDocument.readFile(resolveType(extension), file);
      });
   }

   @Nonnull
   public static Class resolveType(@Nonnull String extension) {
      String var1 = extension.toLowerCase();
      byte var2 = -1;
      switch(var1.hashCode()) {
      case 119768:
         if (var1.equals("yml")) {
            var2 = 1;
         }
         break;
      case 3271912:
         if (var1.equals("json")) {
            var2 = 0;
         }
         break;
      case 3701415:
         if (var1.equals("yaml")) {
            var2 = 2;
         }
      }

      switch(var2) {
      case 0:
         return GsonDocument.class;
      case 1:
      case 2:
         return YamlDocument.class;
      default:
         throw new IllegalArgumentException("Unknown document file extension '" + extension + "'");
      }
   }
}
