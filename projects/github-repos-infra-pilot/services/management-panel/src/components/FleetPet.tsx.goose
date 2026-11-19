// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/services/management-panel/src/components/FleetPet.tsx
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/services/management-panel/src/components/FleetPet.tsx");
}

// ---- Original-Code (projects/github-repos-infra-pilot/services/management-panel/src/components/FleetPet.tsx), unveraendert, als Inline-Doku ----
// /**
//  * FleetPet (Living Fleet barecode) — renders one creature's mood + stage.
//  *
//  * MOUNT TODO for implementing agents: render inside AppCard.tsx next to the
//  * app name, passing the workload id. Data comes from the orchestrator fleet
//  * API proxied through the panel server (GET /api/fleet/creatures/:id).
//  * Do NOT fetch the orchestrator directly from the browser.
//  */
//
// export type CreatureMood =
//   | 'thriving'
//   | 'content'
//   | 'sleepy'
//   | 'hungry'
//   | 'sick'
//   | 'stressed'
//   | 'sad'
//   | 'ghost';
//
// export interface CreatureView {
//   workload_id: string;
//   display_name: string;
//   mood: CreatureMood;
//   stage: string;
//   vitals: Record<string, number | null>;
//   retired: boolean;
// }
//
// const MOOD_EMOJI: Record<CreatureMood, string> = {
//   thriving: '🌟',
//   content: '😊',
//   sleepy: '😴',
//   hungry: '🍽️',
//   sick: '🤒',
//   stressed: '😰',
//   sad: '😢',
//   ghost: '👻',
// };
//
// export function FleetPet({ creature }: { creature: CreatureView }) {
//   const emoji = MOOD_EMOJI[creature.mood] ?? '❓';
//   return (
//     <span
//       role="img"
//       className="fleet-pet"
//       title={`${creature.display_name} is ${creature.mood} (${creature.stage})`}
//       aria-label={`${creature.display_name}, mood ${creature.mood}, stage ${creature.stage}`}
//     >
//       <span aria-hidden="true">{emoji}</span>
//     </span>
//   );
// }
//
