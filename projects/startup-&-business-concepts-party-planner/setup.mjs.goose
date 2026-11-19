// Goose-Port-Spiegel von: projects/startup-&-business-concepts-party-planner/setup.mjs
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/startup-&-business-concepts-party-planner/setup.mjs");
}

// ---- Original-Code (projects/startup-&-business-concepts-party-planner/setup.mjs), unveraendert, als Inline-Doku ----
// /**
//  * This script runs `npx @convex-dev/auth` to help with setting up
//  * environment variables for Convex Auth.
//  *
//  * You can safely delete it and remove it from package.json scripts.
//  */
//
// import fs from "fs";
// import { config as loadEnvFile } from "dotenv";
// import { spawnSync } from "child_process";
//
// if (!fs.existsSync(".env.local")) {
//   // Something is off, skip the script.
//   process.exit(0);
// }
//
// const config = {};
// loadEnvFile({ path: ".env.local", processEnv: config });
//
// const runOnceWorkflow = process.argv.includes("--once");
//
// if (runOnceWorkflow && config.SETUP_SCRIPT_RAN !== undefined) {
//   // The script has already ran once, skip.
//   process.exit(0);
// }
//
// const result = spawnSync("npx", ["@convex-dev/auth", "--skip-git-check"], {
//   stdio: "inherit",
// });
//
// if (runOnceWorkflow) {
//   fs.writeFileSync(".env.local", `
// SETUP_SCRIPT_RAN=1
// `, { flag: "a" });
// }
//
//
// process.exit(result.status);
