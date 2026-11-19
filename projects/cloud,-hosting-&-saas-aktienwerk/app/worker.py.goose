// Goose-Port-Spiegel von: projects/cloud,-hosting-&-saas-aktienwerk/app/worker.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/cloud,-hosting-&-saas-aktienwerk/app/worker.py");
}

// ---- Original-Code (projects/cloud,-hosting-&-saas-aktienwerk/app/worker.py), unveraendert, als Inline-Doku ----
// import logging
// import time
//
// from app.config import POLL_INTERVAL
// from app.ingest import refresh_all
// from app.storage import initialize
//
//
// def main(once=False):
//     logging.basicConfig(
//         level=logging.INFO,
//         format="%(asctime)s %(levelname)s %(name)s: %(message)s",
//     )
//     initialize()
//     while True:
//         started = time.monotonic()
//         refresh_all()
//         if once:
//             return
//         time.sleep(max(1, POLL_INTERVAL - int(time.monotonic() - started)))
//
//
// if __name__ == "__main__":
//     import argparse
//     parser = argparse.ArgumentParser(description="Importiere Aktienkurse und SEC-Meldungen.")
//     parser.add_argument("--once", action="store_true", help="Einmal importieren und beenden.")
//     main(parser.parse_args().once)
//
//
