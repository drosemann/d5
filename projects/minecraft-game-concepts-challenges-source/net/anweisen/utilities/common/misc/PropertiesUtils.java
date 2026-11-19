package net.anweisen.utilities.common.misc;

import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Map.Entry;
import javax.annotation.Nonnull;

public final class PropertiesUtils {
   private PropertiesUtils() {
   }

   public static void setProperties(@Nonnull Properties properties, @Nonnull Map map) {
      Iterator var2 = properties.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         map.put((String)entry.getKey(), entry.getValue());
      }

   }
}
