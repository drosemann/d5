import { fileURLToPath } from "node:url";
import { createReadStream, statSync } from "node:fs";
import { join, extname } from "node:path";
import { defineConfig } from "vite";
import solid from "vite-plugin-solid";

const root = fileURLToPath(new URL(".", import.meta.url));
const MIME = {
  ".html": "text/html", ".js": "text/javascript", ".json": "application/json",
  ".css": "text/css", ".md": "text/markdown", ".png": "image/png",
  ".jpg": "image/jpeg", ".jpeg": "image/jpeg", ".svg": "image/svg+xml",
  ".ico": "image/x-icon",
};

// Serve the repo siblings (projects/, app/) so catalog embeds, READMEs and the
// speedtest probes keep working exactly like the vanilla app (../projects/...).
function repoServe() {
  return {
    name: "d5-repo-serve",
    configureServer(server) {
      server.middlewares.use((req, res, next) => {
        if (req.method !== "GET") return next();
        const url = decodeURIComponent(req.url.split("?")[0]);
        let file = null;
        if (url.startsWith("/projects/")) file = join(root, "..", "projects", url.slice("/projects/".length));
        else if (url.startsWith("/app/")) file = join(root, "..", "app", url.slice("/app/".length));
        else if (url === "/catalog.json") file = join(root, "..", "app", "catalog.json");
        else if (url === "/catalog.js") file = join(root, "..", "app", "catalog.js");
        else if (url === "/index.html") file = join(root, "..", "app", "index.html");
        if (!file) return next();
        try {
          if (!statSync(file).isFile()) return next();
        } catch {
          return next();
        }
        res.setHeader("Content-Type", MIME[extname(file).toLowerCase()] || "application/octet-stream");
        createReadStream(file).pipe(res);
      });
    },
  };
}

export default defineConfig({
  plugins: [solid(), repoServe()],
  server: {
    port: 5173,
    strictPort: true,
  },
});
