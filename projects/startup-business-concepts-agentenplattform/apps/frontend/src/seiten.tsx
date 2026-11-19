import React, { useEffect, useState } from "react";
import "./styles.css";

type Aufgabe = { id: string; agent: string; titel: string; status: string };
type Inserat = { id: string; titel: string; preis: number | null; ranking: number };
type Tagesplan = { fixe_termine: {titel:string;von:string;bis:string}[]; vorschlaege: {empfehlung:string}[]; konflikte: {a:string;b:string;hinweis:string}[]; hinweis: string };

function useJson<T>(url: string, fallback: T): T {
  const [d, setD] = useState<T>(fallback);
  useEffect(() => { fetch(url).then(r => r.json()).then(setD).catch(() => {}); }, [url]);
  return d;
}
const DemoHinweis = () => <p style={{color:"var(--muted)"}}>Demo-Daten sind sichtbar als Beispiel gekennzeichnet.</p>;
const Dashboard = () => {
  const tasks = useJson<Aufgabe[]>("/api/v1/tasks", []);
  const plan = useJson<Tagesplan | null>("/api/v1/plan/tagesplan", null);
  return (<><h2>Willkommen – Tagesstatus</h2><DemoHinweis/>
    <div className="kachel-raster">
      <div className="kachel"><h2>Offene Aufgaben</h2><p>{tasks.filter(t=>["pending","queued","running"].includes(t.status)).length}</p></div>
      <div className="kachel"><h2>Fixe Termine heute</h2><p>{plan ? plan.fixe_termine.length : "…"}</p></div>
      <div className="kachel"><h2>Konflikte</h2><p>{plan ? plan.konflikte.length : "…"}</p></div>
    </div>
    {plan && plan.vorschlaege.length > 0 && <div className="kachel"><h2>Plan-Vorschlag</h2>{plan.vorschlaege.map((v,i)=><p key={i}>{v.empfehlung}</p>)}<p style={{color:"var(--muted)"}}>{plan.hinweis}</p></div>}
    {plan && plan.konflikte.length > 0 && <div className="kachel"><h2>Achtung: Überlappungen</h2>{plan.konflikte.map((k,i)=><p key={i}>{k.a} ↔ {k.b} – {k.hinweis}</p>)}</div>}</>);
};
const Agenten = () => {
  const a = useJson<{id:string;name:string;beschreibung:string}[]>("/api/v1/agents", []);
  return (<><h2>Agenten</h2><div className="kachel-raster">{a.map(x=><div className="kachel" key={x.id}><h2>{x.name}</h2><p>{x.beschreibung}</p></div>)}</div></>);
};
const Chat = () => {
  const [titel, setTitel] = useState(""); const [msg, setMsg] = useState("");
  const senden = async () => {
    const r = await fetch("/api/v1/tasks", {method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify({titel, eingabe:{text:titel}} )});
    setMsg(r.ok ? "Auftrag angelegt." : "Fehler: Auftrag abgelehnt – Details in Aufgabenliste.");
  };
  return (<><h2>Chat & Aufgaben</h2><input aria-label="Auftrag" value={titel} onChange={e=>setTitel(e.target.value)} placeholder="z. B. Plane meinen Dienstag mit Gym" style={{width:"100%",padding:12}}/>
    <p><button className="knopf fokus-sichtbar" onClick={senden}>Senden (Abbrechen in Liste möglich)</button></p><p>{msg}</p></>);
};
const Angebote = () => {
  const [liste, setListe] = useState<Inserat[]>([]);
  const [msg, setMsg] = useState("");
  const laden = () => { fetch("/api/v1/listings").then(r=>r.json()).then(setListe).catch(()=>{}); };
  useEffect(laden, []);
  const importieren = async () => {
    const r = await fetch("/api/v1/listings/import", {method:"POST", headers:{"Content-Type":"application/json"},
      body: JSON.stringify({profil_id:"demo", quelle:"demo", max_preis:1000})});
    const d = await r.json(); setMsg(`${d.neu} neu, ${d.doppelt} doppelt (Quelle: ${d.quelle})`); laden();
  };
  return (<><h2>Angebote</h2><DemoHinweis/>
    <p><button className="knopf fokus-sichtbar" onClick={importieren}>Demo-Import starten</button> <span>{msg}</span></p>
    <div className="kachel-raster">{liste.map(l=><div className="kachel" key={l.id}><h2>{l.titel}</h2><p>{l.preis ? `${l.preis} €` : "Preis fehlt"} · Rang {l.ranking}</p></div>)}</div></>);
};
const Sicherheit = () => {
  const [msg, setMsg] = useState("");
  const sos = async (echt:boolean) => {
    if (echt && !confirm("Wirklich SOS auslösen?")) return;
    const r = await fetch("/api/v1/safety/sos", {method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify({idempotency_key:crypto.randomUUID()})});
    const d = await r.json(); setMsg(d.hinweis ?? d.status);
  };
  return (<><h2>Standort & SOS</h2><p>Letzte Position: Demo-Spur · vor 10 Min · synchronisiert</p>
    <p><button className="knopf fokus-sichtbar" onClick={()=>sos(false)}>Testalarm (kein Versand)</button> <button className="knopf gefahr fokus-sichtbar" onClick={()=>sos(true)}>SOS</button></p><p>{msg}</p></>);
};
type Termin = { id: string; titel: string; beginn: string; ende: string; fix: boolean };
const Kalender = () => {
  const [termine, setTermine] = useState<Termin[]>([]);
  const [t, setT] = useState({titel:"", beginn:"", ende:""});
  const laden = () => { fetch("/api/v1/calendar").then(r=>r.json()).then(setTermine).catch(()=>{}); };
  useEffect(laden, []);
  const speichern = async () => {
    const r = await fetch("/api/v1/calendar", {method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify(t)});
    if (r.ok) { setT({titel:"", beginn:"", ende:""}); laden(); }
  };
  return (<><h2>Kalender</h2>
    <div className="kachel"><h2>Neuer Termin</h2>
      <input aria-label="Titel" placeholder="Titel" value={t.titel} onChange={e=>setT({...t, titel:e.target.value})} style={{width:"100%",padding:10,marginBottom:8}}/>
      <input aria-label="Beginn" type="datetime-local" value={t.beginn} onChange={e=>setT({...t, beginn:e.target.value})} style={{width:"100%",padding:10,marginBottom:8}}/>
      <input aria-label="Ende" type="datetime-local" value={t.ende} onChange={e=>setT({...t, ende:e.target.value})} style={{width:"100%",padding:10,marginBottom:8}}/>
      <p><button className="knopf fokus-sichtbar" onClick={speichern}>Eintragen</button></p></div>
    <div className="kachel-raster">{termine.map(x=><div className="kachel" key={x.id}><h2>{x.titel}</h2><p>{x.beginn} → {x.ende}{x.fix ? " (fix)" : ""}</p></div>)}</div></>);
};
type Freigabe = { id: string; task: string; zweck: string; status: string };
const Freigaben = () => {
  const [liste, setListe] = useState<Freigabe[]>([]);
  const laden = () => { fetch("/api/v1/approvals").then(r=>r.json()).then(setListe).catch(()=>{}); };
  useEffect(laden, []);
  const entscheiden = async (id: string, genehmigt: boolean) => {
    await fetch(`/api/v1/approvals/${id}`, {method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify({genehmigt})});
    laden();
  };
  const offen = liste.filter(f=>f.status==="offen");
  return (<><h2>Freigaben</h2>
    {offen.length === 0 && <p>Keine ausstehenden Aktionen.</p>}
    <div className="kachel-raster">{offen.map(f=><div className="kachel" key={f.id}><h2>{f.zweck}</h2>
      <p><button className="knopf fokus-sichtbar" onClick={()=>entscheiden(f.id, true)}>Genehmigen</button> <button className="knopf fokus-sichtbar" onClick={()=>entscheiden(f.id, false)}>Ablehnen</button></p></div>)}</div></>);
};
const Einstellungen = () => {
  const status = useJson<any>("/api/v1/system/status", null);
  return (<><h2>Einstellungen</h2>
    <p>Provider, E-Mail, Aufbewahrung, Kontakte – Schlüssel werden nie im Klartext angezeigt.</p>
    <div className="kachel"><h2>Systemdiagnose</h2>{status ? (<>
      <p>Demo-Modus: {status.demo_modus ? "an" : "aus"}</p>
      <p>Worker: {status.worker_heartbeat}</p>
      <p>Backup-Ziel: {status.backup.ziel_konfiguriert ? "konfiguriert" : "nicht konfiguriert"} (Check: {status.backup.letzter_check})</p>
      <p>Aufgaben: {Object.entries(status.tasks_pro_status).map(([k,v])=>`${k}: ${v}`).join(" · ") || "keine"}</>
    ) : <p>Lade …</p>}</div></>);
};
export const seiten = { Dashboard, Agenten, Chat, Angebote, Kalender, Sicherheit, Freigaben, Einstellungen };
