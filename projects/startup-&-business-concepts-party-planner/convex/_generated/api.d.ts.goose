// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/convex/_generated/api.d.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/convex/_generated/api.d.ts");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/convex/_generated/api.d.ts), unveraendert, als Inline-Doku ----
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
// import type * as events from "../events.js";
// import type * as http from "../http.js";
// import type * as invitations from "../invitations.js";
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
//   events: typeof events;
//   http: typeof http;
//   invitations: typeof invitations;
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
