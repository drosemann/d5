package net.anweisen.utilities.common.misc;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public final class GsonUtils {
   private GsonUtils() {
   }

   @Nullable
   public static Object unpackJsonElement(@Nullable JsonElement element) {
      if (element != null && !element.isJsonNull()) {
         if (element.isJsonObject()) {
            return convertJsonObjectToMap(element.getAsJsonObject());
         } else if (element.isJsonArray()) {
            return convertJsonArrayToStringList(element.getAsJsonArray());
         } else {
            if (element.isJsonPrimitive()) {
               JsonPrimitive primitive = element.getAsJsonPrimitive();
               if (primitive.isNumber()) {
                  return primitive.getAsNumber();
               }

               if (primitive.isString()) {
                  return primitive.getAsString();
               }

               if (primitive.isBoolean()) {
                  return primitive.getAsBoolean();
               }
            }

            return element;
         }
      } else {
         return null;
      }
   }

   @Nullable
   public static String convertJsonElementToString(@Nullable JsonElement element) {
      if (element != null && !element.isJsonNull()) {
         if (element.isJsonPrimitive()) {
            JsonPrimitive primitive = element.getAsJsonPrimitive();
            if (primitive.isString()) {
               return primitive.getAsString();
            }

            if (primitive.isNumber()) {
               return primitive.getAsNumber() + "";
            }

            if (primitive.isBoolean()) {
               return primitive.getAsBoolean() + "";
            }
         }

         return element.toString();
      } else {
         return null;
      }
   }

   @Nonnull
   public static Map convertJsonObjectToMap(@Nonnull JsonObject object) {
      Map map = new LinkedHashMap();
      convertJsonObjectToMap(object, map);
      return map;
   }

   public static void convertJsonObjectToMap(@Nonnull JsonObject object, @Nonnull Map map) {
      Iterator var2 = object.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         map.put(entry.getKey(), unpackJsonElement((JsonElement)entry.getValue()));
      }

   }

   @Nonnull
   public static List convertJsonArrayToStringList(@Nonnull JsonArray array) {
      List list = new ArrayList(array.size());
      Iterator var2 = array.iterator();

      while(var2.hasNext()) {
         JsonElement element = (JsonElement)var2.next();
         list.add(convertJsonElementToString(element));
      }

      return list;
   }

   @Nonnull
   public static String[] convertJsonArrayToStringArray(@Nonnull JsonArray array) {
      String[] list = new String[array.size()];

      for(int i = 0; i < array.size(); ++i) {
         list[i] = convertJsonElementToString(array.get(i));
      }

      return list;
   }

   @Nonnull
   public static JsonArray convertIterableToJsonArray(@Nonnull Gson gson, @Nonnull Iterable iterable) {
      JsonArray array = new JsonArray();
      iterable.forEach((object) -> {
         array.add(gson.toJsonTree(object));
      });
      return array;
   }

   @Nonnull
   public static JsonArray convertArrayToJsonArray(@Nonnull Gson gson, @Nonnull Object array) {
      JsonArray jsonArray = new JsonArray();
      ReflectionUtils.forEachInArray(array, (object) -> {
         jsonArray.add(gson.toJsonTree(object));
      });
      return jsonArray;
   }

   public static void setDocumentProperties(@Nonnull Gson gson, @Nonnull JsonObject object, @Nonnull Map values) {
      Iterator var3 = values.entrySet().iterator();

      while(var3.hasNext()) {
         Entry entry = (Entry)var3.next();
         Object value = entry.getValue();
         if (value == null) {
            object.add((String)entry.getKey(), (JsonElement)null);
         } else if (value instanceof JsonElement) {
            object.add((String)entry.getKey(), (JsonElement)value);
         } else if (value instanceof Iterable) {
            Iterable iterable = (Iterable)value;
            object.add((String)entry.getKey(), convertIterableToJsonArray(gson, iterable));
         } else if (value.getClass().isArray()) {
            object.add((String)entry.getKey(), convertArrayToJsonArray(gson, value));
         } else if (value instanceof Map) {
            Map map = (Map)value;
            JsonObject newObject = new JsonObject();
            object.add((String)entry.getKey(), newObject);
            setDocumentProperties(gson, newObject, map);
         } else {
            object.add((String)entry.getKey(), gson.toJsonTree(value));
         }
      }

   }

   public static int getSize(@Nonnull JsonObject object) {
      try {
         return object.size();
      } catch (NoSuchMethodError var2) {
         return object.entrySet().size();
      }
   }
}
