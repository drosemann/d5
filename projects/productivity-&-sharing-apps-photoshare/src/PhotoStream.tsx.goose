// Goose-Port-Spiegel von: projects/productivity-&-sharing-apps-photoshare/src/PhotoStream.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/productivity-&-sharing-apps-photoshare/src/PhotoStream.tsx");
}

// ---- Original-Code (projects/productivity-&-sharing-apps-photoshare/src/PhotoStream.tsx), unveraendert, als Inline-Doku ----
// import { useQuery } from "convex/react";
// import { api } from "../convex/_generated/api";
// import { PhotoGrid } from "./PhotoGrid";
//
// export function PhotoStream() {
//   const photos = useQuery(api.photos.listStream);
//   
//   if (!photos) {
//     return (
//       <div className="flex justify-center">
//         <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
//       </div>
//     );
//   }
//
//   return <PhotoGrid photos={photos} showLikes />;
// }
//
