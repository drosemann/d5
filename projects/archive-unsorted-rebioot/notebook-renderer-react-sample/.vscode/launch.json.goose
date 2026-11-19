// Goose-Port-Spiegel von: projects/archive-unsorted-rebioot/notebook-renderer-react-sample/.vscode/launch.json
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/archive-unsorted-rebioot/notebook-renderer-react-sample/.vscode/launch.json");
}

// ---- Original-Code (projects/archive-unsorted-rebioot/notebook-renderer-react-sample/.vscode/launch.json), unveraendert, als Inline-Doku ----
// // A launch configuration that compiles the extension and then opens it inside a new window
// // Use IntelliSense to learn about possible attributes.
// // Hover to view descriptions of existing attributes.
// // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
// {
//   "version": "0.2.0",
//   "configurations": [
//     {
//       "name": "Run Extension",
//       "type": "pwa-extensionHost",
//       "request": "launch",
//       "args": [
//         "--extensionDevelopmentPath=${workspaceFolder}"
//       ],
//       "outFiles": [
//         "${workspaceFolder}/out/**/*.js"
//       ],
//       "debugWebviews": {
//         "urlFilter": "*notebookRenderer*"
//       },
//       "trace": true,
//       "preLaunchTask": "npm: dev"
//     },
//     {
//       "name": "Run Extension (no server)",
//       "type": "extensionHost",
//       "request": "launch",
//       "args": [
//         "--extensionDevelopmentPath=${workspaceFolder}"
//       ],
//       "outFiles": [
//         "${workspaceFolder}/out/**/*.js"
//       ],
//       "debugWebviews": true,
//       "preLaunchTask": "npm: watch"
//     },
//     {
//       "name": "Extension Tests",
//       "type": "extensionHost",
//       "request": "launch",
//       "args": [
//         "--extensionDevelopmentPath=${workspaceFolder}",
//         "--extensionTestsPath=${workspaceFolder}/out/test/suite/index"
//       ],
//       "outFiles": [
//         "${workspaceFolder}/out/test/**/*.js"
//       ],
//       "preLaunchTask": "${defaultBuildTask}"
//     }
//   ]
// }
//
