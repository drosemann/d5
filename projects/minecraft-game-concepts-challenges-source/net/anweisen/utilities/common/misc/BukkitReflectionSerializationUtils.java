package net.anweisen.utilities.common.misc;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;
import java.util.Map;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.logging.ILogger;

public final class BukkitReflectionSerializationUtils {
   protected static final ILogger logger = ILogger.forThisClass();

   private BukkitReflectionSerializationUtils() {
   }

   public static boolean isSerializable(@Nonnull Class clazz) {
      try {
         clazz.getMethod("serialize");
         return true;
      } catch (Throwable var2) {
         return false;
      }
   }

   @Nullable
   public static Map serializeObject(@Nonnull Object object) {
      Class classOfObject = object.getClass();

      try {
         Method method = classOfObject.getMethod("serialize");
         method.setAccessible(true);
         Object serialized = method.invoke(object);
         if (!(serialized instanceof Map)) {
            throw new IllegalArgumentException(method + " does not return a Map");
         } else {
            Map map = (Map)serialized;
            return map;
         }
      } catch (Throwable var5) {
         logger.error("Could not serialize object of type {}", classOfObject, var5);
         return null;
      }
   }

   @Nullable
   public static Object deserializeObject(@Nonnull Map map, @Nullable Class classOfT) {
      try {
         Class configurationSerializationClass = Class.forName("org.bukkit.configuration.serialization.ConfigurationSerialization");
         Method method = configurationSerializationClass.getMethod("deserializeObject", Map.class);
         method.setAccessible(true);
         Object object = method.invoke((Object)null, map);
         return object;
      } catch (Throwable var6) {
         if (classOfT == null) {
            return null;
         } else {
            try {
               Method method = classOfT.getMethod("deserialize", Map.class);
               method.setAccessible(true);
               Object object = method.invoke((Object)null, map);
               if (!classOfT.isInstance(object)) {
                  throw new IllegalStateException("Deserialization of " + classOfT.getName() + " failed: returned " + (object == null ? null : object.getClass().getName()));
               } else {
                  return classOfT.cast(object);
               }
            } catch (Throwable var5) {
               logger.error("Could not deserialize object of type {}", classOfT, var5);
               return null;
            }
         }
      }
   }

   @Nonnull
   public static String getSerializationName(@Nonnull Class clazz) {
      Annotation[] var1 = clazz.getAnnotations();
      int var2 = var1.length;
      int var3 = 0;

      while(var3 < var2) {
         Annotation annotation = var1[var3];
         Class annotationType = annotation.annotationType();
         Object value = ReflectionUtils.getAnnotationValue(annotation);
         String var7 = annotationType.getSimpleName();
         byte var8 = -1;
         switch(var7.hashCode()) {
         case 873754187:
            if (var7.equals("DelegateSerialization")) {
               var8 = 1;
            }
            break;
         case 1818683825:
            if (var7.equals("SerializableAs")) {
               var8 = 2;
            }
            break;
         case 1936937130:
            if (var7.equals("DelegateDeserialization")) {
               var8 = 0;
            }
         }

         switch(var8) {
         case 0:
         case 1:
         case 2:
            if (value instanceof Class) {
               return getSerializationName((Class)value);
            }

            if (value instanceof String) {
               return (String)value;
            }
         default:
            ++var3;
         }
      }

      return clazz.getName();
   }
}
