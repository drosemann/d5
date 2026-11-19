/* Calculator / BMI / Bruch / Tokyo / Verbrauch / Wetter — ported from app.js tool views. */
import { createSignal, For } from "solid-js";
import { CALC_OPS, calc, bmi, bruchText, tokyo, verbrauch, parseWetter, WETTER_SAMPLE } from "../logic.js";

export function ViewCalc() {
  const [op, setOp] = createSignal("1");
  const [a, setA] = createSignal("");
  const [b, setB] = createSignal("");
  const [result, setResult] = createSignal("");
  return (
    <div class="tool-form">
      <select value={op()} onChange={(e) => setOp(e.target.value)}>
        <For each={CALC_OPS}>{(o) => <option value={o[0]}>{o[0]}. {o[1]}</option>}</For>
      </select>
      <input type="number" placeholder="a" value={a()} onInput={(e) => setA(e.target.value)} />
      <input type="number" placeholder="b" value={b()} onInput={(e) => setB(e.target.value)} />
      <button onClick={() => setResult(String(calc(op(), parseFloat(a()), parseFloat(b()))))}>Run</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}

export function ViewBmi() {
  const [w, setW] = createSignal("");
  const [h, setH] = createSignal("");
  const [result, setResult] = createSignal("");
  return (
    <div class="tool-form">
      <input type="number" placeholder="weight kg" value={w()} onInput={(e) => setW(e.target.value)} />
      <input type="number" placeholder="height m" value={h()} onInput={(e) => setH(e.target.value)} />
      <button onClick={() => setResult(bmi(parseFloat(w()), parseFloat(h())))}>Run</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}

export function ViewBruch() {
  const [z, setZ] = createSignal("");
  const [n, setN] = createSignal("");
  const [result, setResult] = createSignal("");
  return (
    <div class="tool-form">
      <input type="number" placeholder="Zähler" value={z()} onInput={(e) => setZ(e.target.value)} />
      <input type="number" placeholder="Nenner" value={n()} onInput={(e) => setN(e.target.value)} />
      <button onClick={() => setResult(bruchText(parseInt(z(), 10) || 0, parseInt(n(), 10) || 1))}>Run</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}

export function ViewTokyo() {
  const [km, setKm] = createSignal("");
  const [result, setResult] = createSignal("");
  return (
    <div class="tool-form">
      <input type="number" placeholder="km" value={km()} onInput={(e) => setKm(e.target.value)} />
      <button onClick={() => setResult(tokyo(parseFloat(km())))}>Run</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}

export function ViewVerbrauch() {
  const [p, setP] = createSignal("");
  const [n, setN] = createSignal("");
  const [l, setL] = createSignal("");
  const [result, setResult] = createSignal("");
  return (
    <div class="tool-form">
      <input type="number" placeholder="km vorher" value={p()} onInput={(e) => setP(e.target.value)} />
      <input type="number" placeholder="km jetzt" value={n()} onInput={(e) => setN(e.target.value)} />
      <input type="number" placeholder="Liter" value={l()} onInput={(e) => setL(e.target.value)} />
      <button onClick={() => setResult(verbrauch(parseFloat(p()), parseFloat(n()), parseFloat(l())))}>Run</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}

export function ViewWetter() {
  const [text, setText] = createSignal(WETTER_SAMPLE);
  const [result, setResult] = createSignal("");
  function run() {
    const r = parseWetter(text());
    setResult(
      r.records.map((x) => x.id + " | " + x.name + " | " + x.date + " | " + x.value).join("\n") +
        (r.errors.length ? "\n--- errors ---\n" + r.errors.join("\n") : "")
    );
  }
  return (
    <div class="tool-form">
      <textarea rows="6" cols="50" value={text()} onInput={(e) => setText(e.target.value)} />
      <button onClick={run}>Parse + sort</button>
      <pre class="result">{result()}</pre>
    </div>
  );
}
