// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-hosting-club-redesign/components/ui/badge.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-hosting-club-redesign/components/ui/badge.tsx");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-hosting-club-redesign/components/ui/badge.tsx), unveraendert, als Inline-Doku ----
// import * as React from "react"
// import { cva, type VariantProps } from "class-variance-authority"
//
// import { cn } from "@/lib/utils"
//
// const badgeVariants = cva(
//   "inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2",
//   {
//     variants: {
//       variant: {
//         default:
//           "border-transparent bg-primary text-primary-foreground hover:bg-primary/80",
//         secondary:
//           "border-transparent bg-secondary text-secondary-foreground hover:bg-secondary/80",
//         destructive:
//           "border-transparent bg-destructive text-destructive-foreground hover:bg-destructive/80",
//         outline: "text-foreground",
//       },
//     },
//     defaultVariants: {
//       variant: "default",
//     },
//   }
// )
//
// export interface BadgeProps
//   extends React.HTMLAttributes<HTMLDivElement>,
//     VariantProps<typeof badgeVariants> {}
//
// function Badge({ className, variant, ...props }: BadgeProps) {
//   return (
//     <div className={cn(badgeVariants({ variant }), className)} {...props} />
//   )
// }
//
// export { Badge, badgeVariants }
//
