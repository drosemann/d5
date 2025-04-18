import { useQuery } from "convex/react";
import { api } from "../convex/_generated/api";
import { PhotoGrid } from "./PhotoGrid";

export function PhotoStream() {
  const photos = useQuery(api.photos.listStream);
  
  if (!photos) {
    return (
      <div className="flex justify-center">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
      </div>
    );
  }

  return <PhotoGrid photos={photos} showLikes />;
}
