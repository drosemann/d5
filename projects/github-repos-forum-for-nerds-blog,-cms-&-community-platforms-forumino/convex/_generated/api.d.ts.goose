// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/_generated/api.d.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/_generated/api.d.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/convex/_generated/api.d.ts), unveraendert, als Inline-Doku ----
// /* eslint-disable */
// /**
//  * Generated `api` utility.
//  *
//  * THIS CODE IS AUTOMATICALLY GENERATED.
//  *
//  * To regenerate, run `npx convex dev`.
//  * @module
//  */
//
// import type {
//   ApiFromModules,
//   FilterApi,
//   FunctionReference,
// } from "convex/server";
// import type * as auth from "../auth.js";
// import type * as forum from "../forum.js";
// import type * as http from "../http.js";
//
// /**
//  * A utility for referencing Convex functions in your app's API.
//  *
//  * Usage:
//  * ```js
//  * const myFunctionReference = api.myModule.myFunction;
//  * ```
//  */
// declare const fullApi: ApiFromModules<{
//   auth: typeof auth;
//   forum: typeof forum;
//   http: typeof http;
// }>;
// export declare const api: FilterApi<
//   typeof fullApi,
//   FunctionReference<any, "public">
// >;
// export declare const internal: FilterApi<
//   typeof fullApi,
//   FunctionReference<any, "internal">
// >;
//
