package net.codingarea.challenges.plugin.utils.bukkit.jumpgeneration;

import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import net.anweisen.utilities.common.collection.IRandom;
import org.bukkit.block.Block;

@FunctionalInterface
public interface IJumpGenerator {
   @Nonnull
   @CheckReturnValue
   Block next(@Nonnull IRandom var1, @Nonnull Block var2, boolean var3, boolean var4);
}
