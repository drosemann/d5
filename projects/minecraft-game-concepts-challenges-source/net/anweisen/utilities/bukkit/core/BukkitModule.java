package net.anweisen.utilities.bukkit.core;

import com.google.common.base.Charsets;
import java.io.File;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;
import java.util.logging.Level;
import javax.annotation.Nonnull;
import net.anweisen.utilities.bukkit.utils.menu.MenuPosition;
import net.anweisen.utilities.bukkit.utils.menu.MenuPositionListener;
import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
import net.anweisen.utilities.bukkit.utils.wrapper.ActionListener;
import net.anweisen.utilities.bukkit.utils.wrapper.SimpleEventExecutor;
import net.anweisen.utilities.common.annotations.DeprecatedSince;
import net.anweisen.utilities.common.annotations.ReplaceWith;
import net.anweisen.utilities.common.collection.NamedThreadFactory;
import net.anweisen.utilities.common.collection.WrappedException;
import net.anweisen.utilities.common.config.Document;
import net.anweisen.utilities.common.config.FileDocument;
import net.anweisen.utilities.common.config.document.YamlDocument;
import net.anweisen.utilities.common.logging.ILogger;
import net.anweisen.utilities.common.logging.internal.BukkitLoggerWrapper;
import net.anweisen.utilities.common.logging.lib.JavaILogger;
import net.anweisen.utilities.common.version.Version;
import org.bukkit.Bukkit;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.PluginCommand;
import org.bukkit.configuration.file.FileConfiguration;
import org.bukkit.configuration.file.YamlConfiguration;
import org.bukkit.entity.Player;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.inventory.Inventory;
import org.bukkit.inventory.InventoryView;
import org.bukkit.plugin.java.JavaPlugin;

public abstract class BukkitModule extends JavaPlugin {
   private static volatile BukkitModule firstInstance;
   private static boolean setFirstInstance = true;
   private static boolean wasShutdown;
   private final Map commands = new HashMap();
   private final List listeners = new ArrayList();
   private final SimpleConfigManager configManager = new SimpleConfigManager(this);
   private JavaILogger logger;
   private ExecutorService executorService;
   private Document config;
   private Document pluginConfig;
   private Version version;
   private boolean devMode;
   private boolean firstInstall;
   private boolean isReloaded;
   private boolean isLoaded;
   private boolean requirementsMet = true;

   public final void onLoad() {
      this.isLoaded = true;
      if (this.requirementsMet && (this.requirementsMet = (new RequirementsChecker(this)).checkBoolean(this.getPluginDocument().getDocument("require")))) {
         if (setFirstInstance || firstInstance == null) {
            setFirstInstance(this);
         }

         ILogger.setConstantFactory(this.getLogger());
         this.trySaveDefaultConfig();
         if (wasShutdown) {
            this.isReloaded = true;
         }

         if (this.firstInstall = !this.getDataFolder().exists()) {
            this.getLogger().info("Detected first install!");
         }

         if (this.devMode = this.getConfigDocument().getBoolean("dev-mode") || this.getConfigDocument().getBoolean("dev-mode.enabled")) {
            this.getLogger().setLevel(Level.ALL);
            this.getLogger().debug("Devmode is enabled: Showing debug messages. This can be disabled in the plugin.yml ('dev-mode')", new Object[0]);
         } else {
            this.getLogger().setLevel(Level.INFO);
         }

         this.injectInstance();

         try {
            this.handleLoad();
         } catch (Exception var2) {
            throw new WrappedException(var2);
         }
      }
   }

   public final void onEnable() {
      if (this.requirementsMet) {
         this.commands.forEach((name, executor) -> {
            this.registerCommand0(executor, name);
         });
         this.listeners.forEach((xva$0) -> {
            this.registerListener(xva$0);
         });

         try {
            this.handleEnable();
         } catch (Exception var2) {
            throw new WrappedException(var2);
         }
      }
   }

   public final void onDisable() {
      Throwable error = null;

      try {
         this.handleDisable();
      } catch (Throwable var6) {
         error = var6;
      }

      setFirstInstance = true;
      wasShutdown = true;
      this.isLoaded = false;
      this.commands.clear();
      this.listeners.clear();
      if (this.executorService != null) {
         this.executorService.shutdown();
      }

      Iterator var2 = Bukkit.getOnlinePlayers().iterator();

      while(var2.hasNext()) {
         Player player = (Player)var2.next();
         InventoryView view = player.getOpenInventory();
         Inventory inventory = view.getTopInventory();
         if (inventory.getHolder() == MenuPosition.HOLDER) {
            view.close();
         }
      }

      if (error != null) {
         throw new WrappedException(error);
      }
   }

   protected void handleLoad() throws Exception {
   }

   protected void handleEnable() throws Exception {
   }

   protected void handleDisable() throws Exception {
   }

   public boolean isDevMode() {
      return this.devMode;
   }

   public final boolean isFirstInstall() {
      return this.firstInstall;
   }

   public final boolean isReloaded() {
      return this.isReloaded;
   }

   public final boolean isLoaded() {
      return this.isLoaded;
   }

   public final boolean isFirstInstance() {
      return firstInstance == this;
   }

   @Nonnull
   public JavaILogger getLogger() {
      return this.logger != null ? this.logger : (this.logger = new BukkitLoggerWrapper(super.getLogger()));
   }

   @Nonnull
   public Document getConfigDocument() {
      this.checkLoaded();
      return this.config != null ? this.config : (this.config = new YamlDocument(super.getConfig()));
   }

   public void reloadConfig() {
      this.config = null;
      super.reloadConfig();
   }

   @Nonnull
   public Document getPluginDocument() {
      return this.pluginConfig != null ? this.pluginConfig : (this.pluginConfig = new YamlDocument(YamlConfiguration.loadConfiguration(new InputStreamReader(this.getResource("plugin.yml"), Charsets.UTF_8))));
   }

   @Nonnull
   public FileDocument getConfig(@Nonnull String filename) {
      return this.configManager.getDocument(filename);
   }

   @Nonnull
   public Version getVersion() {
      return this.version != null ? this.version : (this.version = Version.parse(this.getDescription().getVersion()));
   }

   /** @deprecated */
   @Nonnull
   @Deprecated
   @DeprecatedSince("1.3.0")
   @ReplaceWith("MinecraftVersion.current()")
   public MinecraftVersion getServerVersion() {
      return MinecraftVersion.current();
   }

   /** @deprecated */
   @Nonnull
   @Deprecated
   @DeprecatedSince("1.3.0")
   @ReplaceWith("MinecraftVersion.currentExact()")
   public Version getServerVersionExact() {
      return MinecraftVersion.currentExact();
   }

   /** @deprecated */
   @Nonnull
   @Deprecated
   @ReplaceWith("getConfigDocument()")
   public FileConfiguration getConfig() {
      return super.getConfig();
   }

   /** @deprecated */
   @Deprecated
   public void saveConfig() {
      super.saveConfig();
   }

   public void setRequirementsFailed() {
      this.requirementsMet = false;
   }

   public final void registerListenerCommand(@Nonnull CommandExecutor listenerAndExecutor, @Nonnull String... names) {
      this.registerCommand(listenerAndExecutor, names);
      this.registerListener((Listener)listenerAndExecutor);
   }

   public final void registerCommand(@Nonnull CommandExecutor executor, @Nonnull String... names) {
      String[] var3 = names;
      int var4 = names.length;

      for(int var5 = 0; var5 < var4; ++var5) {
         String name = var3[var5];
         if (this.isEnabled()) {
            this.registerCommand0(executor, name);
         } else {
            this.commands.put(name, executor);
         }
      }

   }

   private void registerCommand0(@Nonnull CommandExecutor executor, @Nonnull String name) {
      PluginCommand command = this.getCommand(name);
      if (command == null) {
         this.getLogger().warn("Tried to register invalid command '{}'", new Object[]{name});
      } else {
         command.setExecutor(executor);
      }

   }

   public final void registerListener(@Nonnull Listener... listeners) {
      if (this.isEnabled()) {
         Listener[] var2 = listeners;
         int var3 = listeners.length;

         for(int var4 = 0; var4 < var3; ++var4) {
            Listener listener = var2[var4];
            this.registerListener0(listener);
         }
      } else {
         this.listeners.addAll(Arrays.asList(listeners));
      }

   }

   private void registerListener0(@Nonnull Listener listener) {
      if (listener instanceof ActionListener) {
         ActionListener actionListener = (ActionListener)listener;
         this.getServer().getPluginManager().registerEvent(actionListener.getClassOfEvent(), actionListener, actionListener.getPriority(), new SimpleEventExecutor(actionListener.getClassOfEvent(), actionListener.getListener()), this, actionListener.isIgnoreCancelled());
      } else {
         this.getServer().getPluginManager().registerEvents(listener, this);
      }

   }

   public final void on(@Nonnull Class classOfEvent, @Nonnull Consumer action) {
      this.on(classOfEvent, EventPriority.NORMAL, action);
   }

   public final void on(@Nonnull Class classOfEvent, @Nonnull EventPriority priority, @Nonnull Consumer action) {
      this.on(classOfEvent, priority, false, action);
   }

   public final void on(@Nonnull Class classOfEvent, @Nonnull EventPriority priority, boolean ignoreCancelled, @Nonnull Consumer action) {
      this.registerListener(new ActionListener(classOfEvent, action, priority, ignoreCancelled));
   }

   public final void disablePlugin() {
      this.getServer().getPluginManager().disablePlugin(this);
   }

   @Nonnull
   public final File getDataFile(@Nonnull String filename) {
      return new File(this.getDataFolder(), filename);
   }

   @Nonnull
   public final File getDataFile(@Nonnull String subfolder, @Nonnull String filename) {
      return new File(this.getDataFile(subfolder), filename);
   }

   @Nonnull
   public ExecutorService getExecutor() {
      return this.executorService != null ? this.executorService : (this.executorService = Executors.newCachedThreadPool(new NamedThreadFactory((threadId) -> {
         return String.format("%s-Task-%s", this.getName(), threadId);
      })));
   }

   public void runAsync(@Nonnull Runnable task) {
      this.getExecutor().submit(task);
   }

   public final void checkLoaded() {
      if (!this.isLoaded()) {
         throw new IllegalStateException("Plugin (" + this.getName() + ") is not loaded yet");
      }
   }

   public final void checkEnabled() {
      if (!this.isEnabled()) {
         throw new IllegalStateException("Plugin (" + this.getName() + ") is not enabled yet");
      }
   }

   private void registerAsFirstInstance() {
      this.getLogger().info(this.getName() + " was loaded as the first BukkitModule");
      this.registerListener(new MenuPositionListener());
      this.getLogger().info("Detected server version {} -> {}", new Object[]{this.getServerVersionExact(), this.getServerVersion()});
   }

   private void trySaveDefaultConfig() {
      try {
         this.saveDefaultConfig();
      } catch (IllegalArgumentException var2) {
      }

   }

   private void injectInstance() {
      try {
         Field instanceField = this.getClass().getDeclaredField("instance");
         instanceField.setAccessible(true);
         instanceField.set((Object)null, this);
      } catch (Throwable var2) {
      }

   }

   @Nonnull
   public static BukkitModule getFirstInstance() {
      if (firstInstance == null) {
         JavaPlugin provider = JavaPlugin.getProvidingPlugin(BukkitModule.class);
         if (!(provider instanceof BukkitModule)) {
            throw new IllegalStateException("No BukkitModule was initialized yet & BukkitModule class was not loaded by a BukkitModule");
         }

         firstInstance = (BukkitModule)provider;
      }

      return firstInstance;
   }

   private static synchronized void setFirstInstance(@Nonnull BukkitModule module) {
      setFirstInstance = false;
      firstInstance = module;
      module.registerAsFirstInstance();
   }

   @Nonnull
   public static BukkitModule getProvidingModule(@Nonnull Class clazz) {
      JavaPlugin provider = JavaPlugin.getProvidingPlugin(clazz);
      if (!(provider instanceof BukkitModule)) {
         throw new IllegalStateException(clazz.getName() + " is not provided by a BukkitModule");
      } else {
         return (BukkitModule)provider;
      }
   }
}
