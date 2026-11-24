"""Tests fuers ToDo-RPG (rpg.py). Laeuft ohne Display:

    python test_rpg.py
"""

import os
import tempfile
import unittest

import rpg
from rpg import RpgState


class TestXp(unittest.TestCase):
    def test_priority_xp(self):
        s = RpgState()
        r = s.complete_task("Hoch", today="2026-11-24")
        # 50 XP + Streak-Bonus 5 (Streak 1)
        self.assertEqual(r["xp"], 55)
        self.assertEqual(r["gold"], 10)
        self.assertEqual(s.total_done, 1)

    def test_unknown_priority_falls_back_to_normal(self):
        s = RpgState()
        r = s.complete_task("???", today="2026-11-24")
        self.assertEqual(r["xp"], 25 + 5)

    def test_level_up_at_100(self):
        s = RpgState()
        # 2x Hoch = 2 * 55 = 110 -> Level 2, 10 XP Rest, Bonus 50 Gold
        s.complete_task("Hoch", today="2026-11-24")
        r = s.complete_task("Hoch", today="2026-11-24")
        self.assertEqual(r["levels"], 1)
        self.assertEqual(s.level, 2)
        self.assertEqual(s.xp, 10)
        self.assertNotIn("level_3", s.achievements)

    def test_multi_level(self):
        s = RpgState()
        s.xp = 95
        r = s.complete_task("Hoch", today="2026-11-24")  # 95 + 55 = 150
        self.assertEqual(r["levels"], 1)
        self.assertEqual(s.level, 2)
        self.assertEqual(s.xp, 50)

    def test_rank_titles(self):
        self.assertEqual(rpg.rank_for_level(1), "Novize")
        self.assertEqual(rpg.rank_for_level(3), "Lehrling")
        self.assertEqual(rpg.rank_for_level(5), "Geselle")
        self.assertEqual(rpg.rank_for_level(8), "Meister")
        self.assertEqual(rpg.rank_for_level(12), "Großmeister")
        self.assertEqual(rpg.rank_for_level(20), "Legende")


class TestStreak(unittest.TestCase):
    def test_same_day_keeps_streak(self):
        s = RpgState()
        s.complete_task("Normal", today="2026-11-24")
        s.complete_task("Normal", today="2026-11-24")
        self.assertEqual(s.streak, 1)
        self.assertEqual(s.best_streak, 1)

    def test_consecutive_days(self):
        s = RpgState()
        s.complete_task("Normal", today="2026-11-22")
        s.complete_task("Normal", today="2026-11-23")
        s.complete_task("Normal", today="2026-11-24")
        self.assertEqual(s.streak, 3)
        self.assertIn("streak_3", s.achievements)

    def test_gap_resets_streak(self):
        s = RpgState()
        s.complete_task("Normal", today="2026-11-20")
        s.complete_task("Normal", today="2026-11-24")
        self.assertEqual(s.streak, 1)
        self.assertEqual(s.best_streak, 1)


class TestAchievements(unittest.TestCase):
    def test_first_done_bonus_once(self):
        s = RpgState()
        gold_before = s.gold
        s.complete_task("Niedrig", today="2026-11-24")
        self.assertIn("first_done", s.achievements)
        bonus_gold = s.gold - gold_before - 2  # ohne Aufgaben-Gold
        self.assertEqual(bonus_gold, 10)
        # zweite Aufgabe: kein doppelter Bonus
        gold_mid = s.gold
        s.complete_task("Niedrig", today="2026-11-24")
        self.assertEqual(s.gold - gold_mid, 2)

    def test_level_achievement(self):
        s = RpgState()
        s.level = 3
        fresh = s._check_achievements()
        self.assertIn("level_3", [a["id"] for a in fresh])
        self.assertEqual(s._check_achievements(), [])


class TestShop(unittest.TestCase):
    def test_buy_theme_needs_gold(self):
        s = RpgState()
        ok, _ = s.buy_theme("Mitternacht")
        self.assertFalse(ok)
        self.assertEqual(s.theme, "Standard")

    def test_buy_theme_works(self):
        s = RpgState()
        s.gold = 60
        ok, _ = s.buy_theme("Mitternacht")
        self.assertTrue(ok)
        self.assertEqual(s.theme, "Mitternacht")
        self.assertEqual(s.gold, 10)

    def test_unknown_theme(self):
        s = RpgState()
        ok, _ = s.buy_theme("Regenbogen")
        self.assertFalse(ok)


class TestPersistence(unittest.TestCase):
    def test_roundtrip(self):
        s = RpgState()
        s.complete_task("Hoch", today="2026-11-24")
        s.buy_theme("Standard")
        with tempfile.TemporaryDirectory() as tmp:
            p = os.path.join(tmp, "rpg.json")
            s.save(p)
            back = RpgState.load(p)
        self.assertEqual(back.to_dict(), s.to_dict())

    def test_load_missing_file(self):
        with tempfile.TemporaryDirectory() as tmp:
            s = RpgState.load(os.path.join(tmp, "gibt-es-nicht.json"))
        self.assertEqual(s.level, 1)
        self.assertEqual(s.gold, 0)

    def test_load_corrupt_file(self):
        with tempfile.TemporaryDirectory() as tmp:
            p = os.path.join(tmp, "kaputt.json")
            with open(p, "w", encoding="utf-8") as f:
                f.write("{kein json")
            s = RpgState.load(p)
        self.assertEqual(s.level, 1)


class TestBoss(unittest.TestCase):
    def test_boss_takes_damage_and_respawns_stronger(self):
        s = RpgState()
        s.boss = {"name": "Test", "hp": 40, "max_hp": 40, "level": 1}
        r = s.complete_task("Niedrig", today="2026-11-24")  # 10 + 5 = 15
        self.assertEqual(r["boss_damage"], 15)
        self.assertIsNone(r["boss_down"])
        self.assertEqual(s.boss["hp"], 25)
        r = s.complete_task("Hoch", today="2026-11-24")  # 55 -> Besiegt
        self.assertEqual(r["boss_down"], "Test")
        self.assertEqual(s.bosses_defeated, 1)
        self.assertEqual(s.boss["max_hp"], 500)  # 300 + 200*1
        self.assertIn("boss_slayer", s.achievements)

    def test_season_goal_bonus_once(self):
        s = RpgState()
        s.boss = {"name": "T", "hp": 10 ** 9, "max_hp": 10 ** 9, "level": 1}
        for i in range(10):
            s.complete_task("Hoch", today="2026-11-%02d" % (i + 1))
        self.assertGreaterEqual(s.season["xp"], 500)
        gold_after_first_claim = s.gold
        s.complete_task("Niedrig", today="2026-11-11")
        # kein doppelter 500er-Bonus: nur Aufgaben-Gold + evtl. Level
        self.assertLess(s.gold - gold_after_first_claim, 50 + 100)


class TestConsumables(unittest.TestCase):
    def test_double_xp_consumes_one_use(self):
        s = RpgState()
        s.gold = 200
        ok, _ = s.buy_item("Doppel-XP")
        self.assertTrue(ok)
        r = s.complete_task("Normal", today="2026-11-24")  # (25+5)*2 = 60
        self.assertTrue(r["doubled"])
        self.assertEqual(r["xp"], 60)
        r2 = s.complete_task("Normal", today="2026-11-24")
        self.assertFalse(r2["doubled"])
        self.assertEqual(r2["xp"], 30)

    def test_shield_saves_streak_once(self):
        s = RpgState()
        s.complete_task("Normal", today="2026-11-20")
        s.gold = 200
        self.assertTrue(s.buy_item("Streak-Schild")[0])
        r = s.complete_task("Normal", today="2026-11-24")  # Luecke
        self.assertTrue(r["shield_used"])
        self.assertEqual(r["streak"], 2)
        r2 = s.complete_task("Normal", today="2026-11-28")  # wieder Luecke, kein Schild
        self.assertFalse(r2["shield_used"])
        self.assertEqual(r2["streak"], 1)

    def test_shop_needs_gold_and_knows_items(self):
        s = RpgState()
        ok, _ = s.buy_item("Doppel-XP")
        self.assertFalse(ok)
        ok, _ = s.buy_item("Gibt es nicht")
        self.assertFalse(ok)


class TestSeason(unittest.TestCase):
    def test_rollover_keeps_best_and_resets(self):
        s = RpgState()
        s.boss = {"name": "T", "hp": 10 ** 9, "max_hp": 10 ** 9, "level": 1}
        s.complete_task("Hoch", today="2026-11-24")
        nov_xp = s.season["xp"]
        self.assertEqual(s.season["id"], "2026-11")
        s.complete_task("Normal", today="2026-12-01")
        self.assertEqual(s.season["id"], "2026-12")
        self.assertEqual(s.season["xp"], 30)  # nur Dezember-Anteil
        self.assertEqual(s.season_best, nov_xp)  # November-Bestwert bleibt
        self.assertEqual(s.season["claimed"], [])


class TestMigration(unittest.TestCase):
    def test_old_save_without_new_fields(self):
        old = {"level": 2, "xp": 10, "gold": 5, "streak": 1, "best_streak": 1,
               "last_done": "2026-11-23", "total_done": 3, "total_gold_earned": 50,
               "achievements": ["first_done"], "theme": "Standard"}
        s = RpgState.from_dict(old)
        self.assertEqual(s.level, 2)
        self.assertEqual(s.inventory, {"shield": 0, "double": 0})
        self.assertEqual(s.bosses_defeated, 0)
        self.assertEqual(s.boss["max_hp"], 300)
        # und danach ganz normal spielbar
        r = s.complete_task("Normal", today="2026-11-24")
        self.assertIn("boss_damage", r)
        self.assertIn("season_xp", r)


if __name__ == "__main__":
    unittest.main()
