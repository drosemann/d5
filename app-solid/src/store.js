/* Shared localStorage helpers (mirrors store in app/apps.js etc.). */
export function storeGet(key, fallback) {
  try {
    const v = localStorage.getItem("d5:" + key);
    return v == null ? fallback : JSON.parse(v);
  } catch {
    return fallback;
  }
}
export function storeSet(key, value) {
  try {
    localStorage.setItem("d5:" + key, JSON.stringify(value));
  } catch {
    /* storage unavailable — silent like the original */
  }
}
export function esc(s) {
  return String(s).replace(/[&<>"']/g, (c) => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;",
  })[c]);
}
