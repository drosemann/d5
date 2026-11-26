"""Teleportation / fast travel for the open-world minigame.

Coordinates follow ``open_world.OpenWorld.world``: 3 columns (x 0-2)
by 10 rows (y 0-9). Waypoints name the interesting biomes so the
player can jump between discovered locations instead of walking.
"""

from __future__ import annotations


# (name, x, y) — matches the biome grid in open_world/OpenWorld.py.
WAYPOINTS: tuple[tuple[str, int, int], ...] = (
    ("spawnwald", 0, 0),
    ("dorf", 2, 0),
    ("see", 0, 1),
    ("berge", 1, 1),
    ("hoehle", 0, 2),
    ("wiese", 2, 2),
    ("oase", 2, 3),
    ("wueste", 0, 3),
    ("schnee", 0, 4),
    ("norddorf", 2, 5),
)

WIDTH = 3
HEIGHT = 10


class FastTravelError(ValueError):
    pass


class FastTravelSystem:
    """Tracks discovered waypoints and teleports the player between them."""

    def __init__(self, waypoints: tuple[tuple[str, int, int], ...] = WAYPOINTS) -> None:
        self.waypoints: dict[str, tuple[int, int]] = {n: (x, y) for n, x, y in waypoints}
        self.unlocked: set[str] = set()
        if "spawnwald" in self.waypoints:
            self.unlocked.add("spawnwald")

    def discover(self, position: tuple[int, int] | list[int]) -> str | None:
        """Unlock the waypoint at ``position``. Returns its name or None."""
        pos = (int(position[0]), int(position[1]))
        for name, coords in self.waypoints.items():
            if coords == pos and name not in self.unlocked:
                self.unlocked.add(name)
                return name
        return None

    def list_unlocked(self) -> list[str]:
        return sorted(self.unlocked)

    def can_travel(self, destination: str) -> bool:
        return destination in self.unlocked

    def travel(self, current: tuple[int, int] | list[int], destination: str) -> tuple[int, int]:
        """Return the waypoint coordinates for ``destination``.

        Raises FastTravelError for unknown or undiscovered destinations.
        Travelling to the current location is a no-op returning ``current``.
        """
        if destination not in self.waypoints:
            raise FastTravelError(f"unknown destination: {destination}")
        if destination not in self.unlocked:
            raise FastTravelError(f"undiscovered destination: {destination}")
        target = self.waypoints[destination]
        if (int(current[0]), int(current[1])) == target:
            return (int(current[0]), int(current[1]))
        return target

    def unlock_all(self) -> None:
        self.unlocked.update(self.waypoints)
