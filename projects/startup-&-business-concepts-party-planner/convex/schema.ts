import { defineSchema, defineTable } from "convex/server";
import { authTables } from "@convex-dev/auth/server";
import { v } from "convex/values";

const applicationTables = {
  events: defineTable({
    title: v.string(),
    description: v.string(),
    date: v.string(),
    location: v.string(),
    hostId: v.id("users"),
  }).index("by_host", ["hostId"]),
  
  invitations: defineTable({
    eventId: v.id("events"),
    userId: v.id("users"),
    status: v.string(), // "pending", "accepted", "declined"
  })
    .index("by_event", ["eventId"])
    .index("by_user", ["userId"])
};

export default defineSchema({
  ...authTables,
  ...applicationTables,
});
