package net.codingarea.challenges.plugin.management.challenges.entities;

import javax.annotation.Nonnull;
import net.anweisen.utilities.common.config.Document;

public interface GamestateSaveable {
   String getUniqueGamestateName();

   void writeGameState(@Nonnull Document var1);

   void loadGameState(@Nonnull Document var1);
}
