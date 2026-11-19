// Goose-Port-Spiegel von: projects/ai-llm-projects-ai-productivity-dashboard/stores/uiStore.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/ai-llm-projects-ai-productivity-dashboard/stores/uiStore.ts");
}

// ---- Original-Code (projects/ai-llm-projects-ai-productivity-dashboard/stores/uiStore.ts), unveraendert, als Inline-Doku ----
// import { create } from 'zustand'
//
// interface UIStore {
//   sidebarCollapsed: boolean
//   rightPanelVisible: boolean
//   activeModal: string | null
//   proactiveMode: boolean
//   activeView: 'dashboard' | 'chat' | 'tasks' | 'memory' | 'projects' | 'inbox'
//   setSidebarCollapsed: (v: boolean) => void
//   toggleSidebar: () => void
//   setRightPanelVisible: (v: boolean) => void
//   setActiveModal: (modal: string | null) => void
//   toggleProactiveMode: () => void
//   setActiveView: (view: UIStore['activeView']) => void
// }
//
// export const useUIStore = create<UIStore>((set) => ({
//   sidebarCollapsed: false,
//   rightPanelVisible: true,
//   activeModal: null,
//   proactiveMode: true,
//   activeView: 'dashboard',
//
//   setSidebarCollapsed: (v) => set({ sidebarCollapsed: v }),
//   toggleSidebar: () => set((s) => ({ sidebarCollapsed: !s.sidebarCollapsed })),
//   setRightPanelVisible: (v) => set({ rightPanelVisible: v }),
//   setActiveModal: (modal) => set({ activeModal: modal }),
//   toggleProactiveMode: () => set((s) => ({ proactiveMode: !s.proactiveMode })),
//   setActiveView: (view) => set({ activeView: view }),
// }))
//
