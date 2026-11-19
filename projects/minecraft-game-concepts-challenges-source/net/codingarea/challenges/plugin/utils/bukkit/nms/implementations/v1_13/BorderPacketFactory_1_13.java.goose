// Goose-Port-Spiegel von: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/BorderPacketFactory_1_13.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/BorderPacketFactory_1_13.java");
}

// ---- Original-Code (projects/minecraft-game-concepts-challenges-source/net/codingarea/challenges/plugin/utils/bukkit/nms/implementations/v1_13/BorderPacketFactory_1_13.java), unveraendert, als Inline-Doku ----
// package net.codingarea.challenges.plugin.utils.bukkit.nms.implementations.v1_13;
//
// import net.codingarea.challenges.plugin.Challenges;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.NMSUtils;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.ReflectionUtil;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.type.BorderPacketFactory;
// import net.codingarea.challenges.plugin.utils.bukkit.nms.type.PacketBorder;
//
// public class BorderPacketFactory_1_13 extends BorderPacketFactory {
//    public Object center(PacketBorder packetBorder) {
//       return this.createPacket(packetBorder, "SET_CENTER");
//    }
//
//    public Object size(PacketBorder packetBorder) {
//       return this.createPacket(packetBorder, "SET_SIZE");
//    }
//
//    public Object warningDelay(PacketBorder packetBorder) {
//       return this.createPacket(packetBorder, "SET_WARNING_TIME");
//    }
//
//    public Object warningDistance(PacketBorder packetBorder) {
//       return this.createPacket(packetBorder, "SET_WARNING_BLOCKS");
//    }
//
//    private Object createPacket(PacketBorder packetBorder, String worldBorderAction) {
//       try {
//          Class clazz = NMSUtils.getClass("PacketPlayOutWorldBorder");
//          Class actionClazz = NMSUtils.getClass("PacketPlayOutWorldBorder$EnumWorldBorderAction");
//          Object[] var5 = actionClazz.getEnumConstants();
//          int var6 = var5.length;
//
//          for(int var7 = 0; var7 < var6; ++var7) {
//             Object enumConstant = var5[var7];
//             if (enumConstant.toString().equalsIgnoreCase(worldBorderAction)) {
//                return ReflectionUtil.invokeConstructor(clazz, new Class[]{packetBorder.getNMSClass(), actionClazz}, new Object[]{packetBorder.getWorldBorderObject(), enumConstant});
//             }
//          }
//       } catch (Exception var9) {
//          Challenges.getInstance().getLogger().error("Failed to create packet for action {}:", new Object[]{worldBorderAction, var9});
//       }
//
//       return null;
//    }
// }
//
