package net.anweisen.utilities.common.config;

import java.awt.Color;
import java.text.DateFormat;
import java.time.OffsetDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Nullable;

public final class PropertyHelper {
   private static final Map getters = new HashMap();

   private PropertyHelper() {
   }

   @Nullable
   public static Date parseDate(@Nullable String string) {
      try {
         return DateFormat.getDateTimeInstance().parse(string);
      } catch (Exception var2) {
         return null;
      }
   }

   static {
      getters.put(Character.class, Propertyable::getChar);
      getters.put(Boolean.class, Propertyable::getBoolean);
      getters.put(Byte.class, Propertyable::getByte);
      getters.put(Short.class, Propertyable::getShort);
      getters.put(Integer.class, Propertyable::getInt);
      getters.put(Long.class, Propertyable::getLong);
      getters.put(Float.class, Propertyable::getFloat);
      getters.put(Double.class, Propertyable::getDouble);
      getters.put(String.class, Propertyable::getString);
      getters.put(CharSequence.class, Propertyable::getString);
      getters.put(List.class, Propertyable::getStringList);
      getters.put(Document.class, Document::getDocument);
      getters.put(String[].class, Propertyable::getStringArray);
      getters.put(Date.class, Propertyable::getDate);
      getters.put(OffsetDateTime.class, Propertyable::getDateTime);
      getters.put(Color.class, Propertyable::getColor);
      getters.put(byte[].class, Propertyable::getBinary);
   }
}
