package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.common.collection.IRandom;
import net.codingarea.challenges.plugin.challenges.custom.settings.FallbackNames;
import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
import net.codingarea.challenges.plugin.management.challenges.annotations.RequireVersion;
import org.bukkit.Bukkit;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.StructureType;
import org.bukkit.entity.Entity;

@RequireVersion(MinecraftVersion.V1_19)
@FallbackNames({"place_random_structure"})
public class PlaceStructureAction extends EntityTargetAction {
   private List structureKeys;
   private List villageKeys;

   public PlaceStructureAction(String name) {
      super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false, true).addChild(SubSettingsHelper.createStructureSettingsBuilder()));
   }

   public Material getMaterial() {
      return Material.STRUCTURE_BLOCK;
   }

   public void executeFor(Entity entity, Map subActions) {
      String structureString = ((String[])subActions.get("structure"))[0];
      NamespacedKey structureKey;
      if (structureString.equals("random_structure")) {
         if (this.structureKeys == null) {
            this.reloadStructureKeys();
         }

         structureKey = (NamespacedKey)this.structureKeys.get(IRandom.singleton().nextInt(this.structureKeys.size()));
         if (structureKey == StructureType.VILLAGE.getKey()) {
            structureKey = (NamespacedKey)this.villageKeys.get(IRandom.singleton().nextInt(this.villageKeys.size()));
         }
      } else {
         StructureType structureType = (StructureType)StructureType.getStructureTypes().get(structureString);
         structureKey = this.getStructureKey(structureType);
      }

      Location location = entity.getLocation();
      String locationString = (int)location.getX() + " " + (int)location.getY() + " " + (int)location.getZ();
      String command = String.format("minecraft:place structure %s %s", structureKey, locationString);
      Bukkit.dispatchCommand(Bukkit.getConsoleSender(), command);
   }

   private void reloadStructureKeys() {
      this.structureKeys = (List)StructureType.getStructureTypes().values().stream().map(StructureType::getKey).collect(Collectors.toList());
      this.structureKeys.remove(StructureType.OCEAN_RUIN.getKey());
      this.structureKeys.add(NamespacedKey.minecraft("ocean_ruin_cold"));
      this.structureKeys.add(NamespacedKey.minecraft("ocean_ruin_warm"));
      this.villageKeys = new ArrayList();
      this.villageKeys.add(NamespacedKey.minecraft("village_desert"));
      this.villageKeys.add(NamespacedKey.minecraft("village_plains"));
      this.villageKeys.add(NamespacedKey.minecraft("village_savanna"));
      this.villageKeys.add(NamespacedKey.minecraft("village_snowy"));
      this.villageKeys.add(NamespacedKey.minecraft("village_taiga"));
   }

   private NamespacedKey getStructureKey(StructureType structureType) {
      if (structureType == StructureType.OCEAN_RUIN) {
         List oceanRuins = Arrays.asList(NamespacedKey.minecraft("ocean_ruin_cold"), NamespacedKey.minecraft("ocean_ruin_warm"));
         return (NamespacedKey)oceanRuins.get(IRandom.singleton().nextInt(oceanRuins.size()));
      } else {
         return structureType == StructureType.VILLAGE ? (NamespacedKey)this.villageKeys.get(IRandom.singleton().nextInt(this.villageKeys.size())) : structureType.getKey();
      }
   }
}
