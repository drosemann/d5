// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-hosting-software-hosting-club-redesign/components/ui/separator.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-hosting-software-hosting-club-redesign/components/ui/separator.tsx");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-hosting-software-hosting-club-redesign/components/ui/separator.tsx), unveraendert, als Inline-Doku ----
// "use client"
//
// import * as React from "react"
// import * as SeparatorPrimitive from "@radix-ui/react-separator"
//
// import { cn } from "@/lib/utils"
//
// const Separator = React.forwardRef<
//   React.ElementRef<typeof SeparatorPrimitive.Root>,
//   React.ComponentPropsWithoutRef<typeof SeparatorPrimitive.Root>
// >(
//   (
//     { className, orientation = "horizontal", decorative = true, ...props },
//     ref
//   ) => (
//     <SeparatorPrimitive.Root
//       ref={ref}
//       decorative={decorative}
//       orientation={orientation}
//       className={cn(
//         "shrink-0 bg-border",
//         orientation === "horizontal" ? "h-[1px] w-full" : "h-full w-[1px]",
//         className
//       )}
//       {...props}
//     />
//   )
// )
// Separator.displayName = SeparatorPrimitive.Root.displayName
//
// export { Separator }
//
