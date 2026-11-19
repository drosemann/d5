// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/cli/ipilot/core/__init__.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/cli/ipilot/core/__init__.py");
}

// ---- Original-Code (projects/github-repos-infra-pilot/cli/ipilot/core/__init__.py), unveraendert, als Inline-Doku ----
// """Core CLI utilities."""
//
// from typing import Any
//
// from .command_registry import attach_to_app, discover_commands, get_registry, register
// from .exceptions import (
//     APIError,
//     AuthenticationError,
//     CLIError,
//     CommandNotFoundError,
//     ConfigError,
//     ConnectionError,
//     ValidationError,
// )
//
//
// def __getattr__(name: str) -> Any:
//     if name in {"create_app", "get_client"}:
//         from . import cli
//
//         return getattr(cli, name)
//     raise AttributeError(f"module {__name__!r} has no attribute {name!r}")
//
//
// __all__ = [
//     "create_app",
//     "get_client",
//     "register",
//     "discover_commands",
//     "attach_to_app",
//     "get_registry",
//     "CLIError",
//     "APIError",
//     "ConfigError",
//     "CommandNotFoundError",
//     "AuthenticationError",
//     "ConnectionError",
//     "ValidationError",
// ]
//
