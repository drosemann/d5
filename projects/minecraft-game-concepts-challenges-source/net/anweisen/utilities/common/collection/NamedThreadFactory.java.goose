// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NamedThreadFactory.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NamedThreadFactory.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/NamedThreadFactory.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.util.concurrent.ThreadFactory;
// import java.util.concurrent.atomic.AtomicInteger;
// import java.util.function.IntFunction;
// import javax.annotation.Nonnull;
//
// public class NamedThreadFactory implements ThreadFactory {
//    private static final AtomicInteger poolNumber = new AtomicInteger(1);
//    protected final int id;
//    protected final IntFunction nameFunction;
//    protected final ThreadGroup group;
//    protected final AtomicInteger threadNumber;
//
//    public NamedThreadFactory(@Nonnull IntFunction nameFunction) {
//       this.id = poolNumber.getAndIncrement();
//       this.threadNumber = new AtomicInteger(1);
//       SecurityManager securityManager = System.getSecurityManager();
//       this.group = securityManager != null ? securityManager.getThreadGroup() : Thread.currentThread().getThreadGroup();
//       this.nameFunction = nameFunction;
//    }
//
//    public NamedThreadFactory(@Nonnull String prefix) {
//       this((id) -> {
//          return prefix + "-" + id;
//       });
//    }
//
//    public Thread newThread(@Nonnull Runnable task) {
//       Thread thread = new Thread(this.group, task, (String)this.nameFunction.apply(this.threadNumber.getAndIncrement()));
//       if (thread.isDaemon()) {
//          thread.setDaemon(false);
//       }
//
//       if (thread.getPriority() != 5) {
//          thread.setPriority(5);
//       }
//
//       return thread;
//    }
// }
//
