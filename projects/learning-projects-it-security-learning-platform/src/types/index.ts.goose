// Goose-Port-Spiegel von: projects/learning-projects-it-security-learning-platform/src/types/index.ts
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/learning-projects-it-security-learning-platform/src/types/index.ts");
}

// ---- Original-Code (projects/learning-projects-it-security-learning-platform/src/types/index.ts), unveraendert, als Inline-Doku ----
// export interface User {
//   id: string;
//   email: string;
//   full_name?: string;
//   avatar_url?: string;
//   progress?: UserProgress;
// }
//
// export interface UserProgress {
//   completed_lessons: string[];
//   badges: Badge[];
//   points: number;
// }
//
// export interface Badge {
//   id: string;
//   name: string;
//   description: string;
//   image_url: string;
// }
//
// export interface Course {
//   id: string;
//   title: string;
//   description: string;
//   modules: Module[];
//   difficulty: 'beginner' | 'intermediate' | 'advanced';
//   image_url: string;
// }
//
// export interface Module {
//   id: string;
//   title: string;
//   lessons: Lesson[];
// }
//
// export interface Lesson {
//   id: string;
//   title: string;
//   content: string;
//   type: 'text' | 'video' | 'lab';
//   duration: number; // in minutes
//   quiz?: Quiz;
// }
//
// export interface Quiz {
//   id: string;
//   questions: Question[];
// }
//
// export interface Question {
//   id: string;
//   text: string;
//   options: string[];
//   correct_answer: number;
// }
