// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-photoshare/convex/schema.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-photoshare/convex/schema.ts");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-photoshare/convex/schema.ts), unveraendert, als Inline-Doku ----
// import { defineSchema, defineTable } from "convex/server";
// import { authTables } from "@convex-dev/auth/server";
// import { v } from "convex/values";
//
// const applicationTables = {
//   photos: defineTable({
//     storageId: v.id("_storage"),
//     userId: v.id("users"),
//     description: v.optional(v.string()),
//   }).index("by_user", ["userId"]),
//   
//   likes: defineTable({
//     photoId: v.id("photos"),
//     userId: v.id("users"),
//   })
//     .index("by_photo", ["photoId"])
//     .index("by_user_and_photo", ["userId", "photoId"]),
// };
//
// export default defineSchema({
//   ...authTables,
//   ...applicationTables,
// });
//
