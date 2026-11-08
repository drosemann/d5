import { useMutation, useQuery } from "convex/react";
import { api } from "../convex/_generated/api";
import { PhotoGrid } from "./PhotoGrid";
import { useCallback, useState } from "react";
import { toast } from "sonner";
import { Id } from "../convex/_generated/dataModel";

export function MyPhotos() {
  const photos = useQuery(api.photos.listMyPhotos);
  const generateUploadUrl = useMutation(api.photos.generateUploadUrl);
  const createPhoto = useMutation(api.photos.createPhoto);
  const deletePhoto = useMutation(api.photos.deletePhoto);
  const [isUploading, setIsUploading] = useState(false);

  const onDrop = useCallback(async (files: FileList | null) => {
    if (!files?.length) return;
    
    setIsUploading(true);
    try {
      const file = files[0];
      
      // Create a canvas to resize the image
      const img = new Image();
      const canvas = document.createElement('canvas');
      const ctx = canvas.getContext('2d')!;
      
      await new Promise((resolve, reject) => {
        img.onload = resolve;
        img.onerror = reject;
        img.src = URL.createObjectURL(file);
      });

      // Calculate dimensions to make it square and max 800x800
      const size = Math.min(800, Math.max(img.width, img.height));
      canvas.width = size;
      canvas.height = size;

      // Calculate cropping
      const scale = size / Math.min(img.width, img.height);
      const x = (img.width - img.height) / 2;
      const y = (img.height - img.width) / 2;

      // Draw image centered and cropped to square
      if (img.width > img.height) {
        ctx.drawImage(img, x, 0, img.height, img.height, 0, 0, size, size);
      } else {
        ctx.drawImage(img, 0, y, img.width, img.width, 0, 0, size, size);
      }

      // Convert to blob
      const blob = await new Promise<Blob>((resolve) => 
        canvas.toBlob((blob) => resolve(blob!), 'image/jpeg', 0.9)
      );

      // Upload to Convex
      const postUrl = await generateUploadUrl();
      const result = await fetch(postUrl, {
        method: "POST",
        headers: { "Content-Type": blob.type },
        body: blob,
      });
      const { storageId } = await result.json();
      await createPhoto({ storageId });
      toast.success("Photo uploaded!");
    } catch (e) {
      console.error(e);
      toast.error("Failed to upload photo");
    } finally {
      setIsUploading(false);
    }
  }, [generateUploadUrl, createPhoto]);

  const handleDelete = (id: Id<"photos">) => {
    deletePhoto({ photoId: id });
  };

  if (!photos) {
    return (
      <div className="flex justify-center">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
      </div>
    );
  }

  return (
    <div className="space-y-8">
      <div
        className={`border-2 border-dashed rounded-lg p-8 text-center ${
          isUploading ? "border-indigo-300 bg-indigo-50" : "border-gray-300"
        }`}
        onDragOver={(e) => e.preventDefault()}
        onDrop={(e) => {
          e.preventDefault();
          onDrop(e.dataTransfer.files);
        }}
      >
        {isUploading ? (
          <div className="flex justify-center">
            <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-500"></div>
          </div>
        ) : (
          <div>
            <p className="text-gray-600">
              Drag and drop an image here to upload
            </p>
            <input
              type="file"
              accept="image/*"
              className="mt-4"
              onChange={(e) => onDrop(e.target.files)}
            />
          </div>
        )}
      </div>
      
      <PhotoGrid photos={photos} onDelete={handleDelete} />
    </div>
  );
}
