package net.codingarea.challenges.plugin.management.server;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.config.Document;
import net.codingarea.challenges.plugin.Challenges;
import net.codingarea.challenges.plugin.management.challenges.entities.GamestateSaveable;
import org.bukkit.Location;
import org.bukkit.entity.Player;
import org.jetbrains.annotations.NotNull;

public class GeneratorWorldPortalManager implements GamestateSaveable {
   public Map lastWorldLocations = new HashMap();

   public GeneratorWorldPortalManager() {
      Challenges.getInstance().getChallengeManager().registerGameStateSaver(this);
   }

   @Nullable
   public Location getAndRemoveLastWorld(@Nonnull Player player) {
      return (Location)this.lastWorldLocations.remove(player.getUniqueId());
   }

   public void setLastLocation(@Nonnull Player player, @Nonnull Location location) {
      this.lastWorldLocations.put(player.getUniqueId(), location);
   }

   public boolean isCustomWorld(@Nonnull String name) {
      return Challenges.getInstance().getGameWorldStorage().getCustomGeneratedGameWorlds().contains(name);
   }

   public String getUniqueGamestateName() {
      return this.getClass().getSimpleName().toLowerCase();
   }

   public void writeGameState(@NotNull Document document) {
      Iterator var2 = this.lastWorldLocations.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         UUID uuid = (UUID)entry.getKey();
         Location location = (Location)entry.getValue();
         document.set(uuid.toString(), location);
      }

   }

   public void loadGameState(@NotNull Document document) {
      Iterator var2 = document.keys().iterator();

      while(var2.hasNext()) {
         String key = (String)var2.next();

         try {
            Location location = (Location)document.getInstance(key, Location.class);
            UUID uuid = UUID.fromString(key);
            this.lastWorldLocations.put(uuid, location);
         } catch (Exception var6) {
            Challenges.getInstance().getLogger().error("Couldn't load last location of: " + key, new Object[0]);
            Challenges.getInstance().getLogger().error("", new Object[]{var6});
         }
      }

   }
}
