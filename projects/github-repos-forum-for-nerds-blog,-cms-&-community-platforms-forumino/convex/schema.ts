import { defineSchema, defineTable } from "convex/server";
import { v } from "convex/values";
import { authTables } from "@convex-dev/auth/server";

const applicationTables = {
  categories: defineTable({
    name: v.string(),
    description: v.string(),
    order: v.number(),
  }),

  threads: defineTable({
    title: v.string(),
    categoryId: v.id("categories"),
    authorId: v.id("users"),
    isPinned: v.optional(v.boolean()),
    isLocked: v.optional(v.boolean()),
    lastPostTime: v.number(),
  })
    .index("by_category", ["categoryId"])
    .index("by_recent", ["lastPostTime"]),

  posts: defineTable({
    threadId: v.id("threads"),
    authorId: v.id("users"),
    content: v.string(),
    isEdited: v.optional(v.boolean()),
  })
    .index("by_thread", ["threadId"]),
};

export default defineSchema({
  ...authTables,
  ...applicationTables,
});
