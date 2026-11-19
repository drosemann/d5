import React from "react";
import { createRoot } from "react-dom/client";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { Layout } from "./app";
import { seiten } from "./seiten";

const router = createBrowserRouter([{ path: "/", element: <Layout />, children: [
  { index: true, element: <seiten.Dashboard /> },
  { path: "agenten", element: <seiten.Agenten /> },
  { path: "chat", element: <seiten.Chat /> },
  { path: "angebote", element: <seiten.Angebote /> },
  { path: "kalender", element: <seiten.Kalender /> },
  { path: "sicherheit", element: <seiten.Sicherheit /> },
  { path: "freigaben", element: <seiten.Freigaben /> },
  { path: "einstellungen", element: <seiten.Einstellungen /> },
]}]);
createRoot(document.getElementById("root")!).render(<RouterProvider router={router} />);
