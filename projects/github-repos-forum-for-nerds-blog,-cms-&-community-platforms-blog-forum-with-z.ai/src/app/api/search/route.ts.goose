// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/search/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/search/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/search/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // GET /api/search - Search across posts, threads, and users
// export async function GET(req: Request) {
//   try {
//     const { searchParams } = new URL(req.url);
//     const query = searchParams.get("q");
//     const type = searchParams.get("type"); // posts, threads, users, all
//     const page = parseInt(searchParams.get("page") || "1");
//     const limit = parseInt(searchParams.get("limit") || "10");
//
//     const skip = (page - 1) * limit;
//
//     // Validate query
//     if (!query || query.trim().length === 0) {
//       return NextResponse.json(
//         { error: "Search query is required" },
//         { status: 400 }
//       );
//     }
//
//     const searchQuery = query.trim();
//     const results: any = {};
//
//     // Search posts
//     if (!type || type === "posts" || type === "all") {
//       const posts = await db.post.findMany({
//         where: {
//           OR: [
//             { title: { contains: searchQuery, mode: "insensitive" } },
//             { content: { contains: searchQuery, mode: "insensitive" } },
//             { excerpt: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         },
//         skip,
//         take: limit,
//         include: {
//           author: {
//             select: {
//               id: true,
//               name: true,
//               email: true,
//               avatar: true
//             }
//           },
//           tags: true
//         },
//         orderBy: {
//           createdAt: "desc"
//         }
//       });
//
//       const totalPosts = await db.post.count({
//         where: {
//           OR: [
//             { title: { contains: searchQuery, mode: "insensitive" } },
//             { content: { contains: searchQuery, mode: "insensitive" } },
//             { excerpt: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         }
//       });
//
//       results.posts = {
//         data: posts,
//         pagination: {
//           page,
//           limit,
//           total: totalPosts,
//           pages: Math.ceil(totalPosts / limit)
//         }
//       };
//     }
//
//     // Search threads
//     if (!type || type === "threads" || type === "all") {
//       const threads = await db.thread.findMany({
//         where: {
//           OR: [
//             { title: { contains: searchQuery, mode: "insensitive" } },
//             { content: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         },
//         skip,
//         take: limit,
//         include: {
//           author: {
//             select: {
//               id: true,
//               name: true,
//               email: true,
//               avatar: true
//             }
//           }
//         },
//         orderBy: {
//           createdAt: "desc"
//         }
//       });
//
//       const totalThreads = await db.thread.count({
//         where: {
//           OR: [
//             { title: { contains: searchQuery, mode: "insensitive" } },
//             { content: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         }
//       });
//
//       results.threads = {
//         data: threads,
//         pagination: {
//           page,
//           limit,
//           total: totalThreads,
//           pages: Math.ceil(totalThreads / limit)
//         }
//       };
//     }
//
//     // Search users
//     if (!type || type === "users" || type === "all") {
//       const users = await db.user.findMany({
//         where: {
//           OR: [
//             { name: { contains: searchQuery, mode: "insensitive" } },
//             { email: { contains: searchQuery, mode: "insensitive" } },
//             { bio: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         },
//         skip,
//         take: limit,
//         select: {
//           id: true,
//           email: true,
//           name: true,
//           avatar: true,
//           bio: true,
//           role: true,
//           createdAt: true
//         },
//         orderBy: {
//           createdAt: "desc"
//         }
//       });
//
//       const totalUsers = await db.user.count({
//         where: {
//           OR: [
//             { name: { contains: searchQuery, mode: "insensitive" } },
//             { email: { contains: searchQuery, mode: "insensitive" } },
//             { bio: { contains: searchQuery, mode: "insensitive" } }
//           ]
//         }
//       });
//
//       results.users = {
//         data: users,
//         pagination: {
//           page,
//           limit,
//           total: totalUsers,
//           pages: Math.ceil(totalUsers / limit)
//         }
//       };
//     }
//
//     // Search tags
//     if (!type || type === "tags" || type === "all") {
//       const tags = await db.tag.findMany({
//         where: {
//           name: { contains: searchQuery, mode: "insensitive" }
//         },
//         skip,
//         take: limit,
//         orderBy: {
//           name: "asc"
//         }
//       });
//
//       const totalTags = await db.tag.count({
//         where: {
//           name: { contains: searchQuery, mode: "insensitive" }
//         }
//       });
//
//       results.tags = {
//         data: tags,
//         pagination: {
//           page,
//           limit,
//           total: totalTags,
//           pages: Math.ceil(totalTags / limit)
//         }
//       };
//     }
//
//     return NextResponse.json(results);
//   } catch (error) {
//     console.error("Error searching:", error);
//     return NextResponse.json(
//       { error: "Failed to perform search" },
//       { status: 500 }
//     );
//   }
// }
