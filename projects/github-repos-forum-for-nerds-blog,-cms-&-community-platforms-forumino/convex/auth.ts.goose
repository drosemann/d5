// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/auth.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/auth.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/auth.ts), unveraendert, als Inline-Doku ----
// import { convexAuth, getAuthUserId } from "@convex-dev/auth/server";
// import { Password } from "@convex-dev/auth/providers/Password";
// import { Anonymous } from "@convex-dev/auth/providers/Anonymous";
// import { query } from "./_generated/server";
//
// export const { auth, signIn, signOut, store, isAuthenticated } = convexAuth({
//   providers: [Password, Anonymous],
// });
//
// export const loggedInUser = query({
//   handler: async (ctx) => {
//     const userId = await getAuthUserId(ctx);
//     if (!userId) {
//       return null;
//     }
//     const user = await ctx.db.get(userId);
//     if (!user) {
//       return null;
//     }
//     return user;
//   },
// });
//
