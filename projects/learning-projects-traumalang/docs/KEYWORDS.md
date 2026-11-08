# TraumaLang v2.2 — Keyword-Tabelle

| Keyword | Kategorie | Semantik (C) |
|---|---|---|
| IT'S SHOWTIME | Programm | Beginn `main`, Banner + 8s |
| YOU HAVE BEEN TERMINATED | Block | schliesst Programm/if/while |
| WE NEED TO TAKE THIS OFFLINE | Funktion | `static void name(void) {` |
| THIS COULD HAVE BEEN AN EMAIL | Funktion | `}` |
| THERE IS NO LEVEL I OR II | Var | statischer Marker |
| WE HAVE 240 EMPLOYEES AND 340 ACTIVE ACCOUNTS | Var | `TlVal v; tl_val_init(&v);` |
| WE RESERVED INSTANCES FOR A PROJECT THAT GOT CANCELLED | Var | `tl_leak_once()` (4 KiB, begrenzt) |
| I NEED YOUR CLOTHES YOUR BOOTS AND YOUR MOTORCYCLE | Var | `tl_val_set_*` / copy |
| YOU ARE NOT YOU YOU ARE ME | Var | `tl_val_copy(&a,&b)` |
| WE NEED TO SCALE | Var | `v.num++` |
| WE NEED TO DOWNSIZE | Var | `v.num--` |
| TEMP_Access_Do_Not_Use | Var | reservierter Name |
| JOB SECURITY IS MORE IMPORTANT THAN REDUNDANCY | Marker | Kommentar |
| I LIKE TO SET VERY VAGUE GOALS | Null | `tl_val_set_null` |
| FOCUS IS IMPORTANT PRODUCT WHAT PRODUCT | Null | `NULL` |
| I NEED OWNERS NOT RENTERS | Ref | Kommentar `&v` |
| ROTATE THE SECRET | Var | Selbstzuweisung |
| DO IT FOR THE METRICS | if | `if (cond)` |
| BLUE IS BROKEN GREEN IS WORSE | else | `else` |
| STICK AROUND UNTIL THE SPRINT ENDS | while | `while (cond)` |
| LET'S CIRCLE BACK LATER | Fluss | `continue` |
| CONSIDER THAT A DIVORCE | Fluss | `break` |
| IT'S PROBABLY DNS / IT IS PROBABLY DNS | Fehler | Kommentar |
| IT WORKS ON MY MACHINE | Try | Kommentar |
| TEMPORARILY DISABLE OPA | Marker | Kommentar (deaktiviert nichts) |
| EVERY TERRAFORM APPLY IS CHAOS ENGINEERING | Chaos | `tl_chaos()` |
| I DID IT 5% OF SYSTEMS IS IAC | Prob | `tl_prob(5)` |
| OUR SBOM FILE IS 80MB | Obfusk | Kommentar |
| HAVE YOU TRIED TURNING IT OFF AND ON AGAIN | Reset | echter Reset per `tl_val_set_null` (alle Scope-Vars) |
| DO SPRINT PLANNING ... FROM ... TO | Loop | gezaehlte `for`-Schleife (inklusive) |
| GIVE IT BACK | Funktion | `return` als `TlVal` |
| WITH / AND | Funktion | Parameterliste (`WITH a AND b`, max. 8) |
| TALK TO THE HAND | IO | `tl_val_print` / `tl_print_str` |
| SEND IT TO SLACK | IO | `[SLACK]`-Praefix |
| PUT IT IN JIRA | IO | `/* TODO(JIRA) */` |
| PUT IT IN CONFLUENCE | IO | /dev/null-Kommentar |
| KNOWLEDGE GOES IN DOESNT COME OUT | IO | /dev/null-Kommentar |
| SEND IT TO DATADOG | IO | Ausgabe + 64 KiB begrenzt |
| SEND IT TO THE CLOUD | IO | Ausgabe + 2s (`$0.30`) |
| SEND IT TO GRAFANA | IO | Ausgabe nur bei 50% |
| ESCALATE IT TO MANAGEMENT | IO | Ausgabe + 8s |
| FORWARD IT TO THE TEAM THAT LEFT IN 2013 | IO | Ausgabe + Legacy-Kommentar |
| SEND IT TO THE CHANGE ADVISORY BOARD | IO | Ausgabe nur wenn `tl_cab_open()` |
| ASK FOR A JUSTIFICATION DOCUMENT | CAB | `for(;;)` endlos |
| WRAP IT AS VACATION VOUCHER | IO | `[VACATION]`-Praefix |
| WE NEED TO SYNC | IO | `tl_sync_wait()` (8s) |
| I WAS DOUBLE-BOOKED ON 2 OFFSITES (+ STILL ATTENDED BOTH) | MT | `f(); f();` |
| THINGS THAT GET MEASURED GET IMPROVED | Metrics | `tl_metrics_inc()` |
| WE STARTED MEASURING THE THINGS THAT GOT IMPROVED | Metrics | `for(;;)` endlos |
| THE CHANGE ADVISORY BOARD IS ON TUESDAYS MOST TUESDAYS | CAB | `tl_chaos()` |
| IT'S A TEMPORARY SCRIPT SINCE 2018 | Loop | `for(;;)` endlos |
| WE HAVE LOTS OF GOVERNANCE | Wrap | Marker |
| STORE IT IN ACTIVE DIRECTORY | Sec | Ausgabe + BitLocker-Meldung |
| SECURE IT WITH YOUR PHONE | Sec | Ausgabe + Kommentar |
| PUT IT ON AN AMIGA DISK | Sec | Ausgabe + Kommentar |
| HIDE IT IN THE TERMS OF SERVICE | Sec | Ausgabe + Kommentar |
| TAG IT AS RESEARCH | Misc | Ausgabe + Kommentar |
| DEPLOY IT TO PROD ON FRIDAY AT 459PM | Misc | Ausgabe + `return 1` |
| ADD IT TO THE SBOM | Misc | Ausgabe + Kommentar |
| IT IS OPENED BY 33% OF STAFF | Prob | `tl_prob(33)` |
| I SEND A PHISHING TEST IT IS OPENED BY 85% | Prob | `tl_prob(85)` |
| THIS IS BLOCKED BY ANOTHER TEAM | Roast | Kommentar (nur Rewrite) |
