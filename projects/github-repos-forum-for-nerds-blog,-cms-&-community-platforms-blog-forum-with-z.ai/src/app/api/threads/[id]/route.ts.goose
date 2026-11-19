// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/threads/[id]/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/threads/[id]/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/threads/[id]/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // GET /api/threads/[id] - Fetch a single thread by ID
// export async function GET(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const thread = await db.thread.findUnique({
//       where: { id: params.id },
//       include: {
//         author: {
//           select: {
//             id: true,
//             name: true,
//             email: true,
//             avatar: true
//           }
//         }
//       }
//     });
//
//     if (!thread) {
//       return NextResponse.json(
//         { error: "Thread not found" },
//         { status: 404 }
//       );
//     }
//
//     // Increment view count
//     await db.thread.update({
//       where: { id: params.id },
//       data: { views: { increment: 1 } }
//     });
//
//     return NextResponse.json(thread);
//   } catch (error) {
//     console.error("Error fetching thread:", error);
//     return NextResponse.json(
//       { error: "Failed to fetch thread" },
//       { status: 500 }
//     );
//   }
// }
//
// // PUT /api/threads/[id] - Update a thread by ID
// export async function PUT(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const body = await req.json();
//     const { title, content, category, tags, pinned, locked, trending } = body;
//
//     // Check if thread exists
//     const existingThread = await db.thread.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingThread) {
//       return NextResponse.json(
//         { error: "Thread not found" },
//         { status: 404 }
//       );
//     }
//
//     // Update the thread
//     const thread = await db.thread.update({
//       where: { id: params.id },
//       data: {
//         title,
//         content,
//         category,
//         tags,
//         pinned,
//         locked,
//         trending
//       },
//       include: {
//         author: {
//           select: {
//             id: true,
//             name: true,
//             email: true,
//             avatar: true
//           }
//         }
//       }
//     });
//
//     return NextResponse.json(thread);
//   } catch (error) {
//     console.error("Error updating thread:", error);
//     return NextResponse.json(
//       { error: "Failed to update thread" },
//       { status: 500 }
//     );
//   }
// }
//
// // DELETE /api/threads/[id] - Delete a thread by ID
// export async function DELETE(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     // Check if thread exists
//     const existingThread = await db.thread.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingThread) {
//       return NextResponse.json(
//         { error: "Thread not found" },
//         { status: 404 }
//       );
//     }
//
//     // Delete the thread
//     await db.thread.delete({
//       where: { id: params.id }
//     });
//
//     return NextResponse.json({ message: "Thread deleted successfully" });
//   } catch (error) {
//     console.error("Error deleting thread:", error);
//     return NextResponse.json(
//       { error: "Failed to delete thread" },
//       { status: 500 }
//     );
//   }
// }
