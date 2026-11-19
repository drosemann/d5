// Goose-Port-Spiegel von: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/components/ui/toggle-group.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/components/ui/toggle-group.tsx");
}

// ---- Original-Code (projects/github-repos-forum-for-nerds/Blog, CMS & Community Platforms/blog-forum-z.ai/src/components/ui/toggle-group.tsx), unveraendert, als Inline-Doku ----
// "use client"
//
// import * as React from "react"
// import * as ToggleGroupPrimitive from "@radix-ui/react-toggle-group"
// import { type VariantProps } from "class-variance-authority"
//
// import { cn } from "@/lib/utils"
// import { toggleVariants } from "@/components/ui/toggle"
//
// const ToggleGroupContext = React.createContext<
//   VariantProps<typeof toggleVariants>
// >({
//   size: "default",
//   variant: "default",
// })
//
// function ToggleGroup({
//   className,
//   variant,
//   size,
//   children,
//   ...props
// }: React.ComponentProps<typeof ToggleGroupPrimitive.Root> &
//   VariantProps<typeof toggleVariants>) {
//   return (
//     <ToggleGroupPrimitive.Root
//       data-slot="toggle-group"
//       data-variant={variant}
//       data-size={size}
//       className={cn(
//         "group/toggle-group flex w-fit items-center rounded-md data-[variant=outline]:shadow-xs",
//         className
//       )}
//       {...props}
//     >
//       <ToggleGroupContext.Provider value={{ variant, size }}>
//         {children}
//       </ToggleGroupContext.Provider>
//     </ToggleGroupPrimitive.Root>
//   )
// }
//
// function ToggleGroupItem({
//   className,
//   children,
//   variant,
//   size,
//   ...props
// }: React.ComponentProps<typeof ToggleGroupPrimitive.Item> &
//   VariantProps<typeof toggleVariants>) {
//   const context = React.useContext(ToggleGroupContext)
//
//   return (
//     <ToggleGroupPrimitive.Item
//       data-slot="toggle-group-item"
//       data-variant={context.variant || variant}
//       data-size={context.size || size}
//       className={cn(
//         toggleVariants({
//           variant: context.variant || variant,
//           size: context.size || size,
//         }),
//         "min-w-0 flex-1 shrink-0 rounded-none shadow-none first:rounded-l-md last:rounded-r-md focus:z-10 focus-visible:z-10 data-[variant=outline]:border-l-0 data-[variant=outline]:first:border-l",
//         className
//       )}
//       {...props}
//     >
//       {children}
//     </ToggleGroupPrimitive.Item>
//   )
// }
//
// export { ToggleGroup, ToggleGroupItem }
//
