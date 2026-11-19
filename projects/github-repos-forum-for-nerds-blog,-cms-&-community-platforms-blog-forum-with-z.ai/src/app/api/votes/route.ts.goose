// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/votes/route.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/votes/route.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/app/api/votes/route.ts), unveraendert, als Inline-Doku ----
// import { NextResponse } from "next/server";
// import { db } from "@/lib/db";
//
// // POST /api/votes - Create or update a vote
// export async function POST(req: Request) {
//   try {
//     const body = await req.json();
//     const { userId, postId, threadId, commentId, value } = body;
//
//     // Validate required fields
//     if (!userId || !value || Math.abs(value) !== 1) {
//       return NextResponse.json(
//         { error: "userId and value (1 or -1) are required" },
//         { status: 400 }
//       );
//     }
//
//     // Validate that exactly one of postId, threadId, or commentId is provided
//     const targetCount = [postId, threadId, commentId].filter(Boolean).length;
//     if (targetCount !== 1) {
//       return NextResponse.json(
//         { error: "Exactly one of postId, threadId, or commentId must be provided" },
//         { status: 400 }
//       );
//     }
//
//     // Check if a vote already exists for this user and target
//     const existingVote = await db.vote.findUnique({
//       where: {
//         userId_postId: postId ? { userId, postId } : undefined,
//         userId_threadId: threadId ? { userId, threadId } : undefined,
//         userId_commentId: commentId ? { userId, commentId } : undefined
//       }
//     });
//
//     let vote;
//     let voteChange = 0;
//
//     if (existingVote) {
//       // If the vote is the same, remove it (toggle off)
//       if (existingVote.value === value) {
//         await db.vote.delete({
//           where: { id: existingVote.id }
//         });
//         voteChange = -value;
//       } else {
//         // If the vote is different, update it
//         vote = await db.vote.update({
//           where: { id: existingVote.id },
//           data: { value }
//         });
//         voteChange = value - existingVote.value;
//       }
//     } else {
//       // Create a new vote
//       vote = await db.vote.create({
//         data: {
//           userId,
//           postId,
//           threadId,
//           commentId,
//           value
//         }
//       });
//       voteChange = value;
//     }
//
//     // Update the vote count on the target entity
//     if (postId && voteChange !== 0) {
//       await db.post.update({
//         where: { id: postId },
//         data: { votes: { increment: voteChange } }
//       });
//     } else if (threadId && voteChange !== 0) {
//       await db.thread.update({
//         where: { id: threadId },
//         data: { votes: { increment: voteChange } }
//       });
//     } else if (commentId && voteChange !== 0) {
//       await db.comment.update({
//         where: { id: commentId },
//         data: { votes: { increment: voteChange } }
//       });
//     }
//
//     // Return the current vote status
//     const updatedTarget = postId 
//       ? await db.post.findUnique({ where: { id: postId }, select: { votes: true } })
//       : threadId 
//       ? await db.thread.findUnique({ where: { id: threadId }, select: { votes: true } })
//       : await db.comment.findUnique({ where: { id: commentId }, select: { votes: true } });
//
//     return NextResponse.json({
//       vote: vote || null,
//       voteChange,
//       totalVotes: updatedTarget?.votes || 0
//     });
//   } catch (error) {
//     console.error("Error creating/updating vote:", error);
//     return NextResponse.json(
//       { error: "Failed to create/update vote" },
//       { status: 500 }
//     );
//   }
// }
//
// // GET /api/votes - Get a user's vote for a specific target
// export async function GET(req: Request) {
//   try {
//     const { searchParams } = new URL(req.url);
//     const userId = searchParams.get("userId");
//     const postId = searchParams.get("postId");
//     const threadId = searchParams.get("threadId");
//     const commentId = searchParams.get("commentId");
//
//     // Validate required fields
//     if (!userId) {
//       return NextResponse.json(
//         { error: "userId is required" },
//         { status: 400 }
//       );
//     }
//
//     // Validate that exactly one of postId, threadId, or commentId is provided
//     const targetCount = [postId, threadId, commentId].filter(Boolean).length;
//     if (targetCount !== 1) {
//       return NextResponse.json(
//         { error: "Exactly one of postId, threadId, or commentId must be provided" },
//         { status: 400 }
//       );
//     }
//
//     // Find the vote
//     const vote = await db.vote.findUnique({
//       where: {
//         userId_postId: postId ? { userId, postId } : undefined,
//         userId_threadId: threadId ? { userId, threadId } : undefined,
//         userId_commentId: commentId ? { userId, commentId } : undefined
//       }
//     });
//
//     return NextResponse.json({ vote });
//   } catch (error) {
//     console.error("Error fetching vote:", error);
//     return NextResponse.json(
//       { error: "Failed to fetch vote" },
//       { status: 500 }
//     );
//   }
// }
