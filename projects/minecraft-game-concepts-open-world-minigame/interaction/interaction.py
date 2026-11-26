"""Environmental interactions: doors, obstacles and event triggers.

Objects live on world coordinates ``(x, y)`` matching
``open_world.OpenWorld.world``. ``InteractionSystem.interact`` takes
an optional inventory (duck-typed: ``has_item`` / ``remove_item`` /
``add_item``) so doors can require keys, obstacles can require
tools, and events can hand out rewards.
"""

from __future__ import annotations

from typing import Any


class Interactable:
    def __init__(self, name: str, position: tuple[int, int] | list[int], blocks_movement: bool = False) -> None:
        self.name = name
        self.position = (int(position[0]), int(position[1]))
        self.blocks_movement = blocks_movement
        self.used = False

    def describe(self) -> str:
        return f"{self.name} at {self.position}"

    def interact(self, inventory: Any = None) -> dict:
        self.used = True
        return {"ok": True, "message": f"{self.name}: nothing happens."}


class Door(Interactable):
    def __init__(self, name: str, position: tuple[int, int] | list[int], key_item: str | None = None) -> None:
        super().__init__(name, position, blocks_movement=True)
        self.key_item = key_item
        self.opened = False

    def interact(self, inventory: Any = None) -> dict:
        if self.opened:
            return {"ok": True, "message": f"{self.name} is already open."}
        if self.key_item:
            if inventory is None or not hasattr(inventory, "has_item"):
                return {"ok": False, "message": f"{self.name} needs '{self.key_item}'."}
            if not inventory.has_item(self.key_item):
                return {"ok": False, "message": f"{self.name} is locked, needs '{self.key_item}'."}
            try:
                inventory.remove_item(self.key_item)
            except Exception:
                pass
        self.opened = True
        self.blocks_movement = False
        self.used = True
        return {"ok": True, "message": f"{self.name} opened."}


class Obstacle(Interactable):
    def __init__(self, name: str, position: tuple[int, int] | list[int], tool_item: str | None = None) -> None:
        super().__init__(name, position, blocks_movement=True)
        self.tool_item = tool_item
        self.cleared = False

    def interact(self, inventory: Any = None) -> dict:
        if self.cleared:
            return {"ok": True, "message": f"{self.name} is already cleared."}
        if self.tool_item:
            if inventory is None or not hasattr(inventory, "has_item"):
                return {"ok": False, "message": f"{self.name} needs '{self.tool_item}'."}
            if not inventory.has_item(self.tool_item):
                return {"ok": False, "message": f"{self.name} needs '{self.tool_item}'."}
        self.cleared = True
        self.blocks_movement = False
        self.used = True
        return {"ok": True, "message": f"{self.name} moved aside."}


class EventTrigger(Interactable):
    def __init__(
        self,
        name: str,
        position: tuple[int, int] | list[int],
        event_id: str,
        reward_item: str | None = None,
    ) -> None:
        super().__init__(name, position, blocks_movement=False)
        self.event_id = event_id
        self.reward_item = reward_item
        self.triggered = False

    def interact(self, inventory: Any = None) -> dict:
        if self.triggered:
            return {"ok": True, "message": f"{self.name} already triggered."}
        self.triggered = True
        self.used = True
        if self.reward_item and inventory is not None and hasattr(inventory, "add_item"):
            try:
                inventory.add_item(self.reward_item)
            except Exception:
                pass
        suffix = f" Found '{self.reward_item}'." if self.reward_item else ""
        return {"ok": True, "message": f"Event '{self.event_id}' triggered.{suffix}"}


class InteractionSystem:
    """Owns every interactable in the world."""

    def __init__(self) -> None:
        self.objects: list[Interactable] = []

    def add(self, obj: Interactable) -> None:
        self.objects.append(obj)

    def objects_at(self, position: tuple[int, int] | list[int]) -> list[Interactable]:
        pos = (int(position[0]), int(position[1]))
        return [o for o in self.objects if o.position == pos]

    def blocks(self, position: tuple[int, int] | list[int]) -> bool:
        return any(o.blocks_movement for o in self.objects_at(position))

    def interact(self, name: str, inventory: Any = None) -> dict:
        for obj in self.objects:
            if obj.name == name:
                return obj.interact(inventory)
        return {"ok": False, "message": f"unknown object: {name}"}

    def default_world(self) -> "InteractionSystem":
        """Seed doors / obstacles / events matching the biome grid."""
        self.add(Door("dorftor", (2, 0), key_item="Dorfschluessel"))
        self.add(Obstacle("geroell", (0, 2), tool_item="Spitzhacke"))
        self.add(Obstacle("sandblock", (0, 3), tool_item="Schaufel"))
        self.add(EventTrigger("hoehlenaltar", (0, 2), "hoehlenlicht", reward_item="Fackel"))
        self.add(EventTrigger("oasenschrein", (2, 3), "oasensegen", reward_item="Wasserflasche"))
        return self
