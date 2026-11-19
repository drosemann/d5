// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/item/ItemBuilder.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/item/ItemBuilder.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/anweisen/utilities/bukkit/utils/item/ItemBuilder.java), unveraendert, als Inline-Doku ----
// package net.anweisen.utilities.bukkit.utils.item;
//
// import java.util.ArrayList;
// import java.util.Arrays;
// import java.util.Collection;
// import java.util.List;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import org.bukkit.Color;
// import org.bukkit.DyeColor;
// import org.bukkit.Material;
// import org.bukkit.block.banner.Pattern;
// import org.bukkit.block.banner.PatternType;
// import org.bukkit.enchantments.Enchantment;
// import org.bukkit.inventory.ItemFlag;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.meta.BannerMeta;
// import org.bukkit.inventory.meta.Damageable;
// import org.bukkit.inventory.meta.ItemMeta;
// import org.bukkit.inventory.meta.LeatherArmorMeta;
// import org.bukkit.inventory.meta.PotionMeta;
// import org.bukkit.inventory.meta.SkullMeta;
// import org.bukkit.potion.PotionEffect;
//
// public class ItemBuilder {
//    public static final ItemStack FILL_ITEM;
//    public static final ItemStack FILL_ITEM_2;
//    public static final ItemStack BLOCKED_ITEM;
//    public static final ItemStack AIR;
//    protected ItemStack item;
//    protected ItemMeta meta;
//
//    public ItemBuilder(@Nonnull ItemStack item) {
//       this(item, item.getItemMeta());
//    }
//
//    public ItemBuilder(@Nonnull ItemStack item, @Nullable ItemMeta meta) {
//       this.item = item;
//       this.meta = meta;
//    }
//
//    public ItemBuilder(@Nonnull Material material) {
//       this(new ItemStack(material));
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name) {
//       this(material);
//       this.setName(name);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name, @Nonnull String... lore) {
//       this(material);
//       this.setName(name);
//       this.setLore(lore);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name, int amount) {
//       this(material);
//       this.setName(name);
//       this.setAmount(amount);
//    }
//
//    @Nonnull
//    public ItemMeta getMeta() {
//       return (ItemMeta)this.getCastedMeta();
//    }
//
//    @Nonnull
//    public final Object getCastedMeta() {
//       return this.meta == null ? (this.meta = this.item.getItemMeta()) : this.meta;
//    }
//
//    @Nonnull
//    public ItemBuilder setLore(@Nonnull List lore) {
//       this.getMeta().setLore(lore);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder setLore(@Nonnull String... lore) {
//       return this.setLore(Arrays.asList(lore));
//    }
//
//    @Nonnull
//    public ItemBuilder appendLore(@Nonnull String... lore) {
//       return this.appendLore((Collection)Arrays.asList(lore));
//    }
//
//    @Nonnull
//    public ItemBuilder appendLore(@Nonnull Collection lore) {
//       List newLore = this.getMeta().getLore();
//       if (newLore == null) {
//          newLore = new ArrayList();
//       }
//
//       ((List)newLore).addAll(lore);
//       this.setLore((List)newLore);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder lore(@Nonnull String... lore) {
//       return this.setLore(lore);
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nullable String name) {
//       this.getMeta().setDisplayName(name);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nullable Object name) {
//       return this.setName(name == null ? null : name.toString());
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nonnull String... content) {
//       if (content.length > 0) {
//          this.setName(content[0]);
//       }
//
//       if (content.length > 1) {
//          this.setLore((String[])Arrays.copyOfRange(content, 1, content.length));
//       }
//
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder appendName(@Nullable Object sequence) {
//       String name = this.getMeta().getDisplayName();
//       return this.setName(name + sequence);
//    }
//
//    @Nonnull
//    public ItemBuilder name(@Nullable Object name) {
//       return this.setName(name);
//    }
//
//    @Nonnull
//    public ItemBuilder name(@Nonnull String... content) {
//       return this.setName(content);
//    }
//
//    @Nonnull
//    public ItemBuilder addEnchantment(@Nonnull Enchantment enchantment, int level) {
//       this.getMeta().addEnchant(enchantment, level, true);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder enchant(@Nonnull Enchantment enchantment, int level) {
//       return this.addEnchantment(enchantment, level);
//    }
//
//    @Nonnull
//    public ItemBuilder addFlag(@Nonnull ItemFlag... flags) {
//       this.getMeta().addItemFlags(flags);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder flag(@Nonnull ItemFlag... flags) {
//       return this.addFlag(flags);
//    }
//
//    @Nonnull
//    public ItemBuilder removeFlag(@Nonnull ItemFlag... flags) {
//       this.getMeta().removeItemFlags(flags);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder hideAttributes() {
//       return this.addFlag(ItemFlag.values());
//    }
//
//    @Nonnull
//    public ItemBuilder showAttributes() {
//       return this.removeFlag(ItemFlag.values());
//    }
//
//    @Nonnull
//    public ItemBuilder setUnbreakable(boolean unbreakable) {
//       this.getMeta().setUnbreakable(unbreakable);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder unbreakable() {
//       return this.setUnbreakable(true);
//    }
//
//    @Nonnull
//    public ItemBuilder breakable() {
//       return this.setUnbreakable(false);
//    }
//
//    @Nonnull
//    public ItemBuilder setAmount(int amount) {
//       this.item.setAmount(Math.min(Math.max(amount, 0), 64));
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder amount(int amount) {
//       return this.setAmount(amount);
//    }
//
//    @Nonnull
//    public ItemBuilder setDamage(int damage) {
//       ((Damageable)this.getCastedMeta()).setDamage(damage);
//       return this;
//    }
//
//    @Nonnull
//    public ItemBuilder damage(int damage) {
//       return this.setDamage(damage);
//    }
//
//    @Nonnull
//    public ItemBuilder setType(@Nonnull Material material) {
//       this.item.setType(material);
//       this.meta = this.item.getItemMeta();
//       return this;
//    }
//
//    @Nonnull
//    public String getName() {
//       return this.getMeta().getDisplayName();
//    }
//
//    @Nonnull
//    public List getLore() {
//       List lore = this.getMeta().getLore();
//       return (List)(lore == null ? new ArrayList() : lore);
//    }
//
//    @Nonnull
//    public Material getType() {
//       return this.item.getType();
//    }
//
//    public int getAmount() {
//       return this.item.getAmount();
//    }
//
//    public int getDamage() {
//       return ((Damageable)this.getCastedMeta()).getDamage();
//    }
//
//    @Nonnull
//    public ItemStack build() {
//       this.item.setItemMeta(this.getMeta());
//       return this.item;
//    }
//
//    @Nonnull
//    public ItemStack toItem() {
//       return this.build();
//    }
//
//    public ItemBuilder clone() {
//       return new ItemBuilder(this.item.clone(), this.getMeta().clone());
//    }
//
//    static {
//       FILL_ITEM = (new ItemBuilder(Material.GRAY_STAINED_GLASS_PANE)).setName("§0").build();
//       FILL_ITEM_2 = (new ItemBuilder(Material.BLACK_STAINED_GLASS_PANE)).setName("§0").build();
//       BLOCKED_ITEM = (new ItemBuilder(Material.BARRIER, "§cBlocked")).build();
//       AIR = new ItemStack(Material.AIR);
//    }
//
//    public static class LeatherArmorBuilder extends ItemBuilder {
//       public LeatherArmorBuilder(@Nonnull Material material) {
//          super(material);
//       }
//
//       public LeatherArmorBuilder(@Nonnull Material material, @Nonnull String name) {
//          super(material, name);
//       }
//
//       public LeatherArmorBuilder(@Nonnull Material material, @Nonnull String name, @Nonnull String... lore) {
//          super(material, name, lore);
//       }
//
//       public LeatherArmorBuilder(@Nonnull Material material, @Nonnull String name, int amount) {
//          super(material, name, amount);
//       }
//
//       public LeatherArmorBuilder(@Nonnull ItemStack item) {
//          super(item);
//       }
//
//       @Nonnull
//       public ItemBuilder.LeatherArmorBuilder setColor(@Nonnull Color color) {
//          this.getMeta().setColor(color);
//          return this;
//       }
//
//       @Nonnull
//       public ItemBuilder.LeatherArmorBuilder color(@Nonnull Color color) {
//          return this.setColor(color);
//       }
//
//       @Nonnull
//       public LeatherArmorMeta getMeta() {
//          return (LeatherArmorMeta)this.getCastedMeta();
//       }
//    }
//
//    public static class PotionBuilder extends ItemBuilder {
//       @Nonnull
//       @CheckReturnValue
//       public static ItemBuilder createWaterBottle() {
//          return (new ItemBuilder.PotionBuilder(Material.POTION)).setColor(Color.BLUE).hideAttributes();
//       }
//
//       public PotionBuilder(@Nonnull Material material) {
//          super(material);
//       }
//
//       public PotionBuilder(@Nonnull Material material, @Nonnull String name) {
//          super(material, name);
//       }
//
//       public PotionBuilder(@Nonnull Material material, @Nonnull String name, @Nonnull String... lore) {
//          super(material, name, lore);
//       }
//
//       public PotionBuilder(@Nonnull Material material, @Nonnull String name, int amount) {
//          super(material, name, amount);
//       }
//
//       public PotionBuilder(@Nonnull ItemStack item) {
//          super(item);
//       }
//
//       @Nonnull
//       public ItemBuilder.PotionBuilder addEffect(@Nonnull PotionEffect effect) {
//          this.getMeta().addCustomEffect(effect, true);
//          return this;
//       }
//
//       @Nonnull
//       public ItemBuilder.PotionBuilder setColor(@Nonnull Color color) {
//          this.getMeta().setColor(color);
//          return this;
//       }
//
//       @Nonnull
//       public ItemBuilder.PotionBuilder color(@Nonnull Color color) {
//          return this.setColor(color);
//       }
//
//       @Nonnull
//       public PotionMeta getMeta() {
//          return (PotionMeta)this.getCastedMeta();
//       }
//    }
//
//    public static class SkullBuilder extends ItemBuilder {
//       public SkullBuilder() {
//          super(Material.PLAYER_HEAD);
//       }
//
//       public SkullBuilder(@Nonnull String owner) {
//          super(Material.PLAYER_HEAD);
//          this.setOwner(owner);
//       }
//
//       public SkullBuilder(@Nonnull String owner, @Nonnull String name, @Nonnull String... lore) {
//          super(Material.PLAYER_HEAD, name, lore);
//          this.setOwner(owner);
//       }
//
//       public ItemBuilder.SkullBuilder setOwner(@Nonnull String owner) {
//          this.getMeta().setOwner(owner);
//          return this;
//       }
//
//       @Nonnull
//       public SkullMeta getMeta() {
//          return (SkullMeta)this.getCastedMeta();
//       }
//    }
//
//    public static class BannerBuilder extends ItemBuilder {
//       public BannerBuilder(@Nonnull Material material) {
//          super(material);
//       }
//
//       public BannerBuilder(@Nonnull Material material, @Nonnull String name) {
//          super(material, name);
//       }
//
//       public BannerBuilder(@Nonnull Material material, @Nonnull String name, @Nonnull String... lore) {
//          super(material, name, lore);
//       }
//
//       public BannerBuilder(@Nonnull Material material, @Nonnull String name, int amount) {
//          super(material, name, amount);
//       }
//
//       public BannerBuilder(@Nonnull ItemStack item) {
//          super(item);
//       }
//
//       @Nonnull
//       public ItemBuilder.BannerBuilder addPattern(@Nonnull BannerPattern pattern, @Nonnull DyeColor color) {
//          return this.addPattern(pattern.getPatternType(), color);
//       }
//
//       @Nonnull
//       public ItemBuilder.BannerBuilder addPattern(@Nonnull PatternType pattern, @Nonnull DyeColor color) {
//          this.getMeta().addPattern(new Pattern(color, pattern));
//          return this;
//       }
//
//       @Nonnull
//       public BannerMeta getMeta() {
//          return (BannerMeta)this.getCastedMeta();
//       }
//    }
// }
//
