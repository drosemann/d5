// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/ActionListener.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/ActionListener.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/ActionListener.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.wrapper;
//
// import java.util.Objects;
// import java.util.function.Consumer;
// import javax.annotation.Nonnull;
// import org.bukkit.event.EventPriority;
// import org.bukkit.event.Listener;
//
// public final class ActionListener implements Listener {
//    private final Class classOfEvent;
//    private final Consumer listener;
//    private final EventPriority priority;
//    private final boolean ignoreCancelled;
//
//    public ActionListener(@Nonnull Class classOfEvent, @Nonnull Consumer listener, @Nonnull EventPriority priority, boolean ignoreCancelled) {
//       this.classOfEvent = classOfEvent;
//       this.listener = listener;
//       this.priority = priority;
//       this.ignoreCancelled = ignoreCancelled;
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          ActionListener that = (ActionListener)o;
//          return this.listener.equals(that.listener);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.listener});
//    }
//
//    @Nonnull
//    public Consumer getListener() {
//       return this.listener;
//    }
//
//    @Nonnull
//    public EventPriority getPriority() {
//       return this.priority;
//    }
//
//    @Nonnull
//    public Class getClassOfEvent() {
//       return this.classOfEvent;
//    }
//
//    public boolean isIgnoreCancelled() {
//       return this.ignoreCancelled;
//    }
// }
//
