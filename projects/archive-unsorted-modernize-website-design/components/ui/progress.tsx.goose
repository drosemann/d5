// Goose-Port-Spiegel von: projects/archive-unsorted-modernize-website-design/components/ui/progress.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-modernize-website-design/components/ui/progress.tsx");
}

// ---- Original-Code (projects/archive-unsorted-modernize-website-design/components/ui/progress.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import * as React from 'react'
// import * as ProgressPrimitive from '@radix-ui/react-progress'
//
// import { cn } from '@/lib/utils'
//
// const Progress = React.forwardRef<
//   React.ElementRef<typeof ProgressPrimitive.Root>,
//   React.ComponentPropsWithoutRef<typeof ProgressPrimitive.Root>
// >(({ className, value, ...props }, ref) => (
//   <ProgressPrimitive.Root
//     ref={ref}
//     className={cn(
//       'relative h-4 w-full overflow-hidden rounded-full bg-secondary',
//       className,
//     )}
//     {...props}
//   >
//     <ProgressPrimitive.Indicator
//       className="h-full w-full flex-1 bg-primary transition-all"
//       style={{ transform: `translateX(-${100 - (value || 0)}%)` }}
//     />
//   </ProgressPrimitive.Root>
// ))
// Progress.displayName = ProgressPrimitive.Root.displayName
//
// export { Progress }
//
