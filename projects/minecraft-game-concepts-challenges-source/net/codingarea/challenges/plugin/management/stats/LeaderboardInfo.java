package net.codingarea.challenges.plugin.management.stats;

import java.util.EnumMap;
import java.util.Map;
import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;

public final class LeaderboardInfo {
   private final Map values = new EnumMap(Statistic.class);

   public void setPlace(@Nonnull Statistic statistic, @Nonnegative int place) {
      this.values.put(statistic, place);
   }

   public int getPlace(@Nonnull Statistic statistic) {
      return (Integer)this.values.getOrDefault(statistic, 1);
   }
}
