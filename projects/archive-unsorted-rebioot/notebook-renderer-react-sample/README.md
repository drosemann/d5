# notebook-renderer-react-sample

⚠️ Work-in-progress starter code for custom notebook renderers in VS Code. Expect this to change as notebooks matures. ⚠️

This starter includes:

 - 🖥️ TypeScript code to create a simple `NotebookOutputRenderer`
 - 📦 A Webpack build for renderer client code
 - ⚡ Support for hot module reloading and safe boilerplate
 - 🎨 CSS modules support

### Running this Sample

 1. `cd notebook-renderer-react-sample`
 1. `code-insiders .`: Open the folder in VS Code Insiders
 1. Hit `F5` to build+debug

### Structure

A Notebook Renderer consists of code that runs in the VS Code Extension Host (Node.js), which registers the renderer and passes data into the UI code running inside a WebView (Browser/DOM).

This uses TypeScript project references. There are three projects in the `src` directory:

 - `extension` contains the code running in Node.js extension host. It's compiled with `tsc`.
 - `client` is the UI code, built by Webpack, with access to the DOM.
 - `common` contains code shared between the extension and client.

When you run `watch`, `compile`, or `dev`, we invoke both `tsc` and `webpack` to compile the extension and the client portion of the code.

<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
