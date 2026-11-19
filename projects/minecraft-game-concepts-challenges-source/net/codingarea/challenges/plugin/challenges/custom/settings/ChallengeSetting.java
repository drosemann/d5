package net.codingarea.challenges.plugin.challenges.custom.settings;

import java.util.function.Supplier;
import net.codingarea.challenges.plugin.challenges.custom.settings.sub.SubSettingsBuilder;

public abstract class ChallengeSetting implements IChallengeSetting {
   private final String name;
   private final SubSettingsBuilder subSettingsBuilder;

   public ChallengeSetting(String name, SubSettingsBuilder subSettingsBuilder) {
      this.name = name;
      this.subSettingsBuilder = subSettingsBuilder.build();
   }

   public ChallengeSetting(String name) {
      this(name, (SubSettingsBuilder)SubSettingsBuilder.createEmpty());
   }

   public ChallengeSetting(String name, Supplier builderSupplier) {
      this(name, (SubSettingsBuilder)builderSupplier.get());
   }

   public String getMessageSuffix() {
      return this.name.toLowerCase();
   }

   public SubSettingsBuilder getSubSettingsBuilder() {
      return this.subSettingsBuilder;
   }

   public String getName() {
      return this.name;
   }
}
