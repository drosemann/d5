package net.codingarea.challenges.plugin.management.cloud;

import java.util.UUID;
import javax.annotation.Nonnull;
import org.bukkit.entity.Player;

public interface CloudSupport {
   @Nonnull
   String getColoredName(@Nonnull Player var1);

   @Nonnull
   String getColoredName(@Nonnull UUID var1);

   boolean hasNameFor(@Nonnull UUID var1);

   void setIngame();

   void setLobby();

   void startNewService();
}
