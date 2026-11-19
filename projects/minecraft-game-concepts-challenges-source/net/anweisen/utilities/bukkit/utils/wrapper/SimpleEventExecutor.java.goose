// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/SimpleEventExecutor.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/SimpleEventExecutor.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/wrapper/SimpleEventExecutor.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.wrapper;
//
// import java.util.function.Consumer;
// import javax.annotation.Nonnull;
// import org.bukkit.event.Event;
// import org.bukkit.event.EventException;
// import org.bukkit.event.Listener;
// import org.bukkit.plugin.EventExecutor;
//
// public class SimpleEventExecutor implements EventExecutor {
//    private final Class classOfEvent;
//    private final Consumer action;
//
//    public SimpleEventExecutor(@Nonnull Class classOfEvent, @Nonnull Consumer action) {
//       this.classOfEvent = classOfEvent;
//       this.action = action;
//    }
//
//    public void execute(@Nonnull Listener listener, @Nonnull Event event) throws EventException {
//       if (this.classOfEvent.isAssignableFrom(event.getClass())) {
//          try {
//             this.action.accept(event);
//          } catch (Throwable var4) {
//             throw new EventException(var4);
//          }
//       }
//    }
// }
//
