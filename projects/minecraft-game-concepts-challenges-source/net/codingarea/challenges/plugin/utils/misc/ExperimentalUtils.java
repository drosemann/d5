package net.codingarea.challenges.plugin.utils.misc;

import java.util.LinkedList;
import java.util.List;
import net.codingarea.challenges.plugin.Challenges;
import org.bukkit.Material;
import org.bukkit.World.Environment;
import org.bukkit.entity.EntityType;

public class ExperimentalUtils {
   private static Material[] materials;
   private static EntityType[] entityTypes;

   public static Material[] getMaterials() {
      if (materials == null) {
         loadMaterials();
      }

      return materials;
   }

   private static void loadMaterials() {
      List materials = new LinkedList();
      Material[] var1 = Material.values();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         Material material = var1[var3];

         try {
            if (!material.isEnabledByFeature(Challenges.getInstance().getGameWorldStorage().getWorld(Environment.NORMAL))) {
               continue;
            }
         } catch (NoSuchMethodError var6) {
         }

         materials.add(material);
      }

      ExperimentalUtils.materials = (Material[])materials.toArray(new Material[0]);
   }

   public static EntityType[] getEntityTypes() {
      if (entityTypes == null) {
         loadEntityTypes();
      }

      return entityTypes;
   }

   private static void loadEntityTypes() {
      List entityTypes = new LinkedList();
      EntityType[] var1 = EntityType.values();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         EntityType type = var1[var3];

         try {
            if (!type.isEnabledByFeature(Challenges.getInstance().getGameWorldStorage().getWorld(Environment.NORMAL))) {
               continue;
            }
         } catch (IllegalArgumentException | NoSuchMethodError var6) {
         }

         entityTypes.add(type);
      }

      ExperimentalUtils.entityTypes = (EntityType[])entityTypes.toArray(new EntityType[0]);
   }
}
