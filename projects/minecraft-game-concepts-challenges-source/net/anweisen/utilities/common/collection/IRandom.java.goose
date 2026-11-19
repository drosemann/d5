// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IRandom.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IRandom.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/IRandom.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.security.SecureRandom;
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.Collections;
// import java.util.List;
// import java.util.Random;
// import java.util.concurrent.ThreadLocalRandom;
// import java.util.stream.DoubleStream;
// import java.util.stream.IntStream;
// import java.util.stream.LongStream;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnegative;
// import javax.annotation.Nonnull;
//
// public interface IRandom {
//    @Nonnull
//    @CheckReturnValue
//    static IRandom create() {
//       return new SeededRandomWrapper();
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static IRandom create(long seed) {
//       return new SeededRandomWrapper(seed);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static IRandom wrap(@Nonnull Random random) {
//       return new RandomWrapper(random);
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static IRandom threadLocal() {
//       return wrap(ThreadLocalRandom.current());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static IRandom secure() {
//       return wrap(new SecureRandom());
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    static IRandom singleton() {
//       return SingletonRandom.INSTANCE;
//    }
//
//    long getSeed();
//
//    void setSeed(long var1);
//
//    void nextBytes(@Nonnull byte[] var1);
//
//    boolean nextBoolean();
//
//    int nextInt();
//
//    int nextInt(int var1);
//
//    @Nonnull
//    @CheckReturnValue
//    IntStream ints();
//
//    @Nonnull
//    @CheckReturnValue
//    IntStream ints(@Nonnegative long var1);
//
//    @Nonnull
//    @CheckReturnValue
//    IntStream ints(int var1, int var2);
//
//    @Nonnull
//    @CheckReturnValue
//    IntStream ints(@Nonnegative long var1, int var3, int var4);
//
//    @Nonnull
//    @CheckReturnValue
//    LongStream longs();
//
//    long nextLong();
//
//    @Nonnull
//    @CheckReturnValue
//    LongStream longs(@Nonnegative long var1);
//
//    @Nonnull
//    @CheckReturnValue
//    LongStream longs(long var1, long var3);
//
//    @Nonnull
//    @CheckReturnValue
//    LongStream longs(@Nonnegative long var1, long var3, long var5);
//
//    double nextDouble();
//
//    double nextGaussian();
//
//    @Nonnull
//    @CheckReturnValue
//    DoubleStream doubles();
//
//    @Nonnull
//    @CheckReturnValue
//    DoubleStream doubles(@Nonnegative long var1);
//
//    @Nonnull
//    @CheckReturnValue
//    DoubleStream doubles(double var1, double var3);
//
//    @Nonnull
//    @CheckReturnValue
//    DoubleStream doubles(@Nonnegative long var1, double var3, double var5);
//
//    float nextFloat();
//
//    default Object choose(@Nonnull Object... array) {
//       return array[this.nextInt(array.length)];
//    }
//
//    default Object choose(@Nonnull List list) {
//       return list.get(this.nextInt(list.size()));
//    }
//
//    default Object choose(@Nonnull Collection collection) {
//       return this.choose((List)(new ArrayList(collection)));
//    }
//
//    default void shuffle(@Nonnull List list) {
//       Collections.shuffle(list, this.asRandom());
//    }
//
//    default int around(int value, @Nonnegative int range) {
//       return this.range(value - range, value + range);
//    }
//
//    default int range(int min, int max) {
//       if (min >= max) {
//          throw new IllegalArgumentException("min >= max");
//       } else {
//          return this.nextInt(max - min) + min;
//       }
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    default Random asRandom() {
//       if (!(this instanceof Random)) {
//          throw new IllegalStateException(this.getClass().getName() + " cannot be converted a java.util.Random");
//       } else {
//          return (Random)this;
//       }
//    }
// }
//
