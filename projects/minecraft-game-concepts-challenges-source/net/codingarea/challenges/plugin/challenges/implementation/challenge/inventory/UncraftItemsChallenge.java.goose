// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/UncraftItemsChallenge.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/UncraftItemsChallenge.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/implementation/challenge/inventory/UncraftItemsChallenge.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.implementation.challenge.inventory;
//
// import java.util.ArrayList;
// import java.util.Iterator;
// import java.util.List;
// import javax.annotation.Nonnull;
// import javax.annotation.Nullable;
// import net.anweisen.utilities.bukkit.utils.misc.MinecraftVersion;
// import net.anweisen.utilities.common.annotations.Since;
// import net.codingarea.challenges.plugin.challenges.type.abstraction.TimedChallenge;
// import net.codingarea.challenges.plugin.content.Message;
// import net.codingarea.challenges.plugin.management.menu.MenuType;
// import net.codingarea.challenges.plugin.management.menu.generator.categorised.SettingCategory;
// import net.codingarea.challenges.plugin.utils.item.ItemBuilder;
// import net.codingarea.challenges.plugin.utils.misc.InventoryUtils;
// import org.bukkit.Bukkit;
// import org.bukkit.Material;
// import org.bukkit.entity.Player;
// import org.bukkit.inventory.FurnaceRecipe;
// import org.bukkit.inventory.ItemStack;
// import org.bukkit.inventory.PlayerInventory;
// import org.bukkit.inventory.Recipe;
// import org.bukkit.inventory.ShapedRecipe;
// import org.bukkit.inventory.ShapelessRecipe;
// import org.bukkit.inventory.SmithingRecipe;
//
// @Since("2.0.2")
// public class UncraftItemsChallenge extends TimedChallenge {
//    public UncraftItemsChallenge() {
//       super(MenuType.CHALLENGES, 5, 60, 20);
//       this.setCategory(SettingCategory.INVENTORY);
//    }
//
//    public static void uncraftInventory(@Nonnull Player player) {
//       PlayerInventory inventory = player.getInventory();
//       List itemsToAdd = new ArrayList();
//
//       for(int slot = 0; slot < inventory.getContents().length; ++slot) {
//          ItemStack item = inventory.getItem(slot);
//          if (item != null) {
//             List recipes = Bukkit.getRecipesFor(new ItemStack(item.getType()));
//             if (!recipes.isEmpty()) {
//                Recipe recipe = null;
//                Iterator var7 = recipes.iterator();
//
//                while(var7.hasNext()) {
//                   Recipe currentRecipe = (Recipe)var7.next();
//                   if (!canCraft(recipes, item.getType())) {
//                      recipe = currentRecipe;
//                   }
//                }
//
//                if (recipe != null) {
//                   ItemStack[] ingredients = (ItemStack[])getIngredientsOfRecipe(recipe).toArray(new ItemStack[0]);
//
//                   for(int i = 0; i < item.getAmount() / recipe.getResult().getAmount(); ++i) {
//                      ItemStack[] var9 = ingredients;
//                      int var10 = ingredients.length;
//
//                      for(int var11 = 0; var11 < var10; ++var11) {
//                         ItemStack ingredient = var9[var11];
//                         if (ingredient != null) {
//                            itemsToAdd.add(ingredient);
//                         }
//                      }
//                   }
//
//                   inventory.setItem(slot, (ItemStack)null);
//                }
//             }
//          }
//       }
//
//       itemsToAdd.forEach((itemStack) -> {
//          InventoryUtils.giveItem(player, itemStack);
//       });
//    }
//
//    private static boolean canCraft(List recipes, Material material) {
//       Iterator var2 = recipes.iterator();
//
//       label46:
//       while(var2.hasNext()) {
//          Recipe recipe = (Recipe)var2.next();
//          Iterator var4 = getIngredientsOfRecipe(recipe).iterator();
//
//          while(true) {
//             ItemStack ingredient;
//             do {
//                if (!var4.hasNext()) {
//                   continue label46;
//                }
//
//                ingredient = (ItemStack)var4.next();
//             } while(ingredient == null);
//
//             List ingredientRecipes = Bukkit.getRecipesFor(ingredient);
//             Iterator var7 = ingredientRecipes.iterator();
//
//             while(var7.hasNext()) {
//                Recipe ingredientRecipe = (Recipe)var7.next();
//                Iterator var9 = getIngredientsOfRecipe(ingredientRecipe).iterator();
//
//                while(var9.hasNext()) {
//                   ItemStack itemStack = (ItemStack)var9.next();
//                   if (itemStack != null && itemStack.getType() == material) {
//                      return true;
//                   }
//                }
//             }
//          }
//       }
//
//       return false;
//    }
//
//    private static List getIngredientsOfRecipe(@Nonnull Recipe recipe) {
//       List ingredients = new ArrayList();
//       if (recipe instanceof ShapedRecipe) {
//          ShapedRecipe shaped = (ShapedRecipe)recipe;
//          ingredients.addAll(shaped.getIngredientMap().values());
//       } else if (recipe instanceof ShapelessRecipe) {
//          ShapelessRecipe shapeless = (ShapelessRecipe)recipe;
//          ingredients.addAll(shapeless.getIngredientList());
//       } else if (recipe instanceof FurnaceRecipe) {
//          FurnaceRecipe furnace = (FurnaceRecipe)recipe;
//          ingredients.add(furnace.getInput());
//       } else if (MinecraftVersion.current().isNewerOrEqualThan(MinecraftVersion.V1_14) && recipe instanceof SmithingRecipe) {
//          SmithingRecipe smithing = (SmithingRecipe)recipe;
//          ingredients.add(smithing.getBase().getItemStack());
//          ingredients.add(smithing.getAddition().getItemStack());
//       }
//
//       return ingredients;
//    }
//
//    @Nonnull
//    public ItemBuilder createDisplayItem() {
//       return new ItemBuilder(Material.CRAFTING_TABLE, Message.forName("item-uncraft-challenge"));
//    }
//
//    @Nullable
//    protected String[] getSettingsDescription() {
//       return Message.forName("item-time-seconds-description").asArray(this.getValue());
//    }
//
//    protected int getSecondsUntilNextActivation() {
//       return this.getValue();
//    }
//
//    protected void onTimeActivation() {
//       this.restartTimer();
//       broadcastFiltered(UncraftItemsChallenge::uncraftInventory);
//    }
// }
//
