// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-sharebox/src/App.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-sharebox/src/App.tsx");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-sharebox/src/App.tsx), unveraendert, als Inline-Doku ----
// import { Authenticated, Unauthenticated, useQuery, useMutation } from "convex/react";
// import { api } from "../convex/_generated/api";
// import { SignInForm } from "./SignInForm";
// import { SignOutButton } from "./SignOutButton";
// import { Toaster, toast } from "sonner";
// import { useRef, useState } from "react";
// import { Id } from "../convex/_generated/dataModel";
//
// export default function App() {
//   return (
//     <div className="min-h-screen flex flex-col">
//       <header className="sticky top-0 z-10 bg-white/80 backdrop-blur-sm p-4 flex justify-between items-center border-b">
//         <h2 className="text-xl font-semibold accent-text">ShareBox</h2>
//         <SignOutButton />
//       </header>
//       <main className="flex-1 p-8">
//         <div className="max-w-4xl mx-auto">
//           <Content />
//         </div>
//       </main>
//       <Toaster />
//     </div>
//   );
// }
//
// function Content() {
//   const loggedInUser = useQuery(api.auth.loggedInUser);
//
//   if (loggedInUser === undefined) {
//     return (
//       <div className="flex justify-center items-center">
//         <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
//       </div>
//     );
//   }
//
//   return (
//     <div className="flex flex-col gap-8">
//       <div className="text-center">
//         <h1 className="text-5xl font-bold accent-text mb-4">ShareBox</h1>
//         <Authenticated>
//           <p className="text-xl text-slate-600">Your secure file sharing space</p>
//           <FileManager />
//         </Authenticated>
//         <Unauthenticated>
//           <p className="text-xl text-slate-600">Sign in to start sharing files</p>
//           <SignInForm />
//         </Unauthenticated>
//       </div>
//     </div>
//   );
// }
//
// function FileManager() {
//   const files = useQuery(api.files.listFiles) || [];
//   const generateUploadUrl = useMutation(api.files.generateUploadUrl);
//   const saveFile = useMutation(api.files.saveFile);
//   const deleteFile = useMutation(api.files.deleteFile);
//   const fileInput = useRef<HTMLInputElement>(null);
//   const [uploading, setUploading] = useState(false);
//
//   const handleFileUpload = async (event: React.ChangeEvent<HTMLInputElement>) => {
//     const file = event.target.files?.[0];
//     if (!file) return;
//
//     try {
//       setUploading(true);
//       const postUrl = await generateUploadUrl();
//       const result = await fetch(postUrl, {
//         method: "POST",
//         headers: { "Content-Type": file.type },
//         body: file,
//       });
//       const { storageId } = await result.json();
//       
//       await saveFile({
//         storageId,
//         name: file.name,
//         type: file.type,
//         size: file.size,
//       });
//       
//       toast.success("File uploaded successfully!");
//       if (fileInput.current) fileInput.current.value = "";
//     } catch (error) {
//       toast.error("Failed to upload file");
//       console.error(error);
//     } finally {
//       setUploading(false);
//     }
//   };
//
//   const handleDelete = async (fileId: Id<"files">) => {
//     try {
//       await deleteFile({ fileId });
//       toast.success("File deleted successfully!");
//     } catch (error) {
//       toast.error("Failed to delete file");
//       console.error(error);
//     }
//   };
//
//   const formatSize = (bytes: number) => {
//     const units = ['B', 'KB', 'MB', 'GB'];
//     let size = bytes;
//     let unitIndex = 0;
//     while (size >= 1024 && unitIndex < units.length - 1) {
//       size /= 1024;
//       unitIndex++;
//     }
//     return `${size.toFixed(1)} ${units[unitIndex]}`;
//   };
//
//   return (
//     <div className="mt-8">
//       <div className="flex justify-center mb-8">
//         <label className="relative cursor-pointer bg-indigo-500 hover:bg-indigo-600 text-white px-4 py-2 rounded-lg">
//           <span>{uploading ? "Uploading..." : "Upload File"}</span>
//           <input
//             ref={fileInput}
//             type="file"
//             className="hidden"
//             onChange={handleFileUpload}
//             disabled={uploading}
//           />
//         </label>
//       </div>
//
//       <div className="bg-white rounded-lg shadow">
//         <div className="divide-y">
//           {files.length === 0 ? (
//             <p className="p-4 text-center text-gray-500">No files uploaded yet</p>
//           ) : (
//             files.map((file) => (
//               <div key={file._id} className="p-4 flex items-center justify-between">
//                 <div className="flex-1">
//                   <h3 className="font-medium">{file.name}</h3>
//                   <p className="text-sm text-gray-500">
//                     {formatSize(file.size)} • {file.type}
//                   </p>
//                 </div>
//                 <div className="flex gap-2">
//                   <a
//                     href={file.url ?? undefined}
//                     download={file.name}
//                     className="px-3 py-1 bg-indigo-100 text-indigo-700 rounded hover:bg-indigo-200"
//                   >
//                     Download
//                   </a>
//                   <button
//                     onClick={() => handleDelete(file._id)}
//                     className="px-3 py-1 bg-red-100 text-red-700 rounded hover:bg-red-200"
//                   >
//                     Delete
//                   </button>
//                 </div>
//               </div>
//             ))
//           )}
//         </div>
//       </div>
//     </div>
//   );
// }
//
