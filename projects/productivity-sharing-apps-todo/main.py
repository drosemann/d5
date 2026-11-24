"""ToDo-Liste mit RPG-System (Level, XP, Gold, Streaks, Achievements, Shop)."""
import os
import tkinter as tk
from tkinter import messagebox, ttk
import pickle

import rpg
from rpg import RpgState, THEMES, ITEMS, ACHIEVEMENTS

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
TASKS_PATH = os.path.join(BASE_DIR, "tasks.pkl")
RPG_PATH = os.path.join(BASE_DIR, "rpg_save.json")


class ToDoApp:
    def __init__(self, root):
        # Initialisiere das Hauptfenster
        self.root = root
        self.root.title("ToDo Liste")
        self.state = RpgState.load(RPG_PATH)

        # RPG-Statusleiste
        self.status_var = tk.StringVar()
        self.status_label = tk.Label(root, textvariable=self.status_var,
                                     font=("Arial", 10, "bold"))
        self.status_label.pack(pady=(8, 0))
        self.xp_bar = ttk.Progressbar(root, length=300, mode="determinate")
        self.xp_bar.pack(pady=4)
        self.boss_var = tk.StringVar()
        self.boss_label = tk.Label(root, textvariable=self.boss_var, font=("Arial", 9))
        self.boss_label.pack()
        self.boss_bar = ttk.Progressbar(root, length=300, mode="determinate")
        self.boss_bar.pack(pady=4)
        self.refresh_status()

        # Eingabefeld für neue Aufgaben
        self.entry = tk.Entry(root, width=50)
        self.entry.pack(pady=10)

        # Button zum Hinzufügen von Aufgaben
        self.add_button = tk.Button(root, text="Aufgabe hinzufügen", command=self.add_task)
        self.add_button.pack(pady=5)

        # Listbox zur Anzeige der Aufgaben
        self.listbox = tk.Listbox(root, width=50, height=10)
        self.listbox.pack(pady=10)

        # Button zum Löschen von Aufgaben
        self.delete_button = tk.Button(root, text="Aufgabe löschen", command=self.delete_task)
        self.delete_button.pack(pady=5)

        # Button zum Speichern der Aufgaben
        self.save_button = tk.Button(root, text="Aufgaben speichern", command=self.save_tasks)
        self.save_button.pack(pady=5)

        # Button zum Markieren von Aufgaben als erledigt
        self.done_button = tk.Button(root, text="Aufgabe erledigt (+XP)", command=self.mark_task_done)
        self.done_button.pack(pady=5)

        # Button zum Bearbeiten von Aufgaben
        self.edit_button = tk.Button(root, text="Aufgabe bearbeiten", command=self.edit_task)
        self.edit_button.pack(pady=5)

        # RPG-Buttons
        self.quest_button = tk.Button(root, text="Questlog", command=self.show_quests)
        self.quest_button.pack(pady=5)
        self.shop_button = tk.Button(root, text="Shop", command=self.show_shop)
        self.shop_button.pack(pady=5)

        # Dropdown-Menü für Priorität
        self.priority_var = tk.StringVar(value="Normal")
        self.priority_menu = tk.OptionMenu(root, self.priority_var, "Hoch", "Normal", "Niedrig")
        self.priority_menu.pack(pady=5)

        # Lade gespeicherte Aufgaben beim Start
        self.load_tasks()
        self.apply_theme()

    # ---------- RPG-Darstellung ----------
    def refresh_status(self):
        need = rpg.xp_needed(self.state.level)
        inv = self.state.inventory
        self.status_var.set(
            "Level %d (%s) · %d/%d XP · %d Gold · %d🔥 Streak · %d erledigt\n"
            "Saison %s: %d XP · 🛡 %d · ✖️2 %d · 👑 %d Bosse" % (
                self.state.level, self.state.rank, self.state.xp, need,
                self.state.gold, self.state.streak, self.state.total_done,
                self.state.season["id"] or "–", self.state.season["xp"],
                inv["shield"], inv["double"], self.state.bosses_defeated))
        self.xp_bar["maximum"] = need
        self.xp_bar["value"] = self.state.xp
        boss = self.state.boss
        self.boss_var.set("Boss: %s (Stufe %d) · %d/%d HP" % (
            boss["name"], boss.get("level", 1), max(0, boss["hp"]), boss["max_hp"]))
        self.boss_bar["maximum"] = boss["max_hp"]
        self.boss_bar["value"] = max(0, boss["hp"])

    def save_rpg(self):
        try:
            self.state.save(RPG_PATH)
        except OSError as exc:
            messagebox.showwarning("Warnung", "RPG-Spielstand nicht speicherbar: %s" % exc)

    def apply_theme(self):
        theme = THEMES.get(self.state.theme, THEMES["Standard"])
        self.listbox.configure(bg=theme["bg"], fg=theme["fg"],
                               selectbackground=theme["select"])

    # ---------- Aufgaben ----------
    def add_task(self):
        # Füge eine neue Aufgabe hinzu
        task = self.entry.get()
        priority = self.priority_var.get()
        if task:
            self.listbox.insert(tk.END, "%s: %s" % (priority, task))
            self.entry.delete(0, tk.END)
        else:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe eingeben.")

    def delete_task(self):
        # Lösche die ausgewählte Aufgabe
        try:
            selected_task_index = self.listbox.curselection()[0]
            self.listbox.delete(selected_task_index)
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")

    def save_tasks(self):
        # Speichere die Aufgaben in einer Datei
        with open(TASKS_PATH, "wb") as f:
            pickle.dump(self.listbox.get(0, tk.END), f)

    def load_tasks(self):
        # Lade die Aufgaben aus einer Datei (neuer Pfad, Fallback: Arbeitsverzeichnis)
        for candidate in (TASKS_PATH, "tasks.pkl"):
            try:
                with open(candidate, "rb") as f:
                    tasks = pickle.load(f)
                    for task in tasks:
                        self.listbox.insert(tk.END, task)
                return
            except (FileNotFoundError, OSError, ValueError):
                continue

    def mark_task_done(self):
        # Markiere die ausgewählte Aufgabe als erledigt und vergebe RPG-Belohnung
        try:
            selected_task_index = self.listbox.curselection()[0]
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")
            return
        if self.listbox.itemcget(selected_task_index, "bg") == "lightgreen":
            messagebox.showinfo("Info", "Diese Aufgabe ist schon erledigt — keine doppelte XP.")
            return
        text = self.listbox.get(selected_task_index)
        priority = text.split(":", 1)[0].strip() if ":" in text else "Normal"
        result = self.state.complete_task(priority)
        self.save_rpg()
        self.listbox.itemconfig(selected_task_index, {"bg": "lightgreen"})
        self.refresh_status()
        msg = "+%d XP · +%d Gold · %d🔥 Streak" % (result["xp"], result["gold"], result["streak"])
        if result["doubled"]:
            msg += " (Doppel-XP!)"
        if result["shield_used"]:
            msg += "\n🛡 Streak-Schild hat den Streak gerettet!"
        boss_name = result["boss_down"] or self.state.boss["name"]
        msg += "\n👊 %d Schaden an %s" % (result["boss_damage"], boss_name)
        if result["boss_down"]:
            msg += "\n👑 Boss besiegt: %s!" % result["boss_down"]
        if result["season_rewards"]:
            msg += "\n🌟 Saison-Bonus: +%d Gold" % result["season_rewards"]
        if result["levels"]:
            msg += "\nLevel aufgestiegen: jetzt Level %d (%s)!" % (self.state.level, self.state.rank)
        for ach_id in result["new_achievements"]:
            ach = next(a for a in ACHIEVEMENTS if a["id"] == ach_id)
            msg += "\n🏆 Achievement: %s (+%d Gold)" % (ach["name"], ach["bonus"])
        messagebox.showinfo("Belohnung", msg)

    def edit_task(self):
        # Bearbeite die ausgewählte Aufgabe
        try:
            selected_task_index = self.listbox.curselection()[0]
            new_task = self.entry.get()
            if new_task:
                self.listbox.delete(selected_task_index)
                self.listbox.insert(selected_task_index, new_task)
                self.entry.delete(0, tk.END)
            else:
                messagebox.showwarning("Warnung", "Bitte eine Aufgabe eingeben.")
        except IndexError:
            messagebox.showwarning("Warnung", "Bitte eine Aufgabe auswählen.")

    # ---------- Questlog & Shop ----------
    def show_quests(self):
        win = tk.Toplevel(self.root)
        win.title("Questlog")
        unlocked = set(self.state.achievements)
        for ach in ACHIEVEMENTS:
            mark = "🏆" if ach["id"] in unlocked else "·"
            tk.Label(win, text="%s %s — %s (+%d Gold)" % (
                mark, ach["name"], ach["desc"], ach["bonus"]),
                anchor="w", justify="left").pack(fill="x", padx=10, pady=2)
        tk.Label(win, text="Bester Streak: %d Tage" % self.state.best_streak).pack(pady=8)

    def show_shop(self):
        win = tk.Toplevel(self.root)
        win.title("Shop — %d Gold" % self.state.gold)
        tk.Label(win, text="Inventar: 🛡 %d Schild · ✖️2 %d Doppel-XP" % (
            self.state.inventory["shield"], self.state.inventory["double"]),
            font=("Arial", 9, "bold")).pack(pady=4)
        tk.Label(win, text="Designs", font=("Arial", 10, "bold")).pack()
        for theme_name, theme in THEMES.items():
            owned = theme_name == self.state.theme
            label = "%s (%d Gold)%s" % (theme_name, theme["cost"],
                                        " — aktiv" if owned else "")
            row = tk.Frame(win)
            row.pack(fill="x", padx=10, pady=2)
            tk.Label(row, text=label).pack(side="left")
            tk.Button(row, text="Wählen" if owned or theme["cost"] == 0 else "Kaufen",
                      command=lambda t=theme_name, w=win: self.buy_theme(t, w)).pack(side="right")
        tk.Label(win, text="Items", font=("Arial", 10, "bold")).pack()
        for item_name, item in ITEMS.items():
            row = tk.Frame(win)
            row.pack(fill="x", padx=10, pady=2)
            tk.Label(row, text="%s (%d Gold) — %s" % (item_name, item["cost"], item["desc"]),
                     wraplength=280, justify="left").pack(side="left")
            tk.Button(row, text="Kaufen",
                      command=lambda t=item_name, w=win: self.buy_item(t, w)).pack(side="right")

    def buy_theme(self, theme_name, win):
        ok, msg = self.state.buy_theme(theme_name)
        if ok:
            self.save_rpg()
            self.apply_theme()
            self.refresh_status()
            win.destroy()
            self.show_shop()
        else:
            messagebox.showwarning("Shop", msg)

    def buy_item(self, item_name, win):
        ok, msg = self.state.buy_item(item_name)
        if ok:
            self.save_rpg()
            self.refresh_status()
            win.destroy()
            self.show_shop()
        else:
            messagebox.showwarning("Shop", msg)


if __name__ == "__main__":
    # Starte die Anwendung
    root = tk.Tk()
    app = ToDoApp(root)
    root.mainloop()
