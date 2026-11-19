package net.codingarea.challenges.plugin.management.menu.generator.implementation.custom;

import java.util.LinkedHashMap;
import net.anweisen.utilities.bukkit.utils.misc.BukkitReflectionUtils;
import net.codingarea.challenges.plugin.challenges.custom.settings.SettingType;
import net.codingarea.challenges.plugin.management.menu.generator.ChooseItemGenerator;
import net.codingarea.challenges.plugin.utils.misc.ExperimentalUtils;
import net.codingarea.challenges.plugin.utils.misc.MapUtils;
import org.bukkit.Material;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

public class MaterialMenuGenerator extends ChooseItemGenerator {
   private final IParentCustomGenerator parent;

   public MaterialMenuGenerator(IParentCustomGenerator parent) {
      super(createMaterialsMap());
      this.parent = parent;
   }

   public static LinkedHashMap createMaterialsMap() {
      LinkedHashMap map = new LinkedHashMap();
      Material[] var1 = ExperimentalUtils.getMaterials();
      int var2 = var1.length;

      for(int var3 = 0; var3 < var2; ++var3) {
         Material material = var1[var3];
         if (!BukkitReflectionUtils.isAir(material) && material.isItem()) {
            map.put(material.name(), new ItemStack(material));
         }
      }

      return map;
   }

   public String[] getSubTitles(int page) {
      return new String[]{"Material"};
   }

   public void onItemClick(Player player, String itemKey) {
      this.parent.accept(player, SettingType.MATERIAL, MapUtils.createStringArrayMap("material", itemKey));
   }

   public void onBackToMenuItemClick(Player player) {
      this.parent.decline(player);
   }
}
