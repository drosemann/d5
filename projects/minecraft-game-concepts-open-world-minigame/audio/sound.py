"""Background music and sound effects for the open-world minigame.

Works without audio hardware or asset files: when ``pygame.mixer``
is unavailable (headless CI, missing device) every play call is a
recorded no-op so game code and tests keep running.
"""

from __future__ import annotations


DEFAULT_MUSIC = ("overworld", "cave", "desert", "snow")
DEFAULT_SFX = ("step", "door", "chest", "hit", "craft", "teleport", "event")


class SoundSystem:
    """Registry + player for music tracks and sound effects."""

    def __init__(self) -> None:
        self.tracks: dict[str, str | None] = {}
        self.sounds: dict[str, str | None] = {}
        self.current_music: str | None = None
        self.volume: float = 0.5
        self.last_sfx: str | None = None
        self.mixer_available = False
        try:
            import pygame.mixer  # type: ignore

            try:
                pygame.mixer.init()
            except Exception:
                pass
            else:
                self.mixer_available = True
        except Exception:
            self.mixer_available = False
        for name in DEFAULT_MUSIC:
            self.tracks[name] = None
        for name in DEFAULT_SFX:
            self.sounds[name] = None

    def register_music(self, name: str, path: str | None = None) -> None:
        self.tracks[name] = path

    def register_sfx(self, name: str, path: str | None = None) -> None:
        self.sounds[name] = path

    def play_music(self, name: str) -> bool:
        """Start ``name`` as background loop. Returns False when unknown."""
        if name not in self.tracks:
            return False
        self.current_music = name
        if not self.mixer_available:
            return True
        try:
            import pygame.mixer  # type: ignore

            path = self.tracks[name]
            if path:
                pygame.mixer.music.load(path)
                pygame.mixer.music.set_volume(self.volume)
                pygame.mixer.music.play(-1)
        except Exception:
            pass
        return True

    def stop_music(self) -> None:
        self.current_music = None
        if not self.mixer_available:
            return
        try:
            import pygame.mixer  # type: ignore

            pygame.mixer.music.stop()
        except Exception:
            pass

    def play_sfx(self, name: str) -> bool:
        """Play a one-shot effect. Returns False when unknown."""
        if name not in self.sounds:
            return False
        self.last_sfx = name
        if not self.mixer_available:
            return True
        try:
            import pygame.mixer  # type: ignore

            path = self.sounds[name]
            if path:
                sound = pygame.mixer.Sound(path)
                sound.set_volume(self.volume)
                sound.play()
        except Exception:
            pass
        return True

    def set_volume(self, value: float) -> float:
        self.volume = max(0.0, min(1.0, float(value)))
        return self.volume

    def get_state(self) -> dict:
        return {
            "music": self.current_music,
            "volume": self.volume,
            "mixer": self.mixer_available,
            "last_sfx": self.last_sfx,
        }
