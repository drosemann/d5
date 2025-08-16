import { NextResponse } from "next/server";
import { db } from "@/lib/db";

// GET /api/tags - Fetch all tags
export async function GET(req: Request) {
  try {
    const { searchParams } = new URL(req.url);
    const page = parseInt(searchParams.get("page") || "1");
    const limit = parseInt(searchParams.get("limit") || "10");
    const search = searchParams.get("search");

    const skip = (page - 1) * limit;

    // Build where clause
    const where: any = {};
    
    if (search) {
      where.name = { contains: search, mode: "insensitive" };
    }

    const tags = await db.tag.findMany({
      where,
      skip,
      take: limit,
      orderBy: {
        name: "asc"
      }
    });

    const total = await db.tag.count({ where });

    return NextResponse.json({
      tags,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit)
      }
    });
  } catch (error) {
    console.error("Error fetching tags:", error);
    return NextResponse.json(
      { error: "Failed to fetch tags" },
      { status: 500 }
    );
  }
}

// POST /api/tags - Create a new tag
export async function POST(req: Request) {
  try {
    const body = await req.json();
    const { name } = body;

    // Validate required fields
    if (!name) {
      return NextResponse.json(
        { error: "Name is required" },
        { status: 400 }
      );
    }

    // Check if tag already exists
    const existingTag = await db.tag.findUnique({
      where: { name }
    });

    if (existingTag) {
      return NextResponse.json(
        { error: "Tag already exists" },
        { status: 400 }
      );
    }

    // Create the tag
    const tag = await db.tag.create({
      data: {
        name
      }
    });

    return NextResponse.json(tag, { status: 201 });
  } catch (error) {
    console.error("Error creating tag:", error);
    return NextResponse.json(
      { error: "Failed to create tag" },
      { status: 500 }
    );
  }
}