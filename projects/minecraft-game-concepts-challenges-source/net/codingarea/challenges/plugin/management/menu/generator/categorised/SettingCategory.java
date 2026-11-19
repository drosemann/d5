package net.codingarea.challenges.plugin.management.menu.generator.categorised;

import java.util.function.Supplier;
import net.codingarea.challenges.plugin.content.Message;
import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
import net.codingarea.challenges.plugin.utils.misc.MinecraftNameWrapper;
import org.bukkit.Material;

public class SettingCategory {
   public static final SettingCategory MISC_CHALLENGE;
   public static final SettingCategory RANDOMIZER;
   public static final SettingCategory FORCE;
   public static final SettingCategory ENTITIES;
   public static final SettingCategory DAMAGE;
   public static final SettingCategory EFFECT;
   public static final SettingCategory WORLD;
   public static final SettingCategory INVENTORY;
   public static final SettingCategory MOVEMENT;
   public static final SettingCategory LIMITED_TIME;
   public static final SettingCategory EXTRA_WORLD;
   public static final SettingCategory MISC_GOAL;
   public static final SettingCategory KILL_ENTITY;
   public static final SettingCategory SCORE_POINTS;
   public static final SettingCategory FASTEST_TIME;
   public static final SettingCategory FORCE_BATTLE;
   private final int priority;
   private final Material material;
   private final Supplier messageSupplier;

   public SettingCategory(int priority, Material material, Supplier messageSupplier) {
      this.priority = priority;
      this.material = material;
      this.messageSupplier = messageSupplier;
   }

   public int getPriority() {
      return this.priority;
   }

   public ItemBuilder getDisplayItem() {
      return new ItemBuilder(this.material, (Message)this.messageSupplier.get());
   }

   public Material getMaterial() {
      return this.material;
   }

   public Supplier getMessageSupplier() {
      return this.messageSupplier;
   }

   static {
      MISC_CHALLENGE = new SettingCategory(99, Material.MINECART, () -> {
         return Message.forName("category-misc_challenge");
      });
      RANDOMIZER = new SettingCategory(1, Material.COMMAND_BLOCK, () -> {
         return Message.forName("category-randomizer");
      });
      FORCE = new SettingCategory(2, Material.BLUE_BANNER, () -> {
         return Message.forName("category-force");
      });
      ENTITIES = new SettingCategory(3, Material.PIG_SPAWN_EGG, () -> {
         return Message.forName("category-entities");
      });
      DAMAGE = new SettingCategory(4, MinecraftNameWrapper.RED_DYE, () -> {
         return Message.forName("category-damage");
      });
      EFFECT = new SettingCategory(5, Material.FERMENTED_SPIDER_EYE, () -> {
         return Message.forName("category-effect");
      });
      WORLD = new SettingCategory(6, Material.TNT, () -> {
         return Message.forName("category-world");
      });
      INVENTORY = new SettingCategory(7, Material.CHEST, () -> {
         return Message.forName("category-inventory");
      });
      MOVEMENT = new SettingCategory(8, Material.RABBIT_FOOT, () -> {
         return Message.forName("category-movement");
      });
      LIMITED_TIME = new SettingCategory(9, Material.CLOCK, () -> {
         return Message.forName("category-limited_time");
      });
      EXTRA_WORLD = new SettingCategory(10, Material.GRASS_BLOCK, () -> {
         return Message.forName("category-extra_world");
      });
      MISC_GOAL = new SettingCategory(99, Material.MINECART, () -> {
         return Message.forName("category-misc_goal");
      });
      KILL_ENTITY = new SettingCategory(1, Material.BOW, () -> {
         return Message.forName("category-kill_entity");
      });
      SCORE_POINTS = new SettingCategory(2, Material.CHEST, () -> {
         return Message.forName("category-score_points");
      });
      FASTEST_TIME = new SettingCategory(3, Material.CLOCK, () -> {
         return Message.forName("category-fastest_time");
      });
      FORCE_BATTLE = new SettingCategory(4, Material.BLUE_BANNER, () -> {
         return Message.forName("category-force_battle");
      });
   }
}
