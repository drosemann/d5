package net.codingarea.challenges.plugin.management.stats;

import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import java.util.Map.Entry;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.logging.Logger;
import net.anweisen.utilities.common.config.Document;

public class PlayerStats {
   private final Map values = new EnumMap(Statistic.class);
   private final UUID uuid;
   private final String name;

   public PlayerStats(@Nonnull UUID uuid, @Nonnull String name, @Nonnull Document document) {
      this.uuid = uuid;
      this.name = name;
      Statistic[] var4 = Statistic.values();
      int var5 = var4.length;

      for(int var6 = 0; var6 < var5; ++var6) {
         Statistic statistic = var4[var6];
         this.values.put(statistic, document.getDouble(statistic.name()));
      }

   }

   public PlayerStats(@Nonnull UUID uuid, @Nonnull String name) {
      this.uuid = uuid;
      this.name = name;
   }

   public void incrementStatistic(@Nonnull Statistic statistic, double amount) {
      Logger.debug("Incrementing statistic {} by {} for {}", statistic, amount, this.name);
      double value = (Double)this.values.getOrDefault(statistic, 0.0D);
      this.values.put(statistic, value + amount);
   }

   @Nonnull
   public Document asDocument() {
      Document document = Document.create();
      Iterator var2 = this.values.entrySet().iterator();

      while(var2.hasNext()) {
         Entry entry = (Entry)var2.next();
         document.set(((Statistic)entry.getKey()).name(), entry.getValue());
      }

      return document;
   }

   public double getStatisticValue(@Nonnull Statistic statistic) {
      return (Double)this.values.getOrDefault(statistic, 0.0D);
   }

   @Nonnull
   public UUID getPlayerUUID() {
      return this.uuid;
   }

   @Nonnull
   public String getPlayerName() {
      return this.name;
   }

   public String toString() {
      return "PlayerStats" + this.values;
   }
}
