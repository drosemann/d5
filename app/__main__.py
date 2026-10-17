import argparse
import logging

from app.storage import initialize


def main():
    parser = argparse.ArgumentParser(description="Aktienwerk Aktiennachrichten")
    parser.add_argument("command", choices=("serve", "worker", "init"), nargs="?", default="serve")
    parser.add_argument("--once", action="store_true", help="Worker einmalig ausführen.")
    args = parser.parse_args()
    logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(name)s: %(message)s")
    initialize()
    if args.command == "serve":
        from app.web import serve
        serve()
    elif args.command == "worker":
        from app.worker import main as worker_main
        worker_main(args.once)
    else:
        print("Aktienwerk-Datenbank initialisiert.")


if __name__ == "__main__":
    main()

