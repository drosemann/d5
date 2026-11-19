// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/src/App.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/src/App.tsx");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-forumino/src/App.tsx), unveraendert, als Inline-Doku ----
// import { Authenticated, Unauthenticated, useQuery } from "convex/react";
// import { api } from "../convex/_generated/api";
// import { SignInForm } from "./SignInForm";
// import { SignOutButton } from "./SignOutButton";
// import { ForumView } from "./ForumView";
// import { Toaster } from "sonner";
//
// export default function App() {
//   return (
//     <div className="min-h-screen flex flex-col">
//       <header className="sticky top-0 z-10 bg-white/80 backdrop-blur-sm p-4 flex justify-between items-center border-b">
//         <h2 className="text-xl font-semibold accent-text">Forumino</h2>
//         <SignOutButton />
//       </header>
//       <main className="flex-1 p-4">
//         <Content />
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
//     <div className="max-w-6xl mx-auto">
//       <Authenticated>
//         <ForumView />
//       </Authenticated>
//       <Unauthenticated>
//         <div className="max-w-md mx-auto mt-8">
//           <h1 className="text-3xl font-bold text-center mb-8">Welcome to Forumino</h1>
//           <SignInForm />
//         </div>
//       </Unauthenticated>
//     </div>
//   );
// }
//
