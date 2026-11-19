package net.anweisen.utilities.bukkit.core;

import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.version.Version;
import org.bukkit.Bukkit;

public final class RequirementsChecker {
   private final BukkitModule module;

   public RequirementsChecker(@Nonnull BukkitModule module) {
      this.module = module;
   }

   public void checkExceptionally(@Nonnull Document requirements) throws IllegalStateException {
      if (requirements.getBoolean("spigot")) {
         this.requireSpigot();
      }

      if (requirements.getBoolean("paper")) {
         this.requirePaper();
      }

      if (requirements.contains("version")) {
         this.requireVersion(requirements.getVersion("version"));
      }

   }

   public boolean checkBoolean(@Nonnull Document requirements) {
      try {
         this.checkExceptionally(requirements);
         return true;
      } catch (IllegalStateException var3) {
         return false;
      }
   }

   private void requireSpigot() {
      try {
         Bukkit.spigot();
      } catch (Throwable var2) {
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         this.log("Your server does not run an instance of Spigot (Your server: {}", Bukkit.getVersion());
         this.log("Please use an instance of Spigot or Paper to be able to use this plugin!");
         this.log("");
         this.log("Paper Download: https://papermc.io/downloads");
         this.log("Spigot Download: https://getbukkit.org/download/spigot");
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         throw new IllegalStateException();
      }
   }

   private void requirePaper() {
      try {
         Class.forName("com.destroystokyo.paper.VersionHistoryManager");
      } catch (Throwable var2) {
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         this.log("Your server does not run an instance of PaperMC (Your server: {}", Bukkit.getVersion());
         this.log("Please use an instance of Paper to be able to use this plugin!");
         this.log("");
         this.log("Paper Download: https://papermc.io/downloads");
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         throw new IllegalStateException();
      }
   }

   private void requireVersion(@Nonnull Version required) {
      if (MinecraftVersion.currentExact().isOlderThan(required)) {
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         this.log("This plugin requires the server version {} (You have: {})", required.format(), MinecraftVersion.currentExact().format());
         this.log("Please use this version (or an newer version) to be able to use this plugin!");
         this.log("");
         this.log("Paper Download: https://papermc.io/downloads");
         this.log("Spigot Download: https://getbukkit.org/download/spigot");
         this.log("");
         this.log("============================== {} ==============================", this.module.getName());
         this.log("");
         throw new IllegalStateException();
      }
   }

   private void log(@Nonnull String line, @Nonnull Object... args) {
      this.module.getLogger().error(line, args);
   }
}
