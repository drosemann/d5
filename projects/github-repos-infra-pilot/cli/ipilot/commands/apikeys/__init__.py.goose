// Goose-Port-Spiegel von: projects/github-repos-infra-pilot/cli/ipilot/commands/apikeys/__init__.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/github-repos-infra-pilot/cli/ipilot/commands/apikeys/__init__.py");
}

// ---- Original-Code (projects/github-repos-infra-pilot/cli/ipilot/commands/apikeys/__init__.py), unveraendert, als Inline-Doku ----
// """API Key management - Create, list, revoke API keys for programmatic access."""
//
// import builtins
// from typing import Optional
//
// import typer
//
// from ...client import ApiClient
// from ...config import DEFAULT_API_URL, load_config
// from ...output.formatters import print_output
//
// app = typer.Typer(help="API key management")
//
//
// def _get_client(ctx: typer.Context) -> ApiClient:
//     config = load_config(profile=ctx.obj.get("profile"))
//     return ApiClient(config.get("api_url", DEFAULT_API_URL), config.get("token"))
//
//
// @app.command()
// def list(
//     ctx: typer.Context,
// ):
//     """List all API keys."""
//     client = _get_client(ctx)
//     result = client.list_api_keys()
//     data = (
//         result if isinstance(result, builtins.list) else result.get("api_keys", result)
//     )
//     print_output(data, ctx.obj.get("output", "table"))
//
//
// @app.command()
// def create(
//     ctx: typer.Context,
//     name: str = typer.Argument(..., help="Key name"),
//     role: str = typer.Option(
//         "user", "--role", "-r", help="Role (admin, user, readonly)"
//     ),
//     expire_days: Optional[int] = typer.Option(
//         None, "--expire", "-e", help="Expiration in days"
//     ),
// ):
//     """Create a new API key."""
//     client = _get_client(ctx)
//     result = client.create_api_key(name=name, role=role, expire_days=expire_days)
//     if isinstance(result, dict) and "key" in result:
//         typer.echo("=" * 60)
//         typer.echo("API Key created! Save this key - it will not be shown again.")
//         typer.echo(f"Key: {result['key']}")
//         typer.echo("=" * 60)
//     print_output(result, ctx.obj.get("output", "table"))
//
//
// @app.command()
// def revoke(
//     ctx: typer.Context,
//     key_id: str = typer.Argument(..., help="Key ID to revoke"),
// ):
//     """Revoke an API key."""
//     client = _get_client(ctx)
//     result = client.revoke_api_key(key_id)
//     print_output(result, ctx.obj.get("output", "table"))
//
