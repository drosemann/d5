// Goose-Port-Spiegel von: projects/ai-&-llm-projects-ai-chat-website-talkativecloud/src/components/ui/tooltip.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-&-llm-projects-ai-chat-website-talkativecloud/src/components/ui/tooltip.tsx");
}

// ---- Original-Code (projects/ai-&-llm-projects-ai-chat-website-talkativecloud/src/components/ui/tooltip.tsx), unveraendert, als Inline-Doku ----
// import * as React from "react"
// import * as TooltipPrimitive from "@radix-ui/react-tooltip"
//
// import { cn } from "@/lib/utils"
//
// const TooltipProvider = TooltipPrimitive.Provider
//
// const Tooltip = TooltipPrimitive.Root
//
// const TooltipTrigger = TooltipPrimitive.Trigger
//
// const TooltipContent = React.forwardRef<
//   React.ElementRef<typeof TooltipPrimitive.Content>,
//   React.ComponentPropsWithoutRef<typeof TooltipPrimitive.Content>
// >(({ className, sideOffset = 4, ...props }, ref) => (
//   <TooltipPrimitive.Content
//     ref={ref}
//     sideOffset={sideOffset}
//     className={cn(
//       "z-50 overflow-hidden rounded-md border bg-popover px-3 py-1.5 text-sm text-popover-foreground shadow-md animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2",
//       className
//     )}
//     {...props}
//   />
// ))
// TooltipContent.displayName = TooltipPrimitive.Content.displayName
//
// export { Tooltip, TooltipTrigger, TooltipContent, TooltipProvider }
//
