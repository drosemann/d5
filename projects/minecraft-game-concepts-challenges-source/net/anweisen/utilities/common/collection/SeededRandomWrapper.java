package net.anweisen.utilities.common.collection;

import java.util.Random;

public class SeededRandomWrapper extends Random implements IRandom {
   protected long seed;

   public SeededRandomWrapper() {
   }

   public SeededRandomWrapper(long seed) {
      super(seed);
   }

   public void setSeed(long seed) {
      super.setSeed(seed);
      this.seed = seed;
   }

   public long getSeed() {
      return this.seed;
   }

   public String toString() {
      return "Random[seed=" + this.seed + "]";
   }
}
