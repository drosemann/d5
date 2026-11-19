package net.anweisen.utilities.common.collection.pair;

import java.util.Objects;
import java.util.function.Function;
import javax.annotation.CheckReturnValue;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class Quadro implements Pair {
   protected Object first;
   protected Object second;
   protected Object third;
   protected Object fourth;

   public Quadro() {
   }

   public Quadro(@Nullable Object first, @Nullable Object second, @Nullable Object third, @Nullable Object fourth) {
      this.first = first;
      this.second = second;
      this.third = third;
      this.fourth = fourth;
   }

   public final int amount() {
      return 4;
   }

   @Nonnull
   public final Object[] values() {
      return new Object[]{this.first, this.second, this.third, this.first};
   }

   public Object getFirst() {
      return this.first;
   }

   public Object getSecond() {
      return this.second;
   }

   public Object getThird() {
      return this.third;
   }

   public Object getFourth() {
      return this.fourth;
   }

   public void setFirst(@Nullable Object first) {
      this.first = first;
   }

   public void setSecond(@Nullable Object second) {
      this.second = second;
   }

   public void setThird(@Nullable Object third) {
      this.third = third;
   }

   public void setFourth(@Nullable Object fourth) {
      this.fourth = fourth;
   }

   @Nonnull
   @CheckReturnValue
   public Quadro map(@Nonnull Function firstMapper, @Nonnull Function secondMapper, @Nonnull Function thirdMapper, @Nonnull Function fourthMapper) {
      return of(firstMapper.apply(this.first), secondMapper.apply(this.second), thirdMapper.apply(this.third), fourthMapper.apply(this.fourth));
   }

   public boolean noneNull() {
      return this.first != null && this.second != null && this.third != null && this.fourth != null;
   }

   public boolean allNull() {
      return this.first == null && this.second == null && this.third == null && this.fourth != null;
   }

   public boolean equals(Object o) {
      if (this == o) {
         return true;
      } else if (o != null && this.getClass() == o.getClass()) {
         Quadro quadro = (Quadro)o;
         return Objects.equals(this.first, quadro.first) && Objects.equals(this.second, quadro.second) && Objects.equals(this.third, quadro.third) && Objects.equals(this.fourth, quadro.fourth);
      } else {
         return false;
      }
   }

   public int hashCode() {
      return Objects.hash(new Object[]{this.first, this.second, this.third, this.fourth});
   }

   public String toString() {
      return "Quadro[" + this.first + ", " + this.second + ", " + this.third + ", " + this.fourth + "]";
   }

   @Nonnull
   public static Quadro ofFirst(@Nullable Object first) {
      return of(first, (Object)null, (Object)null, (Object)null);
   }

   @Nonnull
   public static Quadro ofSecond(@Nullable Object second) {
      return of((Object)null, second, (Object)null, (Object)null);
   }

   @Nonnull
   public static Quadro ofThird(@Nullable Object third) {
      return of((Object)null, (Object)null, third, (Object)null);
   }

   @Nonnull
   public static Quadro ofFourth(@Nullable Object fourth) {
      return of((Object)null, (Object)null, (Object)null, fourth);
   }

   @Nonnull
   public static Quadro of(@Nullable Object first, @Nullable Object second, @Nullable Object third, @Nullable Object fourth) {
      return new Quadro(first, second, third, fourth);
   }

   @Nonnull
   public static Quadro empty() {
      return new Quadro();
   }
}
