// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-sharebox/convex/files.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-sharebox/convex/files.ts");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-sharebox/convex/files.ts), unveraendert, als Inline-Doku ----
// import { v } from "convex/values";
// import { mutation, query, action } from "./_generated/server";
// import { getAuthUserId } from "@convex-dev/auth/server";
//
// export const generateUploadUrl = mutation({
//   args: {},
//   handler: async (ctx) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//     return await ctx.storage.generateUploadUrl();
//   },
// });
//
// export const saveFile = mutation({
//   args: {
//     storageId: v.id("_storage"),
//     name: v.string(),
//     type: v.string(),
//     size: v.number(),
//     description: v.optional(v.string()),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//
//     await ctx.db.insert("files", {
//       storageId: args.storageId,
//       name: args.name,
//       type: args.type,
//       size: args.size,
//       ownerId: userId,
//       description: args.description,
//     });
//   },
// });
//
// export const listFiles = query({
//   args: {},
//   handler: async (ctx) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) return [];
//
//     const files = await ctx.db
//       .query("files")
//       .withIndex("by_owner", (q) => q.eq("ownerId", userId))
//       .collect();
//
//     return await Promise.all(
//       files.map(async (file) => ({
//         ...file,
//         url: await ctx.storage.getUrl(file.storageId),
//       }))
//     );
//   },
// });
//
// export const deleteFile = mutation({
//   args: {
//     fileId: v.id("files"),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//
//     const file = await ctx.db.get(args.fileId);
//     if (!file) throw new Error("File not found");
//     if (file.ownerId !== userId) throw new Error("Not authorized");
//
//     await ctx.storage.delete(file.storageId);
//     await ctx.db.delete(args.fileId);
//   },
// });
//
