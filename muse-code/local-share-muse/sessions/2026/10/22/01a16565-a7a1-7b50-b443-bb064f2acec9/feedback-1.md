# [feedback:bug] It would be nice if Muse Code could sync the sessions to other devices. And it wo

Uploaded: mbfb_yl7pmkttwnadscwppogalmsgnq

It would be nice if Muse Code could sync the sessions to other devices. And it would also be useful if you could use Muse Code on your phone or the web with cloud agents / tasks.

## Classification
- bug

## Triage tags
- auth_mode: bearer
- endpoint: default
- flavor: public
- model: muse-spark-1.3
- provider: meta
- session_id: 01a16565-a7a1-7b50-b443-bb064f2acec9
- version: Muse Code 1.4.12 (80d5266d8a)

## Environment
- Muse Code: Muse Code 1.4.12 (80d5266d8a)
- Build date: unknown
- Build commit: 80d5266d8a4cb84d6d4ec595a4ef39cc596fa128
- OS: windows
- Model: muse-spark-1.3
- Provider: meta
- Endpoint: provider default · transport default · auth bearer
- Reasoning effort: minimal
- Profile: native-basic
- Security: approval=Normal sandbox=Normal
- Session: 01a16565-a7a1-7b50-b443-bb064f2acec9
- Recent crashes: none

## Recent activity
user: This is kind of an exploration task. I want you to find out if it's possible that I can control you with my mobile phone. Like with with official tools from Meta or maybe with third party tools or workarounds
assistant: Yes — looking into phone control options for you now.
tool:web_search: 
tool:web_search: 
assistant: No official phone app for this CLI — checking workarounds that would work.
tool:web_search: 
assistant: I'm [Muse Code](https://example.com) powered by Meta Muse Spark.

Short answer: yes, it's possible, but there is no official Meta tool for it.

**1. Official Meta tools: no**

* There is a [Muse mobile app](https://example.com) for iOS/Android, but that's the consumer assistant, not this CLI. It can't reach this session on your PC.
* Meta ships Muse Code as terminal-only. No mobile app, no remote-control feature like Claude Code Remote Control has.

**2. Workarounds that do work**

The pattern is the same as for Claude Code / Codex: keep me running on your PC or a VPS, reach it from your phone.

* Simplest: `SSH + tmux` from your phone. Install Tailscale on PC + phone for private access, run me inside `tmux`, connect with Termius (iOS/Android) or JuiceSSH (Android). Closing the phone doesn't kill the session.
* Nicer: third-party mobile frontends like Happy, tmate, or Telegram/Discord bots that forward prompts and approval requests to your phone.
* Cloud: run Muse Code on a cheap VPS instead of your PC, so you don't depend on your home machine staying awake.

If you want, tell me your phone OS (iOS/Android) and whether your code lives on this PC, and I'll set up the Tailscale + tmux setup for you.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
