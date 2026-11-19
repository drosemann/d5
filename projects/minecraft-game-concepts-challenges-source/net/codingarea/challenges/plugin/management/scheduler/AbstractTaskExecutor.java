package net.codingarea.challenges.plugin.management.scheduler;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.logging.Logger;

public abstract class AbstractTaskExecutor implements Runnable {
   protected final List functions = new ArrayList(1);

   public void run() {
      Iterator var1 = this.functions.iterator();

      while(var1.hasNext()) {
         ScheduledFunction function = (ScheduledFunction)var1.next();

         try {
            function.invoke();
         } catch (IllegalAccessException | InvocationTargetException var4) {
            Logger.error("An exception occurred while executing {}", function, var4);
         }
      }

   }

   @Nonnull
   public abstract AbstractTaskConfig getConfig();

   public void register(@Nonnull ScheduledFunction function) {
      this.functions.add(function);
   }

   public void unregister(@Nonnull Object holder) {
      this.functions.removeIf((function) -> {
         return function.getHolder() == holder;
      });
   }
}
