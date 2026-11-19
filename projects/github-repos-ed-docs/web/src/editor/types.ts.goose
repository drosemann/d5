// Goose-Port-Spiegel von: projects/github-repos-ed-docs/web/src/editor/types.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-ed-docs/web/src/editor/types.ts");
}

// ---- Original-Code (projects/github-repos-ed-docs/web/src/editor/types.ts), unveraendert, als Inline-Doku ----
// export type EditorMode = 'NORMAL' | 'INSERT' | 'COMMAND';
//
// export type DocumentRecord = {
//   id: string;
//   title: string;
//   content: string;
//   updatedAt: string;
// };
//
// export type LineRange = {startLine: number; endLine: number};
//
// export type ParsedCommand = {
//   range: LineRange | null;
//   name: string;
//   args: string;
//   raw: string;
// };
//
// export type UndoEntry = {draft: string; caret: number};
//
// export type CommandResult = {
//   draft?: string;
//   caret?: number | null;
//   status: string;
//   error?: boolean;
//   closeEditor?: boolean;
//   downloadAs?: string;
// };
//
// export type CommandContext = {
//   draft: string;
//   caret: number;
//   draftTitle: string;
//   lastSearch: string;
//   setLastSearch: (pattern: string) => void;
//   pushUndo: (entry: UndoEntry) => void;
// };
//
