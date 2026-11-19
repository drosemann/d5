// Goose-Port-Spiegel von: projects/personal-&-client-websites-portfolio/components/ui/radio-group.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-&-client-websites-portfolio/components/ui/radio-group.tsx");
}

// ---- Original-Code (projects/personal-&-client-websites-portfolio/components/ui/radio-group.tsx), unveraendert, als Inline-Doku ----
// 'use client'
//
// import * as React from 'react'
// import * as RadioGroupPrimitive from '@radix-ui/react-radio-group'
// import { Circle } from 'lucide-react'
//
// import { cn } from '@/lib/utils'
//
// const RadioGroup = React.forwardRef<
//   React.ElementRef<typeof RadioGroupPrimitive.Root>,
//   React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Root>
// >(({ className, ...props }, ref) => {
//   return (
//     <RadioGroupPrimitive.Root
//       className={cn('grid gap-2', className)}
//       {...props}
//       ref={ref}
//     />
//   )
// })
// RadioGroup.displayName = RadioGroupPrimitive.Root.displayName
//
// const RadioGroupItem = React.forwardRef<
//   React.ElementRef<typeof RadioGroupPrimitive.Item>,
//   React.ComponentPropsWithoutRef<typeof RadioGroupPrimitive.Item>
// >(({ className, ...props }, ref) => {
//   return (
//     <RadioGroupPrimitive.Item
//       ref={ref}
//       className={cn(
//         'aspect-square h-4 w-4 rounded-full border border-primary text-primary ring-offset-background focus:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
//         className,
//       )}
//       {...props}
//     >
//       <RadioGroupPrimitive.Indicator className="flex items-center justify-center">
//         <Circle className="h-2.5 w-2.5 fill-current text-current" />
//       </RadioGroupPrimitive.Indicator>
//     </RadioGroupPrimitive.Item>
//   )
// })
// RadioGroupItem.displayName = RadioGroupPrimitive.Item.displayName
//
// export { RadioGroup, RadioGroupItem }
//
