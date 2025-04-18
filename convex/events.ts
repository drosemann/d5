import { mutation, query } from "./_generated/server";
import { v } from "convex/values";
import { getAuthUserId } from "@convex-dev/auth/server";

export const create = mutation({
  args: {
    title: v.string(),
    description: v.string(),
    date: v.string(),
    location: v.string(),
  },
  handler: async (ctx, args) => {
    const userId = await getAuthUserId(ctx);
    if (!userId) throw new Error("Not authenticated");
    
    return await ctx.db.insert("events", {
      ...args,
      hostId: userId,
    });
  },
});

export const listMyEvents = query({
  handler: async (ctx) => {
    const userId = await getAuthUserId(ctx);
    if (!userId) return [];
    
    return await ctx.db
      .query("events")
      .withIndex("by_host", (q) => q.eq("hostId", userId))
      .collect();
  },
});

export const listInvitedEvents = query({
  handler: async (ctx) => {
    const userId = await getAuthUserId(ctx);
    if (!userId) return [];
    
    const invitations = await ctx.db
      .query("invitations")
      .withIndex("by_user", (q) => q.eq("userId", userId))
      .collect();
    
    const events = await Promise.all(
      invitations.map(invite => ctx.db.get(invite.eventId))
    );
    
    return events.filter(event => event !== null);
  },
});
