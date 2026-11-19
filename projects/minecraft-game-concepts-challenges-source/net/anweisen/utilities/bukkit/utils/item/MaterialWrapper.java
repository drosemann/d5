package net.anweisen.utilities.bukkit.utils.item;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.misc.ReflectionUtils;
import org.bukkit.Material;

public final class MaterialWrapper {
   public static final Material GREEN_DYE = getMaterialByNames("CACTUS_GREEN", "GREEN_DYE");
   public static final Material RED_DYE = getMaterialByNames("ROSE_RED", "RED_DYE");
   public static final Material YELLOW_DYE = getMaterialByNames("DANDELION_YELLOW", "YELLOW_DYE");
   public static final Material SIGN = getMaterialByNames("SIGN", "OAK_SIGN");

   private MaterialWrapper() {
   }

   @Nonnull
   private static Material getMaterialByNames(@Nonnull String... names) {
      return (Material)ReflectionUtils.getFirstEnumByNames(Material.class, names);
   }
}
