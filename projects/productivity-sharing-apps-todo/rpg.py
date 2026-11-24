"""RPG-System fuer die ToDo-Liste.

Reine Spiellogik ohne UI-Abhaengigkeiten, damit sie ohne Display
importiert und getestet werden kann (siehe test_rpg.py).
Die Tkinter-Oberflaeche in main.py ruft nur diese Funktionen auf.
"""

import json
import os
from datetime import date

XP_TABLE = {"Hoch": 50, "Normal": 25, "Niedrig": 10}
GOLD_TABLE = {"Hoch": 10, "Normal": 5, "Niedrig": 2}

THEMES = {
    "Standard": {"cost": 0, "bg": "white", "fg": "black", "select": "#0078d7"},
    "Mitternacht": {"cost": 50, "bg": "#1e1e2e", "fg": "#cdd6f4", "select": "#585b70"},
    "Wald": {"cost": 40, "bg": "#1a2b1a", "fg": "#d7f0d7", "select": "#3a6b3a"},
    "Ozean": {"cost": 90, "bg": "#0a1a2f", "fg": "#cfe8ff", "select": "#1d5f9e"},
    "Gold": {"cost": 120, "bg": "#2b2117", "fg": "#ffd75e", "select": "#8a6d2b"},
}

ITEMS = {
    "Streak-Schild": {"cost": 80, "desc": "Rettet den Streak einmal bei einer Luecke"},
    "Doppel-XP": {"cost": 60, "desc": "Naechste Aufgabe gibt doppelte XP"},
}

BOSS_NAMES = ["Rattenkoenig", "Bug-Golem", "Deadline-Drache", "Merge-Konflikt", "Legacy-Lindwurm"]


def boss_for(count):
    name = BOSS_NAMES[count % len(BOSS_NAMES)]
    max_hp = 300 + 200 * count
    return {"name": name, "hp": max_hp, "max_hp": max_hp, "level": count + 1}


SEASON_GOALS = [(500, 50), (1500, 150)]

RANKS = [
    (15, "Legende"),
    (12, "Großmeister"),
    (8, "Meister"),
    (5, "Geselle"),
    (3, "Lehrling"),
    (1, "Novize"),
]


def xp_needed(level):
    """XP, die fuer den Aufstieg von `level` auf `level + 1` noetig sind."""
    return 100 * level


def rank_for_level(level):
    for threshold, rank in RANKS:
        if level >= threshold:
            return rank
    return "Novize"


ACHIEVEMENTS = [
    {"id": "first_done", "name": "Erster Schritt",
     "desc": "1 Aufgabe erledigt", "bonus": 10,
     "check": lambda s: s.total_done >= 1},
    {"id": "fleissig_5", "name": "Fleißig",
     "desc": "5 Aufgaben erledigt", "bonus": 25,
     "check": lambda s: s.total_done >= 5},
    {"id": "profi_10", "name": "Profi",
     "desc": "10 Aufgaben erledigt", "bonus": 50,
     "check": lambda s: s.total_done >= 10},
    {"id": "streak_3", "name": "Dranbleiber",
     "desc": "3 Tage in Folge erledigt", "bonus": 30,
     "check": lambda s: s.best_streak >= 3},
    {"id": "streak_7", "name": "Unaufhaltsam",
     "desc": "7 Tage in Folge erledigt", "bonus": 70,
     "check": lambda s: s.best_streak >= 7},
    {"id": "level_3", "name": "Aufsteiger",
     "desc": "Level 3 erreicht", "bonus": 40,
     "check": lambda s: s.level >= 3},
    {"id": "level_5", "name": "Held",
     "desc": "Level 5 erreicht", "bonus": 100,
     "check": lambda s: s.level >= 5},
    {"id": "reich", "name": "Schatzsammler",
     "desc": "200 Gold insgesamt verdient", "bonus": 50,
     "check": lambda s: s.total_gold_earned >= 200},
    {"id": "boss_slayer", "name": "Bossbezwinger",
     "desc": "1 Boss besiegt", "bonus": 60,
     "check": lambda s: s.bosses_defeated >= 1},
    {"id": "boss_jaeger", "name": "Bossjaeger",
     "desc": "3 Bosse besiegt", "bonus": 150,
     "check": lambda s: s.bosses_defeated >= 3},
    {"id": "saison_star", "name": "Saisonstar",
     "desc": "1500 Saison-XP in einem Monat", "bonus": 100,
     "check": lambda s: s.season_best >= 1500},
]


class RpgState:
    def __init__(self):
        self.level = 1
        self.xp = 0
        self.gold = 0
        self.streak = 0
        self.best_streak = 0
        self.last_done = None  # ISO-Datum, z. B. "2026-11-24"
        self.total_done = 0
        self.total_gold_earned = 0
        self.achievements = []
        self.theme = "Standard"
        self.inventory = {"shield": 0, "double": 0}
        self.bosses_defeated = 0
        self.boss = boss_for(0)
        self.season = {"id": "", "xp": 0, "claimed": []}
        self.season_best = 0

    def to_dict(self):
        return {
            "level": self.level, "xp": self.xp, "gold": self.gold,
            "streak": self.streak, "best_streak": self.best_streak,
            "last_done": self.last_done, "total_done": self.total_done,
            "total_gold_earned": self.total_gold_earned,
            "achievements": self.achievements, "theme": self.theme,
            "inventory": self.inventory, "bosses_defeated": self.bosses_defeated,
            "boss": self.boss, "season": self.season,
            "season_best": self.season_best,
        }

    @classmethod
    def from_dict(cls, data):
        s = cls()
        if not isinstance(data, dict):
            return s
        for key in ("level", "xp", "gold", "streak", "best_streak",
                    "total_done", "total_gold_earned"):
            value = data.get(key)
            if isinstance(value, int) and value >= 0:
                setattr(s, key, value)
        if isinstance(data.get("last_done"), str):
            s.last_done = data["last_done"]
        if isinstance(data.get("achievements"), list):
            s.achievements = [a for a in data["achievements"] if isinstance(a, str)]
        if data.get("theme") in THEMES:
            s.theme = data["theme"]
        if s.level < 1:
            s.level = 1
        # Neue Felder: alte Spielstaende ohne sie weiterladen (Migration)
        inv = data.get("inventory")
        if isinstance(inv, dict):
            for key in ("shield", "double"):
                if isinstance(inv.get(key), int) and inv[key] >= 0:
                    s.inventory[key] = inv[key]
        if isinstance(data.get("bosses_defeated"), int) and data["bosses_defeated"] >= 0:
            s.bosses_defeated = data["bosses_defeated"]
        boss = data.get("boss")
        if isinstance(boss, dict) and isinstance(boss.get("hp"), int) and isinstance(boss.get("max_hp"), int):
            s.boss = {"name": str(boss.get("name", "Boss")),
                      "hp": max(0, boss["hp"]), "max_hp": max(1, boss["max_hp"]),
                      "level": boss.get("level", 1)}
        else:
            s.boss = boss_for(s.bosses_defeated)
        season = data.get("season")
        if isinstance(season, dict) and isinstance(season.get("id"), str):
            claimed = season.get("claimed")
            s.season = {"id": season["id"],
                        "xp": season["xp"] if isinstance(season.get("xp"), int) and season["xp"] >= 0 else 0,
                        "claimed": [c for c in claimed if isinstance(c, int)] if isinstance(claimed, list) else []}
        if isinstance(data.get("season_best"), int) and data["season_best"] >= 0:
            s.season_best = data["season_best"]
        return s

    def save(self, save_path):
        tmp = save_path + ".tmp"
        with open(tmp, "w", encoding="utf-8") as f:
            json.dump(self.to_dict(), f, ensure_ascii=False, indent=2)
        os.replace(tmp, save_path)

    @classmethod
    def load(cls, save_path):
        try:
            with open(save_path, encoding="utf-8") as f:
                return cls.from_dict(json.load(f))
        except (OSError, ValueError):
            return cls()

    @property
    def rank(self):
        return rank_for_level(self.level)

    def _add_gold(self, amount):
        self.gold += amount
        self.total_gold_earned += amount

    def _check_achievements(self):
        """Prueft alle Achievements, schreibt Boni gut. Gibt neue zurueck."""
        fresh = []
        for ach in ACHIEVEMENTS:
            if ach["id"] not in self.achievements and ach["check"](self):
                self.achievements.append(ach["id"])
                self._add_gold(ach["bonus"])
                fresh.append(ach)
        return fresh

    def complete_task(self, priority, today=None):
        """Eine Aufgabe der gegebenen Prioritaet abschliessen.

        Gibt ein Ergebnis-Dict zurueck:
        {"xp", "gold", "levels", "new_achievements", "streak",
         "shield_used", "doubled", "boss_damage", "boss_down",
         "season_xp", "season_rewards"}.
        """
        day = today or date.today().isoformat()
        shield_used = False
        if self.last_done != day:
            if self.last_done == _yesterday_of(day):
                self.streak += 1
            elif self.inventory["shield"] > 0:
                # Schild rettet den Streak ueber die Luecke hinweg
                self.inventory["shield"] -= 1
                self.streak += 1
                shield_used = True
            else:
                self.streak = 1
            self.last_done = day
            if self.streak > self.best_streak:
                self.best_streak = self.streak

        # Saisonwechsel (Monat): XP zuruecksetzen, Bestwert behalten
        season_id = day[:7]
        if self.season["id"] != season_id:
            if self.season["xp"] > self.season_best:
                self.season_best = self.season["xp"]
            self.season = {"id": season_id, "xp": 0, "claimed": []}

        xp_gain = XP_TABLE.get(priority, XP_TABLE["Normal"])
        gold_gain = GOLD_TABLE.get(priority, GOLD_TABLE["Normal"])
        xp_gain += min(self.streak * 5, 50)

        doubled = False
        if self.inventory["double"] > 0:
            self.inventory["double"] -= 1
            xp_gain *= 2
            doubled = True

        self.total_done += 1
        self._add_gold(gold_gain)

        self.xp += xp_gain
        levels = 0
        while self.xp >= xp_needed(self.level):
            self.xp -= xp_needed(self.level)
            self.level += 1
            levels += 1
            self._add_gold(25 * self.level)

        # Saison-XP + Schwellen-Belohnungen (einmalig je Saison)
        self.season["xp"] += xp_gain
        if self.season["xp"] > self.season_best:
            self.season_best = self.season["xp"]
        season_rewards = 0
        for threshold, bonus in SEASON_GOALS:
            if self.season["xp"] >= threshold and threshold not in self.season["claimed"]:
                self.season["claimed"].append(threshold)
                self._add_gold(bonus)
                season_rewards += bonus

        # Boss-Schaden = verdiente XP; bei 0 HP respawnt ein staerkerer
        boss_down = None
        self.boss["hp"] -= xp_gain
        if self.boss["hp"] <= 0:
            boss_down = self.boss["name"]
            reward = 100 + 50 * self.bosses_defeated
            self._add_gold(reward)
            self.bosses_defeated += 1
            self.boss = boss_for(self.bosses_defeated)

        fresh = self._check_achievements()
        return {
            "xp": xp_gain,
            "gold": gold_gain,
            "levels": levels,
            "new_achievements": [a["id"] for a in fresh],
            "streak": self.streak,
            "shield_used": shield_used,
            "doubled": doubled,
            "boss_damage": xp_gain,
            "boss_down": boss_down,
            "season_xp": self.season["xp"],
            "season_rewards": season_rewards,
        }

    def buy_theme(self, theme_name):
        """Theme kaufen und auswaehlen. Gibt (ok, nachricht) zurueck."""
        theme = THEMES.get(theme_name)
        if theme is None:
            return False, "Unbekanntes Design."
        if theme_name == self.theme:
            return True, "Bereits aktiv."
        if theme["cost"] > self.gold:
            return False, "Nicht genug Gold (%d nötig)." % theme["cost"]
        self.gold -= theme["cost"]
        self.theme = theme_name
        return True, "Design '%s' aktiviert." % theme_name

    def buy_item(self, item_name):
        """Verbrauchsgegenstand kaufen. Gibt (ok, nachricht) zurueck."""
        item = ITEMS.get(item_name)
        if item is None:
            return False, "Unbekannter Gegenstand."
        if item["cost"] > self.gold:
            return False, "Nicht genug Gold (%d nötig)." % item["cost"]
        self.gold -= item["cost"]
        if item_name == "Streak-Schild":
            self.inventory["shield"] += 1
        elif item_name == "Doppel-XP":
            self.inventory["double"] += 1
        return True, "'%s' gekauft." % item_name


def _yesterday_of(iso_day):
    y, m, d = (int(part) for part in iso_day.split("-"))
    return date.fromordinal(date(y, m, d).toordinal() - 1).isoformat()
