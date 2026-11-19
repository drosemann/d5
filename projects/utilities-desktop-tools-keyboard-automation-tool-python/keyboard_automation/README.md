# Keyboard Automation Tool

A versatile Python-based keyboard automation tool that provides various keyboard control features for automation tasks.

## Features

- **Key Alternation**: Alternate between two keys with customizable intervals
- **Sequence Typing**: Type specific sequences repeatedly
- **Key Holding**: Hold down keys for specified durations
- **Key Combinations**: Execute custom key combinations
- **Record & Playback**: Record keyboard inputs and play them back
- **Delayed Typing**: Type text with customizable delays between characters
- **Randomized Intervals**: Option for randomized timing between key presses

## Installation

1. Clone this repository:

git clone https://github.com/yourusername/keyboard-automation.git
cd keyboard-automation


2. Install required dependencies:

pip install -r requirements.txt


## Usage

Run the main script:

python main.py

Choose from the following options:
1. A-D alternating
2. QE sequence
3. Hold a key
4. Perform key combo
5. Record and playback
6. Type with delay
7. Exit

### Example Usage


from key_presser import KeyPresser

# Create a KeyPresser instance
presser = KeyPresser(interval=0.5)

# Hold the 'w' key for 3 seconds
presser.hold_key('w', 3)

# Type text with delay
presser.type_with_delay("Hello, World!", 0.1)


## Requirements

- Python 3.6+
- keyboard
- pyautogui

## Project Structure


keyboard_automation/
├── key_presser.py     # Main class implementation
├── main.py            # Command-line interface
├── requirements.txt   # Project dependencies
├── README.md         # This file
└── LICENSE           # MIT License


## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSEfile for details.

## Safety Note

⚠️ Use this tool responsibly. Be careful when using keyboard automation in games or applications where it might violate terms of service.
<!-- ZIMBU-PORT -->
## Zimbu-Port

Dieses Projekt ist mechanisch nach [Zimbu](https://moolenaar.net/z/zimbu/spec/zimbu.html)
(Bram Moolenaar) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.zimbu-Schwester
mit Zimbu-Modulgeruest (MODULE/FUNC Main) und dem VOLLSTAENDIGEN Original-Code
als #-Inline-Doku. Kein Original-Code wurde geloescht oder veraendert.
Die .zimbu-Dateien sind mechanische Spiegel (80/20: Geruest steht, Logik-Port
per Hand verfeinern). Stand: 2026-11-12.

<!-- GOOSE-PORT -->
## Goose-Port

Dieses Projekt ist mechanisch nach [Goose](https://github.com/aardappel/goose)
(aardappel/goose v2026.4) gespiegelt: Jede Code-Datei hat eine <name>.<ext>.goose-Schwester
mit gueltigem Goose-Programmgeruest (n main()/print, pruefbar mit goose check)
und dem VOLLSTAENDIGEN Original-Code als //-Inline-Doku. Kein Original-Code wurde
geloescht oder veraendert. Die .goose-Dateien sind mechanische Spiegel (Geruest steht
und kompiliert, Logik-Port per Hand verfeinern). Stand: 2026-11-16.
