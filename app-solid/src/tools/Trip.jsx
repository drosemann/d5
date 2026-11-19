/* Trip to the Makers — hub with tabs (ported from app/trip.js). Data in trip-data.js. */
import { createSignal, For, Show } from "solid-js";
import { TRIP, TRIP_DE, STR, TABS, LANG_KEY, initialLang } from "../trip-data.js";

TRIP.extra = [
  { day: "If things go wrong (16-contingency)", meals: ["Missed S-Bahn: take the next one, skip gate breakfast", "Flight gone: Star Alliance rebook via MUC/ZRH, EU261 up to €600", "Long CBP: nothing breaks — BART/Caltrain run all day", "Lost passport: copy + police report + SF consulate", "Rain: full CHM day, Intel Museum, Cantor Arts Center"] },
  { day: "7-day version (17-extended)", meals: ["Days 0–3 unchanged (Menlo Park base)", "Day 4: Caltrain to SF, Ferry Building, Fisherman’s Wharf", "Day 5: cable car, Lombard St, Golden Gate, Mission burrito", "Day 6: Golden Gate Park museum + Haight-Ashbury", "Surcharge ~€800–1,000 → total ~€2,600–3,200"] },
];
TRIP.food = [
  { day: "Outbound", meals: ["Home: light breakfast (yogurt, coffee)", "FRA T1 gate: sandwiches ~€10–15", "LH454: lunch + snack + pre-landing breakfast — eat it all"] },
  { day: "Day 0 dinner", meals: ["yeobo, darling, 827 Santa Cruz Ave (~$40–60)", "Backup: Camper, 898 Santa Cruz Ave", "Tired option: tacos/pizza ~$15–20. No alcohol night one."] },
  { day: "Day 1", meals: ["Breakfast: Mademoiselle Colette to-go (~$10)", "Lunch: tour-dependent (~$15–20)", "Dinner: Eylan (Bib Gourmand) or Bistro Vida (~$40–60)"] },
  { day: "Day 2", meals: ["Breakfast: Cafe Borrone, 1010 El Camino (~$12)", "Lunch: CHM cafe or Castro St (~$15–20)", "Dinner: University Ave — Local Union 271 (~$20–40)"] },
  { day: "Day 3", meals: ["Breakfast: hotel + Philz Mint Mojito (~$7)", "Lunch: Apple Park VC cafe + Palo Alto bite (~$15–25)", "SFO Intl G: 1300 on Fillmore / Mustards / Gott’s / Bun Mee (~$20–35)"] },
];

const CHECK_KEY = "d5-trip-checklist";
function loadCheck() {
  try {
    const raw = localStorage.getItem(CHECK_KEY);
    if (raw) return JSON.parse(raw);
  } catch { /* ignore */ }
  return {};
}

export function ViewTrip({ arg }) {
  const a = arg || "days";
  const [lang, setLang] = createSignal(initialLang());
  const T = (k) => STR[lang()][k];
  const D = () => (lang() === "de" ? TRIP_DE : TRIP);

  function TabsBar({ active }) {
    return (
      <div class="trip-tabs">
        <For each={TABS}>{(t) => (
          <a class={t[0] === active ? "on" : ""} href={"/#/tool/trip/" + t[0]}>{T(t[0])}</a>
        )}</For>
        <button onClick={() => {
          const next = lang() === "de" ? "en" : "de";
          setLang(next);
          try { localStorage.setItem(LANG_KEY, next); } catch { /* ignore */ }
        }}>{T("langBtn")}</button>
      </div>
    );
  }

  function Days({ dayId }) {
    return (
      <>
        <TabsBar active="days" />
        <p class="meta">{T("langNote")}</p>
        <Show when={!dayId} fallback={<DayDetail dayId={dayId} />}>
          <div class="cards">
            <For each={D().days}>{(d) => (
              <div class="card">
                <strong>{d.title}</strong>
                <p class="meta">{d.legs.length} {T("legs")}</p>
                <a href={"/#/tool/trip/" + d.id}>{T("open")}</a>
              </div>
            )}</For>
          </div>
        </Show>
      </>
    );
  }

  function DayDetail({ dayId }) {
    const d = D().days.find((x) => x.id === dayId);
    if (!d) return <p>{T("unknown")}{dayId}</p>;
    return (
      <>
        <h3>{d.title}</h3>
        <img src={"/" + d.img} class="trip-img" alt={d.title} onError={(e) => { e.currentTarget.style.display = "none"; }} />
        <p class="meta">{T("caption")}</p>
        <div class="trip-timeline">
          <For each={d.legs}>{(leg) => (
            <div class="trip-leg"><strong>{leg[0]}</strong><span>{leg[1]}</span></div>
          )}</For>
        </div>
      </>
    );
  }

  function Checklist() {
    const [state, setState] = createSignal(loadCheck());
    const total = () => D().checklist.reduce((s, g) => s + g.items.length, 0);
    const done = () => D().checklist.reduce((s, g, gi) => s + g.items.filter((_, ii) => state()[gi + "|" + ii]).length, 0);
    return (
      <>
        <TabsBar active="checklist" />
        <p class="meta">{T("packed")}{done()} / {total()}</p>
        <For each={D().checklist}>{(g, gi) => (
          <>
            <h3>{g.group}</h3>
            <For each={g.items}>{(_, ii) => {
              const id = gi() + "|" + ii();
              return (
                <label class="trip-check">
                  <input type="checkbox" checked={!!state()[id]} onChange={(e) => {
                    const next = { ...state(), [id]: e.target.checked };
                    setState(next);
                    try { localStorage.setItem(CHECK_KEY, JSON.stringify(next)); } catch { /* ignore */ }
                  }} />
                  {" " + g.items[ii()]}
                </label>
              );
            }}</For>
          </>
        )}</For>
      </>
    );
  }

  function Budget({ level }) {
    const lv = level || "m";
    const order = ["b", "m", "c"];
    const names = T("budgetNames");
    const li = order.indexOf(lv);
    const sum = D().budget.reduce((s, r) => s + r[lv], 0);
    const rows = D().budget.map((r) => r.item + ": ~€" + r[lv]);
    return (
      <>
        <TabsBar active="budget" />
        <div class="trip-tabs">
          <For each={order}>{(l, i) => (
            <a class={l === lv ? "on" : ""} href={"/#/tool/trip/budget-" + l}>{names[i()]}</a>
          )}</For>
        </div>
        <p class="meta">{T("budgetTotal")} {names[li]}: ~€{sum} {T("budgetPer")}</p>
        <pre class="result">{rows.join("\n") + "\n— — —\n" + T("budgetTotal") + ": €" + sum}</pre>
        <p class="meta">{T("budgetLevers")}</p>
      </>
    );
  }

  return (
    <>
      {a === "days" || a.startsWith("day") ? <Days dayId={a === "days" ? null : a} />
        : a === "food" ? <><TabsBar active="food" /><FoodCards cards={D().food} /><p class="meta">{T("foodNote")}</p></>
        : a === "extra" ? <><TabsBar active="extra" /><FoodCards cards={D().extra} /><p class="meta">{T("extraNote")}</p></>
        : a === "checklist" ? <Checklist />
        : a === "budget" || a.startsWith("budget-") ? <Budget level={a.slice(7) || "m"} />
        : a === "sights" ? <><TabsBar active="sights" /><For each={D().sights}>{(s) => (
            <div class="card"><strong>{s.name}</strong><p class="meta">{s.where}</p><p>{s.note}</p></div>
          )}</For></>
        : a === "videos" ? <><TabsBar active="videos" /><div><For each={D().videos}>{(v) => (
            <p><a href={v.url}>{v.title}</a></p>
          )}</For></div><p class="meta">{T("videosNote")}</p></>
        : <Days dayId={null} />}
    </>
  );
}

function FoodCards({ cards }) {
  return (
    <For each={cards}>{(f) => (
      <div class="card">
        <strong>{f.day}</strong>
        <For each={f.meals}>{(m) => <p>{m}</p>}</For>
      </div>
    )}</For>
  );
}
