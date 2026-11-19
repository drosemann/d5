package net.codingarea.challenges.plugin.management.scheduler.policy;

import java.util.function.BiPredicate;
import javax.annotation.Nonnull;
import org.bukkit.Bukkit;

public enum PlayerCountPolicy implements IPolicy {
   ALWAYS((online, max) -> {
      return true;
   }),
   EMPTY((online, max) -> {
      return online == 0;
   }),
   SOMEONE((online, max) -> {
      return online > 0;
   }),
   FULL(Integer::equals);

   private final BiPredicate check;

   private PlayerCountPolicy(@Nonnull BiPredicate check) {
      this.check = check;
   }

   public boolean check(@Nonnull Object holder) {
      return this.check.test(Bukkit.getOnlinePlayers().size(), Bukkit.getMaxPlayers());
   }

   // $FF: synthetic method
   private static PlayerCountPolicy[] $values() {
      return new PlayerCountPolicy[]{ALWAYS, EMPTY, SOMEONE, FULL};
   }
}
