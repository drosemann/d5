// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/SpawnEntityAction.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/SpawnEntityAction.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/challenges/custom/settings/action/impl/SpawnEntityAction.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.challenges.custom.settings.action.impl;
//
// import java.util.Map;
// import net.anweisen.utilities.bukkit.utils.logging.Logger;
// import net.codingarea.challenges.plugin.challenges.custom.settings.action.EntityTargetAction;
// import net.codingarea.challenges.plugin.challenges.type.helper.SubSettingsHelper;
// import org.bukkit.Material;
// import org.bukkit.World;
// import org.bukkit.entity.Entity;
// import org.bukkit.entity.EntityType;
//
// public class SpawnEntityAction extends EntityTargetAction {
//    public SpawnEntityAction(String name) {
//       super(name, SubSettingsHelper.createEntityTargetSettingsBuilder(false).addChild(SubSettingsHelper.createEntityTypeSettingsBuilder(false, false)));
//    }
//
//    public Material getMaterial() {
//       return Material.ZOMBIE_SPAWN_EGG;
//    }
//
//    public void executeFor(Entity entity, Map subActions) {
//       if (entity.getLocation().getWorld() != null) {
//          String[] args = (String[])subActions.get("entity_type");
//          String[] var4 = args;
//          int var5 = args.length;
//
//          for(int var6 = 0; var6 < var5; ++var6) {
//             String arg = var4[var6];
//
//             try {
//                EntityType type = EntityType.valueOf(arg);
//                World world = entity.getLocation().getWorld();
//                world.spawnEntity(entity.getLocation(), type);
//             } catch (Exception var10) {
//                Logger.error("", var10);
//             }
//          }
//
//       }
//    }
// }
//
