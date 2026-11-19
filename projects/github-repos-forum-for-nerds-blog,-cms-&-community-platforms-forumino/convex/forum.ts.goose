// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/forum.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/forum.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/forum.ts), unveraendert, als Inline-Doku ----
// import { v } from "convex/values";
// import { mutation, query } from "./_generated/server";
// import { getAuthUserId } from "@convex-dev/auth/server";
//
// // Categories
// export const listCategories = query({
//   args: {},
//   handler: async (ctx) => {
//     return await ctx.db
//       .query("categories")
//       .order("asc")
//       .collect();
//   },
// });
//
// export const createCategory = mutation({
//   args: {
//     name: v.string(),
//     description: v.string(),
//     order: v.number(),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//     
//     return await ctx.db.insert("categories", {
//       name: args.name,
//       description: args.description,
//       order: args.order,
//     });
//   },
// });
//
// // Threads
// export const listThreads = query({
//   args: {
//     categoryId: v.id("categories"),
//   },
//   handler: async (ctx, args) => {
//     const threads = await ctx.db
//       .query("threads")
//       .withIndex("by_category", (q) => q.eq("categoryId", args.categoryId))
//       .order("desc")
//       .collect();
//
//     return Promise.all(
//       threads.map(async (thread) => {
//         const author = await ctx.db.get(thread.authorId);
//         return { ...thread, author };
//       })
//     );
//   },
// });
//
// export const createThread = mutation({
//   args: {
//     categoryId: v.id("categories"),
//     title: v.string(),
//     initialPost: v.string(),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//
//     const threadId = await ctx.db.insert("threads", {
//       categoryId: args.categoryId,
//       title: args.title,
//       authorId: userId,
//       lastPostTime: Date.now(),
//     });
//
//     await ctx.db.insert("posts", {
//       threadId,
//       authorId: userId,
//       content: args.initialPost,
//     });
//
//     return threadId;
//   },
// });
//
// // Posts
// export const listPosts = query({
//   args: {
//     threadId: v.id("threads"),
//   },
//   handler: async (ctx, args) => {
//     const posts = await ctx.db
//       .query("posts")
//       .withIndex("by_thread", (q) => q.eq("threadId", args.threadId))
//       .collect();
//
//     return Promise.all(
//       posts.map(async (post) => {
//         const author = await ctx.db.get(post.authorId);
//         return { ...post, author };
//       })
//     );
//   },
// });
//
// export const createPost = mutation({
//   args: {
//     threadId: v.id("threads"),
//     content: v.string(),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//
//     await ctx.db.patch(args.threadId, {
//       lastPostTime: Date.now(),
//     });
//
//     return await ctx.db.insert("posts", {
//       threadId: args.threadId,
//       authorId: userId,
//       content: args.content,
//     });
//   },
// });
//
