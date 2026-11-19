// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/lib/socket.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/lib/socket.ts");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/lib/socket.ts), unveraendert, als Inline-Doku ----
// import { Server } from 'socket.io';
// import { db } from '@/lib/db';
//
// export const setupSocket = (io: Server) => {
//   io.on('connection', (socket) => {
//     console.log('Client connected:', socket.id);
//     
//     // Handle joining a post or thread room
//     socket.on('joinRoom', (roomId: string) => {
//       socket.join(roomId);
//       console.log(`Client ${socket.id} joined room ${roomId}`);
//     });
//
//     // Handle leaving a room
//     socket.on('leaveRoom', (roomId: string) => {
//       socket.leave(roomId);
//       console.log(`Client ${socket.id} left room ${roomId}`);
//     });
//
//     // Handle new post
//     socket.on('newPost', async (postData: { title: string; content: string; authorId: string }) => {
//       try {
//         // Create the post in the database
//         const post = await db.post.create({
//           data: {
//             title: postData.title,
//             content: postData.content,
//             author: {
//               connect: { id: postData.authorId }
//             }
//           },
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
//         });
//
//         // Broadcast to all clients
//         io.emit('postCreated', post);
//       } catch (error) {
//         console.error('Error creating post:', error);
//         socket.emit('error', { message: 'Failed to create post' });
//       }
//     });
//
//     // Handle new thread
//     socket.on('newThread', async (threadData: { title: string; content: string; authorId: string }) => {
//       try {
//         // Create the thread in the database
//         const thread = await db.thread.create({
//           data: {
//             title: threadData.title,
//             content: threadData.content,
//             author: {
//               connect: { id: threadData.authorId }
//             }
//           },
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
//         });
//
//         // Broadcast to all clients
//         io.emit('threadCreated', thread);
//       } catch (error) {
//         console.error('Error creating thread:', error);
//         socket.emit('error', { message: 'Failed to create thread' });
//       }
//     });
//
//     // Handle new comment
//     socket.on('newComment', async (commentData: { content: string; authorId: string; postId?: string; threadId?: string }) => {
//       try {
//         // Validate that either postId or threadId is provided
//         if (!commentData.postId && !commentData.threadId) {
//           socket.emit('error', { message: 'Either postId or threadId must be provided' });
//           return;
//         }
//
//         // Create the comment in the database
//         const comment = await db.comment.create({
//           data: {
//             content: commentData.content,
//             author: {
//               connect: { id: commentData.authorId }
//             },
//             post: commentData.postId ? { connect: { id: commentData.postId } } : undefined,
//             thread: commentData.threadId ? { connect: { id: commentData.threadId } } : undefined
//           },
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
//         });
//
//         // Broadcast to the specific room (post or thread)
//         if (commentData.postId) {
//           io.to(commentData.postId).emit('commentCreated', { ...comment, postId: commentData.postId });
//         } else if (commentData.threadId) {
//           io.to(commentData.threadId).emit('commentCreated', { ...comment, threadId: commentData.threadId });
//         }
//       } catch (error) {
//         console.error('Error creating comment:', error);
//         socket.emit('error', { message: 'Failed to create comment' });
//       }
//     });
//
//     // Handle voting
//     socket.on('vote', async (voteData: { userId: string; postId?: string; threadId?: string; commentId?: string; value: number }) => {
//       try {
//         // Validate that exactly one of postId, threadId, or commentId is provided
//         const targetCount = [voteData.postId, voteData.threadId, voteData.commentId].filter(Boolean).length;
//         if (targetCount !== 1) {
//           socket.emit('error', { message: 'Exactly one of postId, threadId, or commentId must be provided' });
//           return;
//         }
//
//         // Check if a vote already exists for this user and target
//         const existingVote = await db.vote.findUnique({
//           where: {
//             userId_postId: voteData.postId ? { userId: voteData.userId, postId: voteData.postId } : undefined,
//             userId_threadId: voteData.threadId ? { userId: voteData.userId, threadId: voteData.threadId } : undefined,
//             userId_commentId: voteData.commentId ? { userId: voteData.userId, commentId: voteData.commentId } : undefined
//           }
//         });
//
//         let vote;
//         let voteChange = 0;
//
//         if (existingVote) {
//           // If the vote is the same, remove it (toggle off)
//           if (existingVote.value === voteData.value) {
//             await db.vote.delete({
//               where: { id: existingVote.id }
//             });
//             voteChange = -voteData.value;
//           } else {
//             // If the vote is different, update it
//             vote = await db.vote.update({
//               where: { id: existingVote.id },
//               data: { value: voteData.value }
//             });
//             voteChange = voteData.value - existingVote.value;
//           }
//         } else {
//           // Create a new vote
//           vote = await db.vote.create({
//             data: {
//               userId: voteData.userId,
//               postId: voteData.postId,
//               threadId: voteData.threadId,
//               commentId: voteData.commentId,
//               value: voteData.value
//             }
//           });
//           voteChange = voteData.value;
//         }
//
//         // Update the vote count on the target entity
//         let updatedTarget;
//         if (voteData.postId && voteChange !== 0) {
//           updatedTarget = await db.post.update({
//             where: { id: voteData.postId },
//             data: { votes: { increment: voteChange } },
//             select: { id: true, votes: true }
//           });
//         } else if (voteData.threadId && voteChange !== 0) {
//           updatedTarget = await db.thread.update({
//             where: { id: voteData.threadId },
//             data: { votes: { increment: voteChange } },
//             select: { id: true, votes: true }
//           });
//         } else if (voteData.commentId && voteChange !== 0) {
//           updatedTarget = await db.comment.update({
//             where: { id: voteData.commentId },
//             data: { votes: { increment: voteChange } },
//             select: { id: true, votes: true }
//           });
//         }
//
//         // Broadcast the vote update
//         const voteUpdate = {
//           vote: vote || null,
//           voteChange,
//           totalVotes: updatedTarget?.votes || 0,
//           targetId: voteData.postId || voteData.threadId || voteData.commentId,
//           targetType: voteData.postId ? 'post' : voteData.threadId ? 'thread' : 'comment'
//         };
//
//         io.emit('voteUpdated', voteUpdate);
//       } catch (error) {
//         console.error('Error processing vote:', error);
//         socket.emit('error', { message: 'Failed to process vote' });
//       }
//     });
//
//     // Handle disconnect
//     socket.on('disconnect', () => {
//       console.log('Client disconnected:', socket.id);
//     });
//
//     // Send welcome message
//     socket.emit('message', {
//       text: 'Welcome to the Cosmic Blog & Forum WebSocket Server!',
//       senderId: 'system',
//       timestamp: new Date().toISOString(),
//     });
//   });
// };
