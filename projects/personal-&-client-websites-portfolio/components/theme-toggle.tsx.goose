// Goose-Port-Spiegel von: projects/personal-&-client-websites-portfolio/components/theme-toggle.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/personal-&-client-websites-portfolio/components/theme-toggle.tsx");
}

// ---- Original-Code (projects/personal-&-client-websites-portfolio/components/theme-toggle.tsx), unveraendert, als Inline-Doku ----
// "use client"
//
// import { Moon, Sun } from "lucide-react"
// import { useTheme } from "next-themes"
//
// import { Button } from "@/components/ui/button"
//
// export function ThemeToggle() {
//   const { setTheme, theme } = useTheme()
//
//   return (
//     <Button variant="ghost" size="icon" onClick={() => setTheme(theme === "light" ? "dark" : "light")}>
//       <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
//       <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
//       <span className="sr-only">Toggle theme</span>
//     </Button>
//   )
// }
//
