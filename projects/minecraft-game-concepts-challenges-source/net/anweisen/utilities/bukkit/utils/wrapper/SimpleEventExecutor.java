package net.anweisen.utilities.bukkit.utils.wrapper;

import java.util.function.Consumer;
import javax.annotation.Nonnull;
import org.bukkit.event.Event;
import org.bukkit.event.EventException;
import org.bukkit.event.Listener;
import org.bukkit.plugin.EventExecutor;

public class SimpleEventExecutor implements EventExecutor {
   private final Class classOfEvent;
   private final Consumer action;

   public SimpleEventExecutor(@Nonnull Class classOfEvent, @Nonnull Consumer action) {
      this.classOfEvent = classOfEvent;
      this.action = action;
   }

   public void execute(@Nonnull Listener listener, @Nonnull Event event) throws EventException {
      if (this.classOfEvent.isAssignableFrom(event.getClass())) {
         try {
            this.action.accept(event);
         } catch (Throwable var4) {
            throw new EventException(var4);
         }
      }
   }
}
