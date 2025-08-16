import { NextResponse } from "next/server";
import { db } from "@/lib/db";

// GET /api/posts - Fetch all posts
export async function GET(req: Request) {
  try {
    const { searchParams } = new URL(req.url);
    const page = parseInt(searchParams.get("page") || "1");
    const limit = parseInt(searchParams.get("limit") || "10");
    const category = searchParams.get("category");
    const tag = searchParams.get("tag");
    const search = searchParams.get("search");
    const sortBy = searchParams.get("sortBy") || "createdAt";
    const sortOrder = searchParams.get("sortOrder") || "desc";
    const status = searchParams.get("status");
    const featured = searchParams.get("featured");

    const skip = (page - 1) * limit;

    // Build where clause
    const where: any = {};
    
    if (status) {
      where.status = status;
    }
    
    if (featured) {
      where.featured = featured === "true";
    }
    
    if (category) {
      where.category = category;
    }
    
    if (search) {
      where.OR = [
        { title: { contains: search, mode: "insensitive" } },
        { content: { contains: search, mode: "insensitive" } },
        { excerpt: { contains: search, mode: "insensitive" } }
      ];
    }

    // Handle tag filtering
    if (tag) {
      const tagRecord = await db.tag.findUnique({
        where: { name: tag }
      });
      
      if (tagRecord) {
        where.tags = {
          some: {
            id: tagRecord.id
          }
        };
      }
    }

    // Build orderBy clause
    const orderBy: any = {};
    orderBy[sortBy] = sortOrder;

    const posts = await db.post.findMany({
      where,
      orderBy,
      skip,
      take: limit,
      include: {
        author: {
          select: {
            id: true,
            name: true,
            email: true,
            avatar: true
          }
        },
        tags: true
      }
    });

    const total = await db.post.count({ where });

    return NextResponse.json({
      posts,
      pagination: {
        page,
        limit,
        total,
        pages: Math.ceil(total / limit)
      }
    });
  } catch (error) {
    console.error("Error fetching posts:", error);
    return NextResponse.json(
      { error: "Failed to fetch posts" },
      { status: 500 }
    );
  }
}

// POST /api/posts - Create a new post
export async function POST(req: Request) {
  try {
    const body = await req.json();
    const { title, content, excerpt, tags, category, featured, status, authorId } = body;

    // Validate required fields
    if (!title || !authorId) {
      return NextResponse.json(
        { error: "Title and authorId are required" },
        { status: 400 }
      );
    }

    // Create the post
    const post = await db.post.create({
      data: {
        title,
        content,
        excerpt,
        category,
        featured: featured || false,
        status: status || "draft",
        author: {
          connect: { id: authorId }
        },
        tags: {
          connectOrCreate: tags?.map((tag: string) => ({
            where: { name: tag },
            create: { name: tag }
          })) || []
        }
      },
      include: {
        author: {
          select: {
            id: true,
            name: true,
            email: true,
            avatar: true
          }
        },
        tags: true
      }
    });

    return NextResponse.json(post, { status: 201 });
  } catch (error) {
    console.error("Error creating post:", error);
    return NextResponse.json(
      { error: "Failed to create post" },
      { status: 500 }
    );
  }
}