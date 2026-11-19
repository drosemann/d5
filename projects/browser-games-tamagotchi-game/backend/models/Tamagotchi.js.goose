// Goose-Port-Spiegel von: projects/browser-games-tamagotchi-game/backend/models/Tamagotchi.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-tamagotchi-game/backend/models/Tamagotchi.js");
}

// ---- Original-Code (projects/browser-games-tamagotchi-game/backend/models/Tamagotchi.js), unveraendert, als Inline-Doku ----
// const mongoose = require('mongoose');
//
// const tamagotchiSchema = new mongoose.Schema({
//   user: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
//   name: { type: String, required: true },
//   avatar: { type: String, default: 'egg.png' },
//   age: { type: Number, default: 0 },
//   hunger: { type: Number, default: 100, min: 0, max: 100 },
//   happiness: { type: Number, default: 100, min: 0, max: 100 },
//   health: { type: Number, default: 100, min: 0, max: 100 },
//   isSleeping: { type: Boolean, default: false },
//   lastUpdated: { type: Date, default: Date.now }
// });
//
// module.exports = mongoose.model('Tamagotchi', tamagotchiSchema);
