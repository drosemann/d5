// Goose-Port-Spiegel von: projects/utilities-&-desktop-tools-ui-optimization/components/ui/label.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/utilities-&-desktop-tools-ui-optimization/components/ui/label.tsx");
}

// ---- Original-Code (projects/utilities-&-desktop-tools-ui-optimization/components/ui/label.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import * as React from 'react'
// import * as LabelPrimitive from '@radix-ui/react-label'
// import { cva, type VariantProps } from 'class-variance-authority'
//
// import { cn } from '@/lib/utils'
//
// const labelVariants = cva(
//   'text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
// )
//
// const Label = React.forwardRef<
//   React.ElementRef<typeof LabelPrimitive.Root>,
//   React.ComponentPropsWithoutRef<typeof LabelPrimitive.Root> &
//     VariantProps<typeof labelVariants>
// >(({ className, ...props }, ref) => (
//   <LabelPrimitive.Root
//     ref={ref}
//     className={cn(labelVariants(), className)}
//     {...props}
//   />
// ))
// Label.displayName = LabelPrimitive.Root.displayName
//
// export { Label }
//
