def greet(name=None):
    """Return a friendly greeting for *name*.

    Args:
        name: Optional display name.  Falls back to ``\"world\"`` when
            ``name`` is ``None``, empty or only whitespace.

    Returns:
        The greeting string, e.g. ``\"Hello, World!\"``.
    """
    display = (name or "").strip() or "world"
    # Nicely capitalise without destroying all-caps names like \"BFFA\"
    if display == display.lower():
        display = display.capitalize()
    greeting = f"Hello, {display}!"
    print(greeting)
    return greeting


if __name__ == "__main__":
    greet()
    greet("Daniel")
