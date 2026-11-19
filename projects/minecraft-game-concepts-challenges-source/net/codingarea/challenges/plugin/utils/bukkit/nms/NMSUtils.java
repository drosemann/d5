package net.codingarea.challenges.plugin.utils.bukkit.nms;

import net.codingarea.challenges.plugin.Challenges;
import net.md_5.bungee.api.chat.BaseComponent;
import net.md_5.bungee.chat.ComponentSerializer;
import org.bukkit.boss.BossBar;
import org.bukkit.entity.Entity;

public final class NMSUtils {
   public static void setEntityName(Entity entity, BaseComponent baseComponent) {
      String json = ComponentSerializer.toString(baseComponent);

      try {
         Class componentClass = getClass("network.chat.IChatBaseComponent");
         Class componentSerializerClass = getClass("network.chat.IChatBaseComponent$ChatSerializer");
         Object componentObject = ReflectionUtil.invokeMethod(componentSerializerClass, (Object)null, "a", new Class[]{String.class}, new Object[]{json});
         Class entityClass = getClass("world.entity.Entity");
         Class craftEntityClass = ReflectionUtil.getBukkitClass("entity.CraftEntity");
         Object entityObject = ReflectionUtil.invokeMethod((Class)craftEntityClass, (Object)entity, (String)"getHandle");
         ReflectionUtil.invokeMethod(entityClass, entityObject, "a", new Class[]{componentClass}, new Object[]{componentObject});
      } catch (Exception var9) {
         Challenges.getInstance().getLogger().error("", new Object[]{var9});
      }

   }

   public static void setBossBarTitle(BossBar bossBar, BaseComponent baseComponent) {
      Object component = toIChatBaseComponent(baseComponent);

      try {
         Class bossBattleClass = getClass("world.BossBattle");
         Class craftBossBarClass = ReflectionUtil.getBukkitClass("boss.CraftBossBar");
         Object bossBattleObject = ReflectionUtil.invokeMethod((Class)craftBossBarClass, (Object)bossBar, (String)"getHandle");
         ReflectionUtil.invokeMethod(bossBattleClass, bossBattleObject, "a", new Class[]{getComponentClass()}, new Object[]{component});
      } catch (Exception var6) {
         Challenges.getInstance().getLogger().error("", new Object[]{var6});
      }

   }

   public static Object toIChatBaseComponent(BaseComponent baseComponent) {
      String json = ComponentSerializer.toString(baseComponent);

      try {
         Class componentSerializerClass = getClass("network.chat.IChatBaseComponent$ChatSerializer");
         return ReflectionUtil.invokeMethod(componentSerializerClass, (Object)null, "a", new Class[]{String.class}, new Object[]{json});
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("", new Object[]{var3});
         return null;
      }
   }

   public static Class getComponentClass() {
      return getClass("network.chat.IChatBaseComponent");
   }

   public static Class getClass(String path) {
      try {
         if (ReflectionUtil.isUseNewSpigotPackaging()) {
            return ReflectionUtil.getMinecraftClass(path);
         } else {
            String[] split = path.split("\\.");
            String className = split.length == 1 ? path : split[split.length - 1];
            return ReflectionUtil.getNmsClass(className);
         }
      } catch (Exception var3) {
         Challenges.getInstance().getLogger().error("", new Object[]{var3});
         return null;
      }
   }
}
