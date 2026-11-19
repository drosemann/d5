package net.anweisen.utilities.common.concurrent.task;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.CompletionStage;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.function.Function;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import net.anweisen.utilities.common.collection.NamedThreadFactory;

public class CompletableTask implements Task {
   static final ExecutorService SERVICE = Executors.newCachedThreadPool(new NamedThreadFactory("TaskProcessor"));
   private final Collection listeners;
   private final CompletableFuture future;
   private Throwable failure;

   public CompletableTask() {
      this(new CompletableFuture());
   }

   private CompletableTask(@Nonnull CompletableFuture future) {
      this.listeners = new ArrayList();
      this.future = future;
      this.future.exceptionally((ex) -> {
         this.failure = ex;
         return null;
      });
   }

   @Nonnull
   public static Task callAsync(@Nonnull Callable callable) {
      CompletableTask task = new CompletableTask();
      SERVICE.execute(() -> {
         try {
            task.complete(callable.call());
         } catch (Throwable var3) {
            task.fail(var3);
         }

      });
      return task;
   }

   @Nonnull
   public static Task callSync(@Nonnull Callable callable) {
      CompletableTask task = new CompletableTask();

      try {
         task.complete(callable.call());
      } catch (Throwable var3) {
         task.fail(var3);
      }

      return task;
   }

   @Nonnull
   public Task addListener(@Nonnull TaskListener listener) {
      if (!this.future.isDone()) {
         this.listeners.add(listener);
         return this;
      } else {
         Object value = this.future.getNow((Object)null);
         if (!this.future.isCancelled() && value == null) {
            if (this.failure != null) {
               listener.onFailure(this, this.failure);
            } else {
               listener.onComplete(this, value);
            }
         } else {
            listener.onCancelled(this);
         }

         return this;
      }
   }

   @Nonnull
   public Task clearListeners() {
      this.listeners.clear();
      return this;
   }

   public void fail(Throwable throwable) {
      this.failure = throwable;
      this.future.completeExceptionally(throwable);
      Iterator var2 = this.listeners.iterator();

      while(var2.hasNext()) {
         TaskListener listener = (TaskListener)var2.next();
         listener.onFailure(this, throwable);
      }

   }

   public Object call() {
      if (this.future.isDone()) {
         return this.future.getNow((Object)null);
      } else {
         throw new UnsupportedOperationException("Use #complete in the CompletableTask");
      }
   }

   public void complete(@Nullable Object value) {
      this.future.complete(value);
      Iterator var2;
      TaskListener listener;
      if (value != null) {
         var2 = this.listeners.iterator();

         while(var2.hasNext()) {
            listener = (TaskListener)var2.next();
            listener.onComplete(this, value);
         }
      } else {
         var2 = this.listeners.iterator();

         while(var2.hasNext()) {
            listener = (TaskListener)var2.next();
            listener.onCancelled(this);
         }
      }

   }

   public boolean cancel(boolean b) {
      if (this.future.isCancelled()) {
         return false;
      } else if (!this.future.cancel(b)) {
         return false;
      } else {
         Iterator var2 = this.listeners.iterator();

         while(var2.hasNext()) {
            TaskListener listener = (TaskListener)var2.next();
            listener.onCancelled(this);
         }

         return true;
      }
   }

   public boolean isCancelled() {
      return this.future.isCancelled();
   }

   public boolean isDone() {
      return this.future.isDone();
   }

   public Object get() throws InterruptedException, ExecutionException {
      return this.future.get();
   }

   public Object get(long timeout, @Nonnull TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException {
      return this.future.get(timeout, unit);
   }

   @Nonnull
   public Task map(@Nullable Function mapper) {
      CompletableTask task = new CompletableTask();
      this.future.thenAccept((v) -> {
         try {
            task.complete(mapper == null ? null : mapper.apply(v));
         } catch (Throwable var4) {
            task.fail(var4);
         }

      });
      CompletableFuture var10001 = task.future;
      this.onFailure(var10001::completeExceptionally);
      this.onCancelled((otherTask) -> {
         task.cancel(true);
      });
      return task;
   }

   @Nonnull
   public CompletionStage stage() {
      return this.future;
   }
}
