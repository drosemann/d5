// Pure logic ported verbatim from app/tools.js (window.d5Tools).
export function r2(x) { return Math.round(x * 100) / 100; }

export const CALC_OPS = [
  ["1", "Addition", 2], ["2", "Subtraction", 2], ["3", "Multiplication", 2],
  ["4", "Division", 2], ["5", "Power", 2], ["6", "Square Root", 1],
  ["7", "Factorial", 1], ["8", "Sine (degrees)", 1], ["9", "Cosine (degrees)", 1],
  ["10", "Tangent (degrees)", 1], ["11", "Log10", 1], ["12", "Natural Log", 1],
  ["13", "Absolute Value", 1], ["14", "Floor", 1], ["15", "Ceiling", 1],
  ["16", "Modulo", 2], ["17", "Percentage", 1], ["18", "Square", 1],
  ["19", "Cube", 1], ["20", "Inverse", 1], ["21", "Exponential", 1],
  ["22", "Degrees to Radians", 1], ["23", "Radians to Degrees", 1],
  ["24", "Hypotenuse", 2], ["25", "Fibonacci", 1],
];

export function factorial(a) {
  a = Math.trunc(a);
  if (a < 0) return "Error: Cannot calculate factorial of negative number";
  if (a === 0) return 1;
  let r = 1;
  for (let i = 2; i <= a; i++) r *= i;
  return r;
}
export function fibonacci(n) {
  n = Math.trunc(n);
  if (n <= 0) return "Error: Input must be positive";
  if (n === 1 || n === 2) return 1;
  let a = 1, b = 1;
  for (let i = 3; i <= n; i++) { const t = a + b; a = b; b = t; }
  return b;
}
export function calc(op, a, b) {
  switch (op) {
    case "1": return a + b; case "2": return a - b; case "3": return a * b;
    case "4": return b === 0 ? "Error: Division by zero" : a / b;
    case "5": return Math.pow(a, b);
    case "6": return a < 0 ? "Error: Cannot calculate square root of negative number" : Math.sqrt(a);
    case "7": return factorial(a);
    case "8": return Math.sin(a * Math.PI / 180);
    case "9": return Math.cos(a * Math.PI / 180);
    case "10": return Math.tan(a * Math.PI / 180);
    case "11": return a <= 0 ? "Error: Cannot calculate log of non-positive number" : Math.log10(a);
    case "12": return a <= 0 ? "Error: Cannot calculate log of non-positive number" : Math.log(a);
    case "13": return Math.abs(a);
    case "14": return Math.floor(a); case "15": return Math.ceil(a);
    case "16": return b === 0 ? "Error: Division by zero" : a % b;
    case "17": return a / 100; case "18": return a * a; case "19": return a * a * a;
    case "20": return a === 0 ? "Error: Division by zero" : 1 / a;
    case "21": return Math.exp(a);
    case "22": return a * Math.PI / 180; case "23": return a * 180 / Math.PI;
    case "24": return Math.hypot(a, b);
    case "25": return fibonacci(a);
    default: return "Invalid choice. Please choose a number between 1 and 25.";
  }
}

export function bmi(weight, height) {
  if (!(weight > 0) || !(height > 0)) return "Gewicht und Grösse müssen positive Werte sein.";
  const v = weight / (height * height);
  const cat = v < 18.5 ? "Untergewicht"
    : (v >= 18.5 && v < 24.9) ? "Normalgewicht"
    : (v >= 25 && v < 29.9) ? "Übergewicht" : "Adipositas";
  return "Ihr BMI beträgt: " + v.toFixed(2) + "\nSie haben: " + cat;
}

export function gcd(a, b) {
  a = Math.abs(a); b = Math.abs(b);
  while (b) { const t = a % b; a = b; b = t; }
  return a || 1;
}
export function bruchText(z, n) {
  const g = gcd(z, n === 0 ? 1 : n);
  const nn = n === 0 ? 1 : n;
  return (z / g) + " / " + (nn / g);
}

export function tokyo(km) {
  if (!(km > 0)) return "Bitte eine positive Strecke eingeben.";
  const adult = km <= 6 ? 170 : km <= 11 ? 200 : km <= 19 ? 250 : km <= 27 ? 290 : 320;
  const child = Math.ceil((adult / 2) / 10) * 10;
  return "Der Fahrpreis für " + km + " km beträgt:\nErwachsene: " + adult + " Yen\nKinder: " + child + " Yen";
}

export function verbrauch(previous, now, litres) {
  const dist = now - previous;
  if (!(dist > 0)) return "Der Kilometerstand muss steigen (jetzt > vorher).";
  return "Der durchschnittliche Verbrauch beträgt " + r2(litres / dist * 100).toFixed(2) + " Liter pro 100 Kilometer.";
}

const PAT = /^\s*(\d+)\s*\|\s*([^|]+)\s*\|\s*([\d-]+)\s*\|\s*([\d.]+)\s*$/;
export function parseWetter(text) {
  const out = [], errors = [];
  text.split(/\r?\n/).forEach((line, i) => {
    if (!line.trim()) return;
    const m = PAT.exec(line);
    if (!m) { errors.push("Zeile " + (i + 1) + " ungültig: " + line); return; }
    out.push({ id: parseInt(m[1], 10), name: m[2].trim(), date: m[3], value: parseFloat(m[4]) });
  });
  out.sort((a, b) => {
    if (a.id !== b.id) return a.id - b.id;
    if (a.date !== b.date) return a.date < b.date ? 1 : -1;
    return a.name < b.name ? -1 : a.name > b.name ? 1 : 0;
  });
  return { records: out, errors };
}
export const WETTER_SAMPLE = "42 | Müller | 2025-11-01 | 123.45\n7  | Schmidt| 2024-06-20 |  98.00\n42 | Mueller| 2025-11-02 | 123.50";

/* Pseudocode interpreter (from app/mc-tools.js viewPseudo). */
export function runPseudo(src) {
  const vars = {}, res = [];
  function exec(line) {
    const p = line.trim().split(/\s+/);
    if (p[0] === "SET") vars[p[1]] = parseFloat(p[2]) || 0;
    else if (p[0] === "ADD") vars[p[1]] = (vars[p[1]] || 0) + (parseFloat(p[2]) || 0);
    else if (p[0] === "PRINT") res.push(vars[p[1]] !== undefined ? String(vars[p[1]]) : p.slice(1).join(" "));
  }
  const lines = src.split("\n");
  let i = 0;
  while (i < lines.length) {
    const t = lines[i].trim().split(/\s+/);
    if (t[0] === "LOOP") {
      const n = parseInt(t[1], 10) || 1;
      const body = [];
      i++;
      while (i < lines.length && /^\s/.test(lines[i])) { body.push(lines[i]); i++; }
      for (let k = 0; k < n; k++) body.forEach(exec);
    } else { exec(lines[i]); i++; }
  }
  return res.join("\n") || "(keine Ausgabe)";
}
