// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/tags/[id]/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/tags/[id]/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/tags/[id]/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // GET /api/tags/[id] - Fetch a single tag by ID
// export async function GET(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const tag = await db.tag.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!tag) {
//       return NextResponse.json(
//         { error: "Tag not found" },
//         { status: 404 }
//       );
//     }
//
//     return NextResponse.json(tag);
//   } catch (error) {
//     console.error("Error fetching tag:", error);
//     return NextResponse.json(
//       { error: "Failed to fetch tag" },
//       { status: 500 }
//     );
//   }
// }
//
// // PUT /api/tags/[id] - Update a tag by ID
// export async function PUT(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     const body = await req.json();
//     const { name } = body;
//
//     // Check if tag exists
//     const existingTag = await db.tag.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingTag) {
//       return NextResponse.json(
//         { error: "Tag not found" },
//         { status: 404 }
//       );
//     }
//
//     // Check if another tag with the same name exists
//     if (name && name !== existingTag.name) {
//       const duplicateTag = await db.tag.findUnique({
//         where: { name }
//       });
//       
//       if (duplicateTag) {
//         return NextResponse.json(
//           { error: "A tag with this name already exists" },
//           { status: 400 }
//         );
//       }
//     }
//
//     // Update the tag
//     const tag = await db.tag.update({
//       where: { id: params.id },
//       data: { name }
//     });
//
//     return NextResponse.json(tag);
//   } catch (error) {
//     console.error("Error updating tag:", error);
//     return NextResponse.json(
//       { error: "Failed to update tag" },
//       { status: 500 }
//     );
//   }
// }
//
// // DELETE /api/tags/[id] - Delete a tag by ID
// export async function DELETE(
//   req: Request,
//   { params }: { params: { id: string } }
// ) {
//   try {
//     // Check if tag exists
//     const existingTag = await db.tag.findUnique({
//       where: { id: params.id }
//     });
//
//     if (!existingTag) {
//       return NextResponse.json(
//         { error: "Tag not found" },
//         { status: 404 }
//       );
//     }
//
//     // Delete the tag
//     await db.tag.delete({
//       where: { id: params.id }
//     });
//
//     return NextResponse.json({ message: "Tag deleted successfully" });
//   } catch (error) {
//     console.error("Error deleting tag:", error);
//     return NextResponse.json(
//       { error: "Failed to delete tag" },
//       { status: 500 }
//     );
//   }
// }
