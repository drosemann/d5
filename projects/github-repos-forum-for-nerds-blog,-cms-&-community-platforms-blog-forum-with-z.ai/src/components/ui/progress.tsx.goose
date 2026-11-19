// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/progress.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/progress.tsx");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds-blog,-cms-&-community-platforms-blog-forum-with-z.ai/src/components/ui/progress.tsx), unveraendert, als Inline-Doku ----
// "use client"
//
// import * as React from "react"
// import * as ProgressPrimitive from "@radix-ui/react-progress"
//
// import { cn } from "@/lib/utils"
//
// function Progress({
//   className,
//   value,
//   ...props
// }: React.ComponentProps<typeof ProgressPrimitive.Root>) {
//   return (
//     <ProgressPrimitive.Root
//       data-slot="progress"
//       className={cn(
//         "bg-primary/20 relative h-2 w-full overflow-hidden rounded-full",
//         className
//       )}
//       {...props}
//     >
//       <ProgressPrimitive.Indicator
//         data-slot="progress-indicator"
//         className="bg-primary h-full w-full flex-1 transition-all"
//         style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
//       />
//     </ProgressPrimitive.Root>
//   )
// }
//
// export { Progress }
//
