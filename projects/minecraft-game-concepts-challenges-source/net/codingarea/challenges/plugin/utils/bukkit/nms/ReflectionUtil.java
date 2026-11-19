package net.codingarea.challenges.plugin.utils.bukkit.nms;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.StringJoiner;
import java.util.regex.Pattern;
import lombok.Generated;
import net.codingarea.challenges.plugin.Challenges;
import org.bukkit.Bukkit;

public class ReflectionUtil {
   public static String SERVER_VERSION;
   private static boolean useNewSpigotPackaging;
   private static int majorVersion;
   private static int minorVersion;

   public static Class getBukkitClass(String className) throws ClassNotFoundException {
      return Class.forName("org.bukkit.craftbukkit." + SERVER_VERSION + "." + className);
   }

   /** @deprecated */
   @Deprecated
   public static Class getNmsClass(String className) throws ClassNotFoundException {
      return Class.forName("net.minecraft.server." + SERVER_VERSION + "." + className);
   }

   public static Class getMinecraftClass(String className) throws ClassNotFoundException {
      return Class.forName("net.minecraft." + className);
   }

   public static Constructor getConstructor(Class clazz, Class... args) throws NoSuchMethodException {
      Constructor con = clazz.getConstructor(args);
      con.setAccessible(true);
      return con;
   }

   public static Enum getEnum(Class clazz, String constant) {
      Enum[] constants = (Enum[])clazz.getEnumConstants();
      Enum[] var3 = constants;
      int var4 = constants.length;

      for(int var5 = 0; var5 < var4; ++var5) {
         Enum e = var3[var5];
         if (e.name().equalsIgnoreCase(constant)) {
            return e;
         }
      }

      return null;
   }

   public static Enum getEnum(Class clazz, String enumname, String constant) throws ClassNotFoundException {
      Class c = Class.forName(clazz.getName() + "$" + enumname);
      return getEnum(c, constant);
   }

   public static Field getField(Class clazz, String fieldName) throws NoSuchFieldException {
      Field f = clazz.getDeclaredField(fieldName);
      f.setAccessible(true);
      return f;
   }

   public static void setFieldValue(Object instance, String fieldName, Object value) throws NoSuchFieldException, IllegalAccessException {
      Field field = instance.getClass().getDeclaredField(fieldName);
      field.setAccessible(true);
      field.set(instance, value);
   }

   public static Method getMethod(Class clazz, String methodName, Class... args) throws NoSuchMethodException {
      Method m = clazz.getDeclaredMethod(methodName, args);
      m.setAccessible(true);
      return m;
   }

   public static Object invokeMethod(Object obj, String methodName) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      return invokeMethod(obj.getClass(), obj, methodName);
   }

   public static Object invokeMethod(Object obj, String methodName, Object[] args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      return invokeMethod(obj.getClass(), obj, methodName, args);
   }

   public static Object invokeMethod(Object obj, String methodName, Class[] argTypes, Object[] args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      return invokeMethod(obj.getClass(), obj, methodName, argTypes, args);
   }

   public static Object invokeMethod(Class clazz, Object obj, String methodName, Object... args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      Class[] argTypes = new Class[args.length];

      for(int i = 0; i < args.length; ++i) {
         argTypes[i] = args[i].getClass();
      }

      return invokeMethod(clazz, obj, methodName, argTypes, args);
   }

   public static Object invokeMethod(Class clazz, Object obj, String methodName, Class[] argTypes, Object[] args) throws NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      Method m = getMethod(clazz, methodName, argTypes);
      return m.invoke(obj, args);
   }

   public static Object getObject(Object obj, String name) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
      return getObject(obj.getClass(), obj, name);
   }

   /** @deprecated */
   @Deprecated
   public static Object getObject(Object obj, Class clazz, String name) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
      return getObject(clazz, obj, name);
   }

   public static Object getObject(Class clazz, Object obj, String name) throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
      Field f = getField(clazz, name);
      f.setAccessible(true);
      return f.get(obj);
   }

   public static Object invokeConstructor(Class clazz, Object... args) throws NoSuchMethodException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      Class[] argTypes = new Class[args.length];

      for(int i = 0; i < args.length; ++i) {
         argTypes[i] = args[i].getClass();
      }

      return invokeConstructor(clazz, argTypes, args);
   }

   public static Object invokeConstructor(Class clazz, Class[] argTypes, Object[] args) throws NoSuchMethodException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
      Constructor con = getConstructor(clazz, argTypes);
      return con.newInstance(args);
   }

   public static void printMethodsInClass(Class clazz) {
      System.out.println("Methods in " + clazz.getName() + ":");
      Method[] var1 = clazz.getDeclaredMethods();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         Method m = var1[var3];
         StringBuilder print = new StringBuilder(128);
         print.append(getModifiers(m.getModifiers())).append(" ");
         print.append(m.getReturnType().getName()).append(" ");
         print.append(m.getName()).append("(");
         Class[] parameterTypes = m.getParameterTypes();
         int parameterTypesLength = parameterTypes.length;

         for(int i = 0; i < parameterTypesLength; ++i) {
            print.append(parameterTypes[i].getName());
            if (i != parameterTypesLength - 1) {
               print.append(", ");
            }
         }

         print.append(")");
         System.out.println(print.toString().trim());
      }

   }

   public static void printFieldsInClass(Class clazz) {
      System.out.println("Fields in " + clazz.getName() + ":");
      Field[] var1 = clazz.getDeclaredFields();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         Field f = var1[var3];
         String print = getModifiers(f.getModifiers()) + " " + f.getType().getName() + " " + f.getName();
         System.out.println(print.trim());
      }

   }

   private static String getModifiers(int modifiers) {
      StringJoiner modifiersStr = new StringJoiner(" ");
      if (Modifier.isPrivate(modifiers)) {
         modifiersStr.add("private");
      }

      if (Modifier.isProtected(modifiers)) {
         modifiersStr.add("protected");
      }

      if (Modifier.isPublic(modifiers)) {
         modifiersStr.add("public");
      }

      if (Modifier.isAbstract(modifiers)) {
         modifiersStr.add("abstract");
      }

      if (Modifier.isStatic(modifiers)) {
         modifiersStr.add("static");
      }

      if (Modifier.isFinal(modifiers)) {
         modifiersStr.add("final");
      }

      if (Modifier.isTransient(modifiers)) {
         modifiersStr.add("transient");
      }

      if (Modifier.isVolatile(modifiers)) {
         modifiersStr.add("volatile");
      }

      if (Modifier.isNative(modifiers)) {
         modifiersStr.add("native");
      }

      if (Modifier.isStrict(modifiers)) {
         modifiersStr.add("strictfp");
      }

      if (Modifier.isSynchronized(modifiers)) {
         modifiersStr.add("synchronized");
      }

      if (Modifier.isInterface(modifiers)) {
         modifiersStr.add("interface");
      }

      return modifiersStr.toString().trim();
   }

   @Generated
   public static boolean isUseNewSpigotPackaging() {
      return useNewSpigotPackaging;
   }

   @Generated
   public static int getMajorVersion() {
      return majorVersion;
   }

   @Generated
   public static int getMinorVersion() {
      return minorVersion;
   }

   static {
      try {
         Class bukkitClass = Class.forName("org.bukkit.Bukkit");
         Object serverObject = getMethod(bukkitClass, "getServer").invoke((Object)null);
         String serverPackageName = serverObject.getClass().getPackage().getName();
         SERVER_VERSION = serverPackageName.substring(serverPackageName.lastIndexOf(46) + 1);
         String version = Bukkit.getVersion();
         String[] parts = version.split(Pattern.quote("(MC: "));
         String[] versionParts = parts[1].split(Pattern.quote("."));
         String major;
         String minor;
         if (versionParts.length > 2) {
            major = versionParts[1];
            minor = versionParts[2].replace(")", "");
         } else {
            major = versionParts[1].replace(")", "");
            minor = "0";
         }

         majorVersion = Integer.parseInt(major);
         minorVersion = Integer.parseInt(minor);
         useNewSpigotPackaging = majorVersion >= 17;
      } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | ClassNotFoundException var8) {
         Challenges.getInstance().getLogger().error("Failed to initialize the ReflectionUtil:", new Object[]{var8});
      }

   }
}
