// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-photoshare/src/SignOutButton.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-photoshare/src/SignOutButton.tsx");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-photoshare/src/SignOutButton.tsx), unveraendert, als Inline-Doku ----
// "use client";
// import { useAuthActions } from "@convex-dev/auth/react";
// import { useConvexAuth } from "convex/react";
//
// export function SignOutButton() {
//   const { isAuthenticated } = useConvexAuth();
//   const { signOut } = useAuthActions();
//
//   if (!isAuthenticated) {
//     return null;
//   }
//
//   return (
//     <button className="px-4 py-2 rounded-lg transition-colors bg-blue-500 text-white" onClick={() => void signOut()}>
//       Sign out
//     </button>
//   );
// }
//
