// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/StructureUtils.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/StructureUtils.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/misc/StructureUtils.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.misc;
//
// import org.bukkit.Material;
// import org.bukkit.StructureType;
//
// public class StructureUtils {
//    public static Material getStructureIcon(StructureType structureType) {
//       String var1 = structureType.getName();
//       byte var2 = -1;
//       switch(var1.hashCode()) {
//       case -2125031867:
//          if (var1.equals("buried_treasure")) {
//             var2 = 9;
//          }
//          break;
//       case -1342343896:
//          if (var1.equals("swamp_hut")) {
//             var2 = 11;
//          }
//          break;
//       case -767287346:
//          if (var1.equals("jungle_pyramid")) {
//             var2 = 1;
//          }
//          break;
//       case -542423082:
//          if (var1.equals("stronghold")) {
//             var2 = 14;
//          }
//          break;
//       case -317934649:
//          if (var1.equals("monument")) {
//             var2 = 2;
//          }
//          break;
//       case -133189701:
//          if (var1.equals("pillager_outpost")) {
//             var2 = 10;
//          }
//          break;
//       case 88800038:
//          if (var1.equals("desert_pyramid")) {
//             var2 = 3;
//          }
//          break;
//       case 100145518:
//          if (var1.equals("igloo")) {
//             var2 = 12;
//          }
//          break;
//       case 176653641:
//          if (var1.equals("ocean_ruin")) {
//             var2 = 5;
//          }
//          break;
//       case 460367020:
//          if (var1.equals("village")) {
//             var2 = 13;
//          }
//          break;
//       case 481037086:
//          if (var1.equals("fortress")) {
//             var2 = 8;
//          }
//          break;
//       case 487782972:
//          if (var1.equals("bastion_remnant")) {
//             var2 = 6;
//          }
//          break;
//       case 709551623:
//          if (var1.equals("mineshaft")) {
//             var2 = 4;
//          }
//          break;
//       case 835798799:
//          if (var1.equals("mansion")) {
//             var2 = 16;
//          }
//          break;
//       case 1035681380:
//          if (var1.equals("ruined_portal")) {
//             var2 = 17;
//          }
//          break;
//       case 1183281686:
//          if (var1.equals("shipwreck")) {
//             var2 = 7;
//          }
//          break;
//       case 1374700947:
//          if (var1.equals("nether_fossil")) {
//             var2 = 0;
//          }
//          break;
//       case 1725045327:
//          if (var1.equals("end_city")) {
//             var2 = 15;
//          }
//       }
//
//       switch(var2) {
//       case 0:
//          return Material.BONE_BLOCK;
//       case 1:
//          return Material.LEVER;
//       case 2:
//          return Material.SEA_LANTERN;
//       case 3:
//          return Material.SANDSTONE_STAIRS;
//       case 4:
//          return Material.RAIL;
//       case 5:
//          return Material.DROWNED_SPAWN_EGG;
//       case 6:
//          return Material.BLACKSTONE;
//       case 7:
//          return Material.OAK_BOAT;
//       case 8:
//          return Material.NETHER_BRICK_FENCE;
//       case 9:
//          return Material.CHEST;
//       case 10:
//          return Material.CROSSBOW;
//       case 11:
//          return Material.CAULDRON;
//       case 12:
//          return Material.SNOW_BLOCK;
//       case 13:
//          return Material.VILLAGER_SPAWN_EGG;
//       case 14:
//          return Material.END_PORTAL_FRAME;
//       case 15:
//          return Material.PURPUR_PILLAR;
//       case 16:
//          return Material.TOTEM_OF_UNDYING;
//       case 17:
//          return Material.CRYING_OBSIDIAN;
//       default:
//          return Material.STRUCTURE_VOID;
//       }
//    }
// }
//
