import { defineSchema, defineTable } from "convex/server";
import { authTables } from "@convex-dev/auth/server";
import { v } from "convex/values";

const applicationTables = {
  photos: defineTable({
    storageId: v.id("_storage"),
    userId: v.id("users"),
    description: v.optional(v.string()),
  }).index("by_user", ["userId"]),
  
  likes: defineTable({
    photoId: v.id("photos"),
    userId: v.id("users"),
  })
    .index("by_photo", ["photoId"])
    .index("by_user_and_photo", ["userId", "photoId"]),
};

export default defineSchema({
  ...authTables,
  ...applicationTables,
});
