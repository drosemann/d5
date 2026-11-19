// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/convex/invitations.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/convex/invitations.ts");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/convex/invitations.ts), unveraendert, als Inline-Doku ----
// import { mutation, query } from "./_generated/server";
// import { v } from "convex/values";
// import { getAuthUserId } from "@convex-dev/auth/server";
//
// export const invite = mutation({
//   args: {
//     eventId: v.id("events"),
//     email: v.string(),
//   },
//   handler: async (ctx, args) => {
//     const hostId = await getAuthUserId(ctx);
//     if (!hostId) throw new Error("Not authenticated");
//     
//     const event = await ctx.db.get(args.eventId);
//     if (!event || event.hostId !== hostId) {
//       throw new Error("Not authorized");
//     }
//     
//     const invitedUser = await ctx.db
//       .query("users")
//       .withIndex("email", q => q.eq("email", args.email))
//       .unique();
//     
//     if (!invitedUser) throw new Error("User not found");
//     
//     return await ctx.db.insert("invitations", {
//       eventId: args.eventId,
//       userId: invitedUser._id,
//       status: "pending",
//     });
//   },
// });
//
// export const respond = mutation({
//   args: {
//     eventId: v.id("events"),
//     status: v.string(),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) throw new Error("Not authenticated");
//     
//     const invitation = await ctx.db
//       .query("invitations")
//       .withIndex("by_user", q => q.eq("userId", userId))
//       .filter(q => q.eq(q.field("eventId"), args.eventId))
//       .unique();
//     
//     if (!invitation) throw new Error("Invitation not found");
//     
//     await ctx.db.patch(invitation._id, {
//       status: args.status,
//     });
//   },
// });
//
// export const getEventInvites = query({
//   args: {
//     eventId: v.id("events"),
//   },
//   handler: async (ctx, args) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) return [];
//     
//     const event = await ctx.db.get(args.eventId);
//     if (!event || event.hostId !== userId) {
//       throw new Error("Not authorized");
//     }
//     
//     const invites = await ctx.db
//       .query("invitations")
//       .withIndex("by_event", q => q.eq("eventId", args.eventId))
//       .collect();
//     
//     const users = await Promise.all(
//       invites.map(invite => ctx.db.get(invite.userId))
//     );
//     
//     return invites.map((invite, i) => ({
//       ...invite,
//       user: users[i],
//     }));
//   },
// });
//
