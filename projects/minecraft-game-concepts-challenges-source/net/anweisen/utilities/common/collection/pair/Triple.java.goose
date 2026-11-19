// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/pair/Triple.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/pair/Triple.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/common/collection/pair/Triple.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.common.collection.pair;
//
// import java.util.Objects;
// import java.util.function.Function;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
//
// public class Triple implements Pair {
//    protected Object first;
//    protected Object second;
//    protected Object third;
//
//    public Triple() {
//    }
//
//    public Triple(@Nullable Object first, @Nullable Object second, @Nullable Object third) {
//       this.first = first;
//       this.second = second;
//       this.third = third;
//    }
//
//    public final int amount() {
//       return 3;
//    }
//
//    @Nonnull
//    public final Object[] values() {
//       return new Object[]{this.first, this.second, this.third};
//    }
//
//    public Object getFirst() {
//       return this.first;
//    }
//
//    public Object getSecond() {
//       return this.second;
//    }
//
//    public Object getThird() {
//       return this.third;
//    }
//
//    public void setFirst(@Nullable Object first) {
//       this.first = first;
//    }
//
//    public void setSecond(@Nullable Object second) {
//       this.second = second;
//    }
//
//    public void setThird(@Nullable Object third) {
//       this.third = third;
//    }
//
//    @Nonnull
//    @CheckReturnValue
//    public Triple map(@Nonnull Function firstMapper, @Nonnull Function secondMapper, @Nonnull Function thirdMapper) {
//       return of(firstMapper.apply(this.first), secondMapper.apply(this.second), thirdMapper.apply(this.third));
//    }
//
//    public boolean noneNull() {
//       return this.first != null && this.second != null && this.third != null;
//    }
//
//    public boolean allNull() {
//       return this.first == null && this.second == null && this.third == null;
//    }
//
//    public boolean equals(Object o) {
//       if (this == o) {
//          return true;
//       } else if (o != null && this.getClass() == o.getClass()) {
//          Triple triple = (Triple)o;
//          return Objects.equals(this.first, triple.first) && Objects.equals(this.second, triple.second) && Objects.equals(this.third, triple.third);
//       } else {
//          return false;
//       }
//    }
//
//    public int hashCode() {
//       return Objects.hash(new Object[]{this.first, this.second, this.third});
//    }
//
//    public String toString() {
//       return "Triple[" + this.first + ", " + this.second + ", " + this.third + "]";
//    }
//
//    @Nonnull
//    public static Triple ofFirst(@Nullable Object first) {
//       return of(first, (Object)null, (Object)null);
//    }
//
//    @Nonnull
//    public static Triple ofSecond(@Nullable Object second) {
//       return of((Object)null, second, (Object)null);
//    }
//
//    @Nonnull
//    public static Triple ofThird(@Nullable Object third) {
//       return of((Object)null, (Object)null, third);
//    }
//
//    @Nonnull
//    public static Triple of(@Nullable Object first, @Nullable Object second, @Nullable Object third) {
//       return new Triple(first, second, third);
//    }
//
//    @Nonnull
//    public static Triple empty() {
//       return new Triple();
//    }
// }
//
