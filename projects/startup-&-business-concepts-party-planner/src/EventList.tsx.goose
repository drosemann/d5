// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/src/EventList.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/src/EventList.tsx");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/src/EventList.tsx), unveraendert, als Inline-Doku ----
// import { useState } from "react";
// import { useQuery, useMutation } from "convex/react";
// import { api } from "../convex/_generated/api";
// import { toast } from "sonner";
// import { Id } from "../convex/_generated/dataModel";
//
// export function EventList() {
//   const myEvents = useQuery(api.events.listMyEvents) ?? [];
//   const invitedEvents = useQuery(api.events.listInvitedEvents) ?? [];
//   const invite = useMutation(api.invitations.invite);
//   const respond = useMutation(api.invitations.respond);
//   
//   const [inviteEmail, setInviteEmail] = useState("");
//   const [selectedEvent, setSelectedEvent] = useState<Id<"events"> | null>(null);
//   
//   const handleInvite = async (eventId: Id<"events">) => {
//     try {
//       await invite({ eventId, email: inviteEmail });
//       setInviteEmail("");
//       setSelectedEvent(null);
//       toast.success("Invitation sent!");
//     } catch (error) {
//       toast.error("Failed to send invitation");
//     }
//   };
//   
//   const handleRespond = async (eventId: Id<"events">, status: string) => {
//     try {
//       await respond({ eventId, status });
//       toast.success("Response sent!");
//     } catch (error) {
//       toast.error("Failed to respond");
//     }
//   };
//   
//   return (
//     <div className="space-y-8">
//       <div>
//         <h3 className="text-xl font-semibold mb-4">Events You're Hosting</h3>
//         <div className="space-y-4">
//           {myEvents.map((event) => (
//             <div key={event._id} className="border rounded-lg p-4">
//               <h4 className="font-bold">{event.title}</h4>
//               <p className="text-gray-600">{event.description}</p>
//               <p className="text-sm">
//                 {new Date(event.date).toLocaleDateString()} at {event.location}
//               </p>
//               <div className="mt-4">
//                 {selectedEvent === event._id ? (
//                   <div className="flex gap-2">
//                     <input
//                       type="email"
//                       value={inviteEmail}
//                       onChange={(e) => setInviteEmail(e.target.value)}
//                       placeholder="Enter email"
//                       className="flex-1 rounded-md border px-3 py-1"
//                     />
//                     <button
//                       onClick={() => handleInvite(event._id)}
//                       className="bg-indigo-600 text-white px-3 py-1 rounded-md"
//                     >
//                       Send
//                     </button>
//                     <button
//                       onClick={() => setSelectedEvent(null)}
//                       className="bg-gray-200 px-3 py-1 rounded-md"
//                     >
//                       Cancel
//                     </button>
//                   </div>
//                 ) : (
//                   <button
//                     onClick={() => setSelectedEvent(event._id)}
//                     className="text-indigo-600"
//                   >
//                     Invite Friends
//                   </button>
//                 )}
//               </div>
//             </div>
//           ))}
//         </div>
//       </div>
//       
//       <div>
//         <h3 className="text-xl font-semibold mb-4">Events You're Invited To</h3>
//         <div className="space-y-4">
//           {invitedEvents.map((event) => (
//             <div key={event._id} className="border rounded-lg p-4">
//               <h4 className="font-bold">{event.title}</h4>
//               <p className="text-gray-600">{event.description}</p>
//               <p className="text-sm">
//                 {new Date(event.date).toLocaleDateString()} at {event.location}
//               </p>
//               <div className="mt-4 flex gap-2">
//                 <button
//                   onClick={() => handleRespond(event._id, "accepted")}
//                   className="bg-green-600 text-white px-3 py-1 rounded-md"
//                 >
//                   Accept
//                 </button>
//                 <button
//                   onClick={() => handleRespond(event._id, "declined")}
//                   className="bg-red-600 text-white px-3 py-1 rounded-md"
//                 >
//                   Decline
//                 </button>
//               </div>
//             </div>
//           ))}
//         </div>
//       </div>
//     </div>
//   );
// }
//
