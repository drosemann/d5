// Goose-Port-Spiegel von: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/JVelocity.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/JVelocity.java");
}

// ---- Original-Code (projects/minecraft-plugins-server-systems-minecraft-anticheat/jinky/util/JVelocity.java), unveraendert, als Inline-Doku ----
// package me.jinky.util;
//
// import org.bukkit.Location;
//
// public class JVelocity {
//    private Location f;
//    private Location d;
//
//    public JVelocity(Location f, Location d) {
//       this.f = f;
//       this.d = d;
//    }
//
//    public double yoffset() {
//       Double ty = this.d.getY();
//       Double fy = this.f.getY();
//       return round(ty - fy, 3);
//    }
//
//    public double zoffset() {
//       Double tz = this.d.getZ();
//       Double fz = this.f.getZ();
//       return round(tz - fz, 3);
//    }
//
//    public double xoffset() {
//       Double tx = this.d.getX();
//       Double fx = this.f.getX();
//       return round(tx - fx, 3);
//    }
//
//    public double offsetnoy() {
//       Location fc = this.f.clone();
//       Location dc = this.d.clone();
//       fc.setY(0.0D);
//       dc.setY(0.0D);
//       return round(fc.distance(dc), 3);
//    }
//
//    public double offset() {
//       return round(this.f.distance(this.d), 3);
//    }
//
//    public static double round(double value, int places) {
//       if (places < 0) {
//          throw new IllegalArgumentException();
//       } else {
//          long factor = (long)Math.pow(10.0D, (double)places);
//          value *= (double)factor;
//          long tmp = Math.round(value);
//          return (double)tmp / (double)factor;
//       }
//    }
// }
//
