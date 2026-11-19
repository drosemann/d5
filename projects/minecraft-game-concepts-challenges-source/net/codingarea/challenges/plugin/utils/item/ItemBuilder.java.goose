// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/item/ItemBuilder.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/item/ItemBuilder.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/item/ItemBuilder.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.item;
//
// import java.util.Collection;
// import java.util.List;
// import java.util.UUID;
// import javax.annotation.CheckReturnValue;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.item.BannerPattern;
// import net.anweisen.utilities.bukkit.utils.misc.GameProfileUtils;
// import net.anweisen.utilities.common.annotations.DeprecatedSince;
// import net.anweisen.utilities.common.annotations.ReplaceWith;
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.content.ItemDescription;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.utils.misc.DatabaseHelper;
// import org.bukkit.Color;
// import org.bukkit.DyeColor;
// import org.bukkit.Material;
// import org.bukkit.block.banner.Pattern;
// import org.bukkit.block.banner.PatternType;
// import org.bukkit.enchantments.Enchantment;
// import org.bukkit.inventory.ItemFlag;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.meta.BannerMeta;
// import org.bukkit.inventory.meta.ItemMeta;
// import org.bukkit.inventory.meta.LeatherArmorMeta;
// import org.bukkit.inventory.meta.PotionMeta;
// import org.bukkit.inventory.meta.SkullMeta;
// import org.bukkit.potion.PotionEffect;
//
// public class ItemBuilder extends net.anweisen.utilities.bukkit.utils.item.ItemBuilder {
//    public static final ItemStack BLOCKED_ITEM;
//    protected ItemDescription builtByItemDescription;
//
//    public ItemBuilder(@Nonnull ItemStack item) {
//       super(item);
//    }
//
//    public ItemBuilder(@Nonnull ItemStack item, @Nullable ItemMeta meta) {
//       super(item, meta);
//    }
//
//    public ItemBuilder() {
//       this(Material.BARRIER, ItemDescription.empty());
//    }
//
//    public ItemBuilder(@Nonnull Material material) {
//       super(material);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull Message message) {
//       this(material, message.asItemDescription());
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull Message message, Object... args) {
//       this(material, message.asItemDescription(args));
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull ItemDescription description) {
//       this(material);
//       this.applyFormat(description);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name) {
//       super(material, name);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name, @Nonnull String... lore) {
//       super(material, name, lore);
//    }
//
//    public ItemBuilder(@Nonnull Material material, @Nonnull String name, int amount) {
//       super(material, name, amount);
//    }
//
//    @Nonnull
//    public ItemBuilder setLore(@Nonnull Message message) {
//       return this.setLore(message.asArray());
//    }
//
//    @Nonnull
//    public ItemBuilder setLore(@Nonnull List lore) {
//       return (ItemBuilder)super.setLore(lore);
//    }
//
//    @Nonnull
//    public ItemBuilder setLore(@Nonnull String... lore) {
//       return (ItemBuilder)super.setLore(lore);
//    }
//
//    @Nonnull
//    public ItemBuilder appendLore(@Nonnull String... lore) {
//       return (ItemBuilder)super.appendLore(lore);
//    }
//
//    @Nonnull
//    public ItemBuilder appendLore(@Nonnull Collection lore) {
//       return (ItemBuilder)super.appendLore(lore);
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nullable String name) {
//       return (ItemBuilder)super.setName(name);
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nullable Object name) {
//       return (ItemBuilder)super.setName(name);
//    }
//
//    @Nonnull
//    public ItemBuilder setName(@Nonnull String... content) {
//       return (ItemBuilder)super.setName(content);
//    }
//
//    @Nonnull
//    public ItemBuilder appendName(@Nullable Object sequence) {
//       return (ItemBuilder)super.appendName(sequence);
//    }
//
//    @Nonnull
//    public ItemBuilder name(@Nullable Object name) {
//       return (ItemBuilder)super.name(name);
//    }
//
//    @Nonnull
//    public ItemBuilder name(@Nonnull String... content) {
//       return (ItemBuilder)super.name(content);
//    }
//
//    @Nonnull
//    public ItemBuilder addEnchantment(@Nonnull Enchantment enchantment, int level) {
//       return (ItemBuilder)super.addEnchantment(enchantment, level);
//    }
//
//    @Nonnull
//    public ItemBuilder enchant(@Nonnull Enchantment enchantment, int level) {
//       return (ItemBuilder)super.enchant(enchantment, level);
//    }
//
//    @Nonnull
//    public ItemBuilder addFlag(@Nonnull ItemFlag... flags) {
//       return (ItemBuilder)super.addFlag(flags);
//    }
//
//    @Nonnull
//    public ItemBuilder removeFlag(@Nonnull ItemFlag... flags) {
//       return (ItemBuilder)super.removeFlag(flags);
//    }
//
//    @Nonnull
//    public ItemBuilder hideAttributes() {
//       return (ItemBuilder)super.hideAttributes();
//    }
//
//    @Nonnull
//    public ItemBuilder showAttributes() {
//       return (ItemBuilder)super.showAttributes();
//    }
//
//    @Nonnull
//    public ItemBuilder setUnbreakable(boolean unbreakable) {
//       return (ItemBuilder)super.setUnbreakable(unbreakable);
//    }
//
//    @Nonnull
//    public ItemBuilder unbreakable() {
//       return (ItemBuilder)super.unbreakable();
//    }
//
//    @Nonnull
//    public ItemBuilder breakable() {
//       return (ItemBuilder)super.breakable();
//    }
//
//    @Nonnull
//    public ItemBuilder setAmount(int amount) {
//       return (ItemBuilder)super.setAmount(amount);
//    }
//
//    @Nonnull
//    public ItemBuilder amount(int amount) {
//       return (ItemBuilder)super.amount(amount);
//    }
//
//    @Nonnull
//    public ItemBuilder setDamage(int damage) {
//       return (ItemBuilder)super.setDamage(damage);
//    }
//
//    @Nonnull
//    public ItemBuilder damage(int damage) {
//       return (ItemBuilder)super.damage(damage);
//    }
//
//    @Nonnull
//    public ItemBuilder setType(@Nonnull Material material) {
//       return (ItemBuilder)super.setType(material);
//    }
//
//    @Nonnull
//    public ItemBuilder applyFormat(@Nonnull ItemDescription description) {
//       this.builtByItemDescription = description;
//       this.setName(description.getName());
//       this.setLore(description.getLore());
//       return this;
//    }
//
//    @Nullable
//    public ItemDescription getBuiltByItemDescription() {
//       return this.builtByItemDescription;
//    }
//
//    public ItemBuilder clone() {
//       ItemBuilder builder = new ItemBuilder(this.item.clone(), this.getMeta().clone());
//       builder.builtByItemDescription = this.builtByItemDescription;
//       return builder;
//    }
//
//    static {
//       BLOCKED_ITEM = (new ItemBuilder(Material.BARRIER, "§cBlocked")).build();
//    }
//
//    public static class LeatherArmorBuilder extends ItemBuilder {
//       public LeatherArmorBuilder(@Nonnull Material material) {
//          super(material);
//       }
//
//       public LeatherArmorBuilder(@Nonnull Material material, @Nonnull Message message) {
//          super(material, message);
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
//       public PotionBuilder(@Nonnull Material material) {
//          super(material);
//       }
//
//       public PotionBuilder(@Nonnull Material material, @Nonnull Message message) {
//          super(material, message);
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
//       @CheckReturnValue
//       public static ItemBuilder createWaterBottle() {
//          return (new ItemBuilder.PotionBuilder(Material.POTION)).setColor(Color.BLUE).hideAttributes();
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
//       /** @deprecated */
//       @Deprecated
//       @DeprecatedSince("2.0")
//       public SkullBuilder(@Nonnull String owner) {
//          super(Material.PLAYER_HEAD);
//          this.setOwner(owner);
//       }
//
//       /** @deprecated */
//       @Deprecated
//       @DeprecatedSince("2.0")
//       public SkullBuilder(@Nonnull String owner, @Nonnull String name, @Nonnull String... lore) {
//          super(Material.PLAYER_HEAD, name, lore);
//          this.setOwner(owner);
//       }
//
//       public SkullBuilder(@Nonnull UUID ownerUUID, @Nonnull String ownerName) {
//          super(Material.PLAYER_HEAD);
//          this.setOwner(ownerUUID, ownerName);
//       }
//
//       public SkullBuilder(@Nonnull UUID ownerUUID, @Nonnull String ownerName, @Nonnull Message message) {
//          super(Material.PLAYER_HEAD, message);
//          this.setOwner(ownerUUID, ownerName);
//       }
//
//       public SkullBuilder(@Nonnull UUID ownerUUID, @Nonnull String ownerName, @Nonnull ItemDescription description) {
//          super(Material.PLAYER_HEAD, description);
//          this.setOwner(ownerUUID, ownerName);
//       }
//
//       public SkullBuilder(@Nonnull UUID ownerUUID, @Nonnull String ownerName, @Nonnull String name, @Nonnull String... lore) {
//          super(Material.PLAYER_HEAD, name, lore);
//          this.setOwner(ownerUUID, ownerName);
//       }
//
//       /** @deprecated */
//       @Nonnull
//       @Deprecated
//       @DeprecatedSince("2.0")
//       @ReplaceWith("setOwner(UUID)")
//       public ItemBuilder.SkullBuilder setOwner(@Nonnull String owner) {
//          this.getMeta().setOwner(owner);
//          return this;
//       }
//
//       @Nonnull
//       public ItemBuilder.SkullBuilder setOwner(@Nonnull UUID uuid, @Nonnull String name) {
//          if (Challenges.getInstance().getDatabaseManager().isEnabled()) {
//             String textures = DatabaseHelper.getTextures(uuid);
//             if (textures != null) {
//                GameProfileUtils.applyTextures(this.getMeta(), uuid, name, textures);
//                return this;
//             }
//          }
//
//          this.setOwner(name);
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
//       public BannerBuilder(@Nonnull Material material, @Nonnull Message message) {
//          super(material, message);
//       }
//
//       public BannerBuilder(@Nonnull Material material, @Nonnull ItemDescription description) {
//          super(material, description);
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
