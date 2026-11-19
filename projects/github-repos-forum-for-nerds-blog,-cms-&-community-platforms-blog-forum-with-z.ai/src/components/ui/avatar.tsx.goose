// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/avatar.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/avatar.tsx");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/avatar.tsx), unveraendert, als Inline-Doku ----
// "use client"
//
// import * as React from "react"
// import * as AvatarPrimitive from "@radix-ui/react-avatar"
//
// import { cn } from "@/lib/utils"
//
// function Avatar({
//   className,
//   ...props
// }: React.ComponentProps<typeof AvatarPrimitive.Root>) {
//   return (
//     <AvatarPrimitive.Root
//       data-slot="avatar"
//       className={cn(
//         "relative flex size-8 shrink-0 overflow-hidden rounded-full",
//         className
//       )}
//       {...props}
//     />
//   )
// }
//
// function AvatarImage({
//   className,
//   ...props
// }: React.ComponentProps<typeof AvatarPrimitive.Image>) {
//   return (
//     <AvatarPrimitive.Image
//       data-slot="avatar-image"
//       className={cn("aspect-square size-full", className)}
//       {...props}
//     />
//   )
// }
//
// function AvatarFallback({
//   className,
//   ...props
// }: React.ComponentProps<typeof AvatarPrimitive.Fallback>) {
//   return (
//     <AvatarPrimitive.Fallback
//       data-slot="avatar-fallback"
//       className={cn(
//         "bg-muted flex size-full items-center justify-center rounded-full",
//         className
//       )}
//       {...props}
//     />
//   )
// }
//
// export { Avatar, AvatarImage, AvatarFallback }
//
