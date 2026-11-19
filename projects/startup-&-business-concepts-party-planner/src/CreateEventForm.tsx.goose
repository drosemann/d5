// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/src/CreateEventForm.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/src/CreateEventForm.tsx");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/src/CreateEventForm.tsx), unveraendert, als Inline-Doku ----
// import { useState } from "react";
// import { useMutation } from "convex/react";
// import { api } from "../convex/_generated/api";
// import { toast } from "sonner";
//
// export function CreateEventForm() {
//   const [title, setTitle] = useState("");
//   const [description, setDescription] = useState("");
//   const [date, setDate] = useState("");
//   const [location, setLocation] = useState("");
//   
//   const createEvent = useMutation(api.events.create);
//   
//   const handleSubmit = async (e: React.FormEvent) => {
//     e.preventDefault();
//     try {
//       await createEvent({ title, description, date, location });
//       setTitle("");
//       setDescription("");
//       setDate("");
//       setLocation("");
//       toast.success("Event created!");
//     } catch (error) {
//       toast.error("Failed to create event");
//     }
//   };
//   
//   return (
//     <form onSubmit={handleSubmit} className="space-y-4">
//       <div>
//         <label className="block text-sm font-medium text-gray-700">Title</label>
//         <input
//           type="text"
//           value={title}
//           onChange={(e) => setTitle(e.target.value)}
//           className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
//           required
//         />
//       </div>
//       <div>
//         <label className="block text-sm font-medium text-gray-700">Description</label>
//         <textarea
//           value={description}
//           onChange={(e) => setDescription(e.target.value)}
//           className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
//           required
//         />
//       </div>
//       <div>
//         <label className="block text-sm font-medium text-gray-700">Date</label>
//         <input
//           type="datetime-local"
//           value={date}
//           onChange={(e) => setDate(e.target.value)}
//           className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
//           required
//         />
//       </div>
//       <div>
//         <label className="block text-sm font-medium text-gray-700">Location</label>
//         <input
//           type="text"
//           value={location}
//           onChange={(e) => setLocation(e.target.value)}
//           className="mt-1 block w-full rounded-md border border-gray-300 px-3 py-2"
//           required
//         />
//       </div>
//       <button
//         type="submit"
//         className="w-full bg-indigo-600 text-white py-2 px-4 rounded-md hover:bg-indigo-700"
//       >
//         Create Event
//       </button>
//     </form>
//   );
// }
//
