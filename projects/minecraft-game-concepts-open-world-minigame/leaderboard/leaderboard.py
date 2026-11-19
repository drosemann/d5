"""Leaderboard and chat helpers for the open-world minigame.

Player-connection / position handling is assumed to be managed
elsewhere (e.g. by the server). This module therefore only exposes
pure, testable logic that receives connection state as arguments.
"""
from __future__ import annotations

from typing import Dict, Iterable, List


def is_at_spawn(connected: bool, position: Iterable[int] | None) -> bool:
    """Return True when the player is connected and at [0, 0]."""
    return bool(connected) and list(position or []) == [0, 0]


class PlayerCount:
    """Knows how many players are currently in the lobby."""

    def __init__(self, players: Iterable[str] | None = None):
        self.players: List[str] = list(players or [])

    def add(self, name: str) -> None:
        if name not in self.players:
            self.players.append(name)

    def remove(self, name: str) -> None:
        if name in self.players:
            self.players.remove(name)

    def check_players(self) -> bool:
        """True while fewer than 2 players are present."""
        return len(self.players) < 2


class Leaderboard:
    """Simple score table."""

    def __init__(self) -> None:
        self.scores: Dict[str, int] = {}

    def update_score(self, player: str, score: int) -> None:
        self.scores[player] = score

    def best(self) -> tuple[str, int] | None:
        if not self.scores:
            return None
        return max(self.scores.items(), key=lambda kv: kv[1])

    def sorted_scores(self) -> List[tuple[str, int]]:
        return sorted(self.scores.items(), key=lambda kv: kv[1], reverse=True)


class Chat:
    """Minimal in-memory chat log."""

    def __init__(self) -> None:
        self.messages: List[str] = []

    def send_message(self, message: str) -> None:
        self.messages.append(message)

    def winner_message(self, winner: str) -> str:
        msg = f"You are the Winner, {winner}!"
        self.send_message(msg)
        return msg


# ---------------------------------------------------------------------------
# Demo / convenience entry point – replaces the old placeholder block
#   player_connected = True
#   player_position = [0, 0]
# ---------------------------------------------------------------------------
def create_for_spawn(connected: bool, position: Iterable[int] | None, players: Iterable[str]):
    """Create a ready-to-use (PlayerCount, Leaderboard, Chat) triple when
    the player is connected at spawn and the lobby is not full.
    Returns None otherwise.
    """
    if not is_at_spawn(connected, position):
        return None
    pc = PlayerCount(players)
    if not pc.check_players():
        return None
    return pc, Leaderboard(), Chat()
