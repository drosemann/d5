import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";
import { authTables } from "@convex-dev/auth/server";

const applicationTables = {
  files: defineTable({
    name: v.string(),
    storageId: v.id("_storage"),
    size: v.number(),
    type: v.string(),
    ownerId: v.id("users"),
    description: v.optional(v.string()),
  }).index("by_owner", ["ownerId"]),
};

export default defineSchema({
  ...authTables,
  ...applicationTables,
});
