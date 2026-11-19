// Goose-Port-Spiegel von: projects/startup-business-concepts-securestream-vpn/client/main.js
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-business-concepts-securestream-vpn/client/main.js");
}

// ---- Original-Code (projects/startup-business-concepts-securestream-vpn/client/main.js), unveraendert, als Inline-Doku ----
// const { app, BrowserWindow } = require('electron');
// const path = require('path');
//
// function createWindow() {
//   const win = new BrowserWindow({
//     width: 800,
//     height: 600,
//     webPreferences: {
//       preload: path.join(__dirname, 'preload.js'),
//     },
//   });
//
//   win.loadFile('index.html');
// }
//
// app.whenReady().then(() => {
//   createWindow();
//
//   app.on('activate', () => {
//     if (BrowserWindow.getAllWindows().length === 0) createWindow();
//   });
// });
//
// app.on('window-all-closed', () => {
//   if (process.platform !== 'darwin') app.quit();
// });
//
