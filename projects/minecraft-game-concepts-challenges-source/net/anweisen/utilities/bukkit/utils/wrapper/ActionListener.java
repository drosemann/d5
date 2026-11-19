package net.anweisen.utilities.bukkit.utils.wrapper;

import java.util.Objects;
import java.util.function.Consumer;
import javax.annotation.Nonnull;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;

public final class ActionListener implements Listener {
   private final Class classOfEvent;
   private final Consumer listener;
   private final EventPriority priority;
   private final boolean ignoreCancelled;

   public ActionListener(@Nonnull Class classOfEvent, @Nonnull Consumer listener, @Nonnull EventPriority priority, boolean ignoreCancelled) {
      this.classOfEvent = classOfEvent;
      this.listener = listener;
      this.priority = priority;
      this.ignoreCancelled = ignoreCancelled;
   }

   public boolean equals(Object o) {
      if (this == o) {
         return true;
      } else if (o != null && this.getClass() == o.getClass()) {
         ActionListener that = (ActionListener)o;
         return this.listener.equals(that.listener);
      } else {
         return false;
      }
   }

   public int hashCode() {
      return Objects.hash(new Object[]{this.listener});
   }

   @Nonnull
   public Consumer getListener() {
      return this.listener;
   }

   @Nonnull
   public EventPriority getPriority() {
      return this.priority;
   }

   @Nonnull
   public Class getClassOfEvent() {
      return this.classOfEvent;
   }

   public boolean isIgnoreCancelled() {
      return this.ignoreCancelled;
   }
}
