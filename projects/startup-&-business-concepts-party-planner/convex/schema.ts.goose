// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/convex/schema.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/convex/schema.ts");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/convex/schema.ts), unveraendert, als Inline-Doku ----
// import { defineSchema, defineTable } from "convex/server";
// import { authTables } from "@convex-dev/auth/server";
// import { v } from "convex/values";
//
// const applicationTables = {
//   events: defineTable({
//     title: v.string(),
//     description: v.string(),
//     date: v.string(),
//     location: v.string(),
//     hostId: v.id("users"),
//   }).index("by_host", ["hostId"]),
//   
//   invitations: defineTable({
//     eventId: v.id("events"),
//     userId: v.id("users"),
//     status: v.string(), // "pending", "accepted", "declined"
//   })
//     .index("by_event", ["eventId"])
//     .index("by_user", ["userId"])
// };
//
// export default defineSchema({
//   ...authTables,
//   ...applicationTables,
// });
//
