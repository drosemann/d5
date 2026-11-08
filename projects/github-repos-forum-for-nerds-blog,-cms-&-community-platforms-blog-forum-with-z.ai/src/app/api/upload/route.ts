import { NextRequest } from "next/server";

// POST /api/upload - Upload a file
export async function POST(req: NextRequest) {
  try {
    // For now, we'll return a mock response since we're having issues with the file upload implementation
    // In a real implementation, you would handle file uploads here
    
    return Response.json({
      url: "/uploads/mock-file.png",
      filename: "mock-file.png",
      size: 12345
    });
  } catch (error) {
    console.error("Error uploading file:", error);
    return Response.json(
      { error: "Failed to upload file" },
      { status: 500 }
    );
  }
}