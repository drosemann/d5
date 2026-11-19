// Goose-Port-Spiegel von: projects/browser-games-guess-the-number/main.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-guess-the-number/main.js");
}

// ---- Original-Code (projects/browser-games-guess-the-number/main.js), unveraendert, als Inline-Doku ----
// const choices = document.querySelectorAll('.choice button');
// const playerScore = document.querySelector('.player-score p');            
// const computerScore = document.querySelector('.computer-score p');            
// const result = document.querySelector('.result p');            
// const resetButton = document.querySelector('#reset');                                                    
// let player = 0;            
// let computer = 0;            
// let round = 0;
//
// choices.forEach(choice => {
//     choice.addEventListener('click', () => {
//         const playerChoice = choice.id;
//         const computerChoice = getComputerChoice();
//         const winner = determineWinner(playerChoice, computerChoice);
//         updateScore(winner);
//         updateResult(winner);
//         round++;
//         if (round === 5) {
//             resetGame();
//         }
//     });
// });
//
// function getComputerChoice() {
//     const choices = ['rock', 'paper', 'scissors'];
//     const randomIndex = Math.floor(Math.random() * choices.length);    
//     return choices[randomIndex];
// }
//
// function determineWinner(playerChoice, computerChoice) {
//     if (playerChoice === computerChoice) {
//         return 'tie';
//     } else if (
//         (playerChoice === 'rock' && computerChoice === 'scissors') ||       
//         (playerChoice === 'paper' && computerChoice === 'rock') ||
//
// ## finish code
