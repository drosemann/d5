// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RandomWrapper.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RandomWrapper.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/RandomWrapper.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection;
//
// import java.util.Random;
// import java.util.stream.DoubleStream;
// import java.util.stream.IntStream;
// import java.util.stream.LongStream;
// import javax.annotation.Nonnull;
//
// public class RandomWrapper implements IRandom {
//    private final Random random;
//
//    public RandomWrapper(@Nonnull Random random) {
//       this.random = random;
//    }
//
//    public long getSeed() {
//       throw new UnsupportedOperationException("Random.getSeed()");
//    }
//
//    public void setSeed(long seed) {
//       this.random.setSeed(seed);
//    }
//
//    public void nextBytes(@Nonnull byte[] bytes) {
//       this.random.nextBytes(bytes);
//    }
//
//    public boolean nextBoolean() {
//       return this.random.nextBoolean();
//    }
//
//    public int nextInt() {
//       return this.random.nextInt();
//    }
//
//    public int nextInt(int bound) {
//       return this.random.nextInt(bound);
//    }
//
//    @Nonnull
//    public IntStream ints() {
//       return this.random.ints();
//    }
//
//    @Nonnull
//    public IntStream ints(long streamSize) {
//       return this.random.ints(streamSize);
//    }
//
//    @Nonnull
//    public IntStream ints(int randomNumberOrigin, int randomNumberBound) {
//       return this.random.ints(randomNumberOrigin, randomNumberBound);
//    }
//
//    @Nonnull
//    public IntStream ints(long streamSize, int randomNumberOrigin, int randomNumberBound) {
//       return this.random.ints(streamSize, randomNumberOrigin, randomNumberBound);
//    }
//
//    @Nonnull
//    public LongStream longs() {
//       return this.random.longs();
//    }
//
//    public long nextLong() {
//       return this.random.nextLong();
//    }
//
//    @Nonnull
//    public LongStream longs(long streamSize) {
//       return this.random.longs(streamSize);
//    }
//
//    @Nonnull
//    public LongStream longs(long randomNumberOrigin, long randomNumberBound) {
//       return this.random.longs(randomNumberOrigin, randomNumberBound);
//    }
//
//    @Nonnull
//    public LongStream longs(long streamSize, long randomNumberOrigin, long randomNumberBound) {
//       return this.random.longs(streamSize, randomNumberOrigin, randomNumberBound);
//    }
//
//    public double nextDouble() {
//       return this.random.nextDouble();
//    }
//
//    public double nextGaussian() {
//       return this.random.nextGaussian();
//    }
//
//    @Nonnull
//    public DoubleStream doubles() {
//       return this.random.doubles();
//    }
//
//    @Nonnull
//    public DoubleStream doubles(long streamSize) {
//       return this.random.doubles(streamSize);
//    }
//
//    @Nonnull
//    public DoubleStream doubles(double randomNumberOrigin, double randomNumberBound) {
//       return this.random.doubles(randomNumberOrigin, randomNumberBound);
//    }
//
//    @Nonnull
//    public DoubleStream doubles(long streamSize, double randomNumberOrigin, double randomNumberBound) {
//       return this.random.doubles(streamSize, randomNumberOrigin, randomNumberBound);
//    }
//
//    public float nextFloat() {
//       return this.random.nextFloat();
//    }
//
//    @Nonnull
//    public Random asRandom() {
//       return this.random;
//    }
//
//    public String toString() {
//       return "Random[wrapped=" + this.random.getClass().getSimpleName() + "]";
//    }
// }
//
