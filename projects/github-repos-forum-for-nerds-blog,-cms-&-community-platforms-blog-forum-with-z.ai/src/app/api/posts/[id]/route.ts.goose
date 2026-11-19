// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/posts/[id]/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/posts/[id]/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/posts/[id]/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // GET /api/posts/[id] - Fetch a single post by ID
// export async function GET(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const post = await db.post.findUnique({
//       where: { id: params.id },
//       include: {
//         author: {
//           select: {
//             id: true,
//             name: true,
//             email: true,
//             avatar: true
//           }
//         },
//         tags: true
//       }
//     });
//
//     if (!post) {
//       return NextResponse.json(
//         { error: "Post not found" },
//         { status: 404 }
//       );
//     }
//
//     // Increment view count
//     await db.post.update({
//       where: { id: params.id },
//       data: { views: { increment: 1 } }
//     });
//
//     return NextResponse.json(post);
//   } catch (error) {
//     console.error("Error fetching post:", error);
//     return NextResponse.json(
//       { error: "Failed to fetch post" },
//       { status: 500 }
//     );
//   }
// }
//
// // PUT /api/posts/[id] - Update a post by ID
// export async function PUT(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const body = await req.json();
//     const { title, content, excerpt, tags, category, featured, status } = body;
//
//     // Check if post exists
//     const existingPost = await db.post.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingPost) {
//       return NextResponse.json(
//         { error: "Post not found" },
//         { status: 404 }
//       );
//     }
//
//     // Update the post
//     const post = await db.post.update({
//       where: { id: params.id },
//       data: {
//         title,
//         content,
//         excerpt,
//         category,
//         featured,
//         status,
//         tags: {
//           set: [],
//           connectOrCreate: tags?.map((tag: string) => ({
//             where: { name: tag },
//             create: { name: tag }
//           })) || []
//         }
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
//         tags: true
//       }
//     });
//
//     return NextResponse.json(post);
//   } catch (error) {
//     console.error("Error updating post:", error);
//     return NextResponse.json(
//       { error: "Failed to update post" },
//       { status: 500 }
//     );
//   }
// }
//
// // DELETE /api/posts/[id] - Delete a post by ID
// export async function DELETE(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     // Check if post exists
//     const existingPost = await db.post.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingPost) {
//       return NextResponse.json(
//         { error: "Post not found" },
//         { status: 404 }
//       );
//     }
//
//     // Delete the post
//     await db.post.delete({
//       where: { id: params.id }
//     });
//
//     return NextResponse.json({ message: "Post deleted successfully" });
//   } catch (error) {
//     console.error("Error deleting post:", error);
//     return NextResponse.json(
//       { error: "Failed to delete post" },
//       { status: 500 }
//     );
//   }
// }
