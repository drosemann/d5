// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/task/CompletedTask.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/task/CompletedTask.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/concurrent/task/CompletedTask.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.concurrent.task;
//
// import java.util.concurrent.CompletableFuture;
// import java.util.concurrent.CompletionStage;
// import java.util.concurrent.ExecutionException;
// import java.util.concurrent.TimeUnit;
// import java.util.concurrent.TimeoutException;
// import java.util.function.Function;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class CompletedTask implements Task {
//    private final Object value;
//    private final Throwable failure;
//    private CompletableFuture future;
//
//    public CompletedTask(@Nullable Object value) {
//       this.value = value;
//       this.failure = null;
//    }
//
//    public CompletedTask(@Nullable Throwable failure) {
//       this.value = null;
//       this.failure = failure;
//    }
//
//    @Nonnull
//    public Task addListener(@Nonnull TaskListener listener) {
//       if (this.failure != null) {
//          listener.onFailure(this, this.failure);
//       } else if (this.value != null) {
//          listener.onComplete(this, this.value);
//       } else {
//          listener.onCancelled(this);
//       }
//
//       return this;
//    }
//
//    @Nonnull
//    public Task clearListeners() {
//       return this;
//    }
//
//    @Nonnull
//    public Task map(@Nullable Function mapper) {
//       return this.failure != null ? new CompletedTask(this.failure) : new CompletedTask(this.value != null && mapper != null ? mapper.apply(this.value) : null);
//    }
//
//    public Object getOrDefault(long timeout, @Nonnull TimeUnit unit, Object def) {
//       return this.value != null ? this.value : def;
//    }
//
//    public Object call() throws Exception {
//       return this.value;
//    }
//
//    public boolean cancel(boolean mayInterruptIfRunning) {
//       return false;
//    }
//
//    public boolean isCancelled() {
//       return false;
//    }
//
//    public boolean isDone() {
//       return true;
//    }
//
//    public Object get() throws InterruptedException, ExecutionException {
//       return this.value;
//    }
//
//    public Object get(long timeout, @Nonnull TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
//       return this.value;
//    }
//
//    @Nonnull
//    public CompletionStage stage() {
//       if (this.future == null) {
//          this.future = new CompletableFuture();
//          if (this.failure != null) {
//             this.future.completeExceptionally(this.failure);
//          } else {
//             this.future.complete(this.value);
//          }
//       }
//
//       return this.future;
//    }
// }
//
