// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/comments/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/comments/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/comments/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // GET /api/comments - Fetch all comments
// export async function GET(req: Request) {
//   try {
//     const { searchParams } = new URL(req.url);
//     const page = parseInt(searchParams.get("page") || "1");
//     const limit = parseInt(searchParams.get("limit") || "10");
//     const postId = searchParams.get("postId");
//     const threadId = searchParams.get("threadId");
//     const sortBy = searchParams.get("sortBy") || "createdAt";
//     const sortOrder = searchParams.get("sortOrder") || "desc";
//
//     const skip = (page - 1) * limit;
//
//     // Build where clause
//     const where: any = {};
//     
//     if (postId) {
//       where.postId = postId;
//     }
//     
//     if (threadId) {
//       where.threadId = threadId;
//     }
//
//     // Build orderBy clause
//     const orderBy: any = {};
//     orderBy[sortBy] = sortOrder;
//
//     const comments = await db.comment.findMany({
//       where,
//       orderBy,
//       skip,
//       take: limit,
//       include: {
//         author: {
//           select: {
//             id: true,
//             name: true,
//             email: true,
//             avatar: true
//           }
//         },
//         replies: {
//           include: {
//             author: {
//               select: {
//                 id: true,
//                 name: true,
//                 email: true,
//                 avatar: true
//               }
//             }
//           }
//         }
//       }
//     });
//
//     const total = await db.comment.count({ where });
//
//     return NextResponse.json({
//       comments,
//       pagination: {
//         page,
//         limit,
//         total,
//         pages: Math.ceil(total / limit)
//       }
//     });
//   } catch (error) {
//     console.error("Error fetching comments:", error);
//     return NextResponse.json(
//       { error: "Failed to fetch comments" },
//       { status: 500 }
//     );
//   }
// }
//
// // POST /api/comments - Create a new comment
// export async function POST(req: Request) {
//   try {
//     const body = await req.json();
//     const { content, authorId, postId, threadId, parentId } = body;
//
//     // Validate required fields
//     if (!content || !authorId || (!postId && !threadId)) {
//       return NextResponse.json(
//         { error: "Content and authorId are required, and either postId or threadId must be provided" },
//         { status: 400 }
//       );
//     }
//
//     // Create the comment
//     const comment = await db.comment.create({
//       data: {
//         content,
//         author: {
//           connect: { id: authorId }
//         },
//         post: postId ? { connect: { id: postId } } : undefined,
//         thread: threadId ? { connect: { id: threadId } } : undefined,
//         parent: parentId ? { connect: { id: parentId } } : undefined
//       },
//       include: {
//         author: {
//           select: {
//             id: true,
//             name: true,
//             email: true,
//             avatar: true
//           }
//         },
//         replies: {
//           include: {
//             author: {
//               select: {
//                 id: true,
//                 name: true,
//                 email: true,
//                 avatar: true
//               }
//             }
//           }
//         }
//       }
//     });
//
//     return NextResponse.json(comment, { status: 201 });
//   } catch (error) {
//     console.error("Error creating comment:", error);
//     return NextResponse.json(
//       { error: "Failed to create comment" },
//       { status: 500 }
//     );
//   }
// }
