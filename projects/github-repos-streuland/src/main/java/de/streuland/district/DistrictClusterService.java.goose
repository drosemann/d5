// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictClusterService.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictClusterService.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictClusterService.java), unveraendert, als Inline-Doku ----
// package de.streuland.district;
//
// import de.streuland.plot.Plot;
//
// import java.util.ArrayDeque;
// import java.util.ArrayList;
// import java.util.Collection;
// import java.util.HashSet;
// import java.util.List;
// import java.util.Queue;
// import java.util.Set;
//
// /**
//  * Builds clusters of neighboring plots to form districts.
//  */
// public class DistrictClusterService {
//     public List<Set<Plot>> clusterPlots(Collection<Plot> plots) {
//         List<Set<Plot>> clusters = new ArrayList<>();
//         Set<Plot> visited = new HashSet<>();
//
//         for (Plot plot : plots) {
//             if (visited.contains(plot)) {
//                 continue;
//             }
//             Set<Plot> cluster = new HashSet<>();
//             Queue<Plot> queue = new ArrayDeque<>();
//             queue.add(plot);
//             visited.add(plot);
//
//             while (!queue.isEmpty()) {
//                 Plot current = queue.poll();
//                 cluster.add(current);
//                 for (Plot other : plots) {
//                     if (!visited.contains(other) && areNeighbors(current, other)) {
//                         visited.add(other);
//                         queue.add(other);
//                     }
//                 }
//             }
//
//             clusters.add(cluster);
//         }
//         return clusters;
//     }
//
//
//
//     public List<Set<Plot>> clusterPlotsWithinDistance(Collection<Plot> plots, int distanceBlocks) {
//         List<Set<Plot>> clusters = new ArrayList<>();
//         Set<Plot> visited = new HashSet<>();
//
//         for (Plot plot : plots) {
//             if (visited.contains(plot)) {
//                 continue;
//             }
//             Set<Plot> cluster = new HashSet<>();
//             Queue<Plot> queue = new ArrayDeque<>();
//             queue.add(plot);
//             visited.add(plot);
//
//             while (!queue.isEmpty()) {
//                 Plot current = queue.poll();
//                 cluster.add(current);
//                 for (Plot other : plots) {
//                     if (!visited.contains(other) && withinDistance(current, other, distanceBlocks)) {
//                         visited.add(other);
//                         queue.add(other);
//                     }
//                 }
//             }
//
//             clusters.add(cluster);
//         }
//         return clusters;
//     }
//
//     private boolean areNeighbors(Plot a, Plot b) {
//         boolean overlapZ = a.getMinZ() < b.getMaxZ() && a.getMaxZ() > b.getMinZ();
//         boolean overlapX = a.getMinX() < b.getMaxX() && a.getMaxX() > b.getMinX();
//
//         boolean touchingX = a.getMaxX() == b.getMinX() || b.getMaxX() == a.getMinX();
//         boolean touchingZ = a.getMaxZ() == b.getMinZ() || b.getMaxZ() == a.getMinZ();
//
//         return (touchingX && overlapZ) || (touchingZ && overlapX);
//     }
//
//     private boolean withinDistance(Plot a, Plot b, int distanceBlocks) {
//         return a.distance(b) <= distanceBlocks;
//     }
//
// }
//
