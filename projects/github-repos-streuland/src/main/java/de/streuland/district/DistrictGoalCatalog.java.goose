// Goose-Port-Spiegel von: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictGoalCatalog.java
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictGoalCatalog.java");
}

// ---- Original-Code (projects/github-repos-streuland/src/main/java/de/streuland/district/DistrictGoalCatalog.java), unveraendert, als Inline-Doku ----
// package de.streuland.district;
//
// import java.util.ArrayList;
// import java.util.List;
//
// /**
//  * Example goal catalog for districts.
//  */
// public class DistrictGoalCatalog {
//     public List<DistrictGoal> getDefaultGoals() {
//         List<DistrictGoal> goals = new ArrayList<>();
//         goals.add(new BuiltBlocksGoal("goal_blocks_500", "Baue 500 Blöcke im Viertel", 500));
//         goals.add(new BuiltBlocksGoal("goal_blocks_2000", "Baue 2000 Blöcke im Viertel", 2000));
//         return goals;
//     }
//
//     private static class BuiltBlocksGoal implements DistrictGoal {
//         private final String id;
//         private final String description;
//         private final int requiredBlocks;
//
//         private BuiltBlocksGoal(String id, String description, int requiredBlocks) {
//             this.id = id;
//             this.description = description;
//             this.requiredBlocks = requiredBlocks;
//         }
//
//         @Override
//         public String getId() {
//             return id;
//         }
//
//         @Override
//         public String getDescription() {
//             return description;
//         }
//
//         @Override
//         public boolean isCompleted(District district) {
//             return district.getProgress().getBuiltBlocks() >= requiredBlocks;
//         }
//     }
// }
//
