package me.jinky.checks;

import me.jinky.logger.User;
import org.bukkit.event.Event;

public abstract class Check {
   public abstract String getName();

   public abstract String getEventCall();

   public abstract CheckResult performCheck(User var1, Event var2);

   public CheckResult performCheck(User u) {
      return this.performCheck(u, (Event)null);
   }

   public String getSecondaryEventCall() {
      return "";
   }
}
