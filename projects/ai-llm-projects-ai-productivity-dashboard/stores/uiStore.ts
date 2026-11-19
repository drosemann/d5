import { create } from 'zustand'

interface UIStore {
  sidebarCollapsed: boolean
  rightPanelVisible: boolean
  activeModal: string | null
  proactiveMode: boolean
  activeView: 'dashboard' | 'chat' | 'tasks' | 'memory' | 'projects' | 'inbox'
  setSidebarCollapsed: (v: boolean) => void
  toggleSidebar: () => void
  setRightPanelVisible: (v: boolean) => void
  setActiveModal: (modal: string | null) => void
  toggleProactiveMode: () => void
  setActiveView: (view: UIStore['activeView']) => void
}

export const useUIStore = create<UIStore>((set) => ({
  sidebarCollapsed: false,
  rightPanelVisible: true,
  activeModal: null,
  proactiveMode: true,
  activeView: 'dashboard',

  setSidebarCollapsed: (v) => set({ sidebarCollapsed: v }),
  toggleSidebar: () => set((s) => ({ sidebarCollapsed: !s.sidebarCollapsed })),
  setRightPanelVisible: (v) => set({ rightPanelVisible: v }),
  setActiveModal: (modal) => set({ activeModal: modal }),
  toggleProactiveMode: () => set((s) => ({ proactiveMode: !s.proactiveMode })),
  setActiveView: (view) => set({ activeView: view }),
}))
