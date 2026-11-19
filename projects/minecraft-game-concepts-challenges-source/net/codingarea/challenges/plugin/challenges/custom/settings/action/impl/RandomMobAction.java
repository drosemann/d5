package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import lombok.Generated;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.ChallengeAction;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import org.bukkit.Material;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;

public class RandomMobAction extends EntityTargetAction {
   private static final EntityType[] spawnableMobs;
   private static final EntityType[] livingMobs;

   public RandomMobAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false));
   }

   public void executeFor(Entity entity, Map subActions) {
      if (entity.getLocation().getWorld() != null) {
         EntityType value = (EntityType)ChallengeAction.random.choose((Object[])spawnableMobs);
         entity.getLocation().getWorld().spawnEntity(entity.getLocation(), value);
      }
   }

   public Material getMaterial() {
      return Material.BLAZE_SPAWN_EGG;
   }

   @Generated
   public static EntityType[] getSpawnableMobs() {
      return spawnableMobs;
   }

   @Generated
   public static EntityType[] getLivingMobs() {
      return livingMobs;
   }

   static {
      List list = new LinkedList(Arrays.asList(EntityType.values()));
      List list = (List)list.stream().filter(EntityType::isSpawnable).collect(Collectors.toList());
      spawnableMobs = (EntityType[])list.toArray(new EntityType[0]);
      list = (List)list.stream().filter(EntityType::isAlive).collect(Collectors.toList());
      livingMobs = (EntityType[])list.toArray(new EntityType[0]);
   }
}
