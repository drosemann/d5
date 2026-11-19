import pygame

# Initialisierung von Pygame
pygame.init()

# Definiere die Spielwelt mit verschiedenen Biomen
world = [
    ["Wald", "Wald", "Dorf"],
    ["See", "Berge", "Wald"],
    ["Höhle", "Wald", "Wiese"],
    ["Wüste", "Wüste", "Oase"],
    ["Schnee", "Schnee", "Berge"],
    ["Wald", "Wald", "Dorf"],
    ["See", "Berge", "Wald"],
    ["Höhle", "Wald", "Wiese"],
    ["Wüste", "Wüste", "Oase"],
    ["Schnee", "Schnee", "Berge"]
]

# Fenstergröße
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

# Farben
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GREEN = (0, 255, 0)
BLUE = (0, 0, 255)
BROWN = (139, 69, 19)
YELLOW = (255, 255, 0)

# Größe einer Zelle in der Spielwelt
CELL_SIZE = 100

# Erstelle das Spiel-Fenster
window = pygame.display.set_mode((WINDOW_WIDTH, WINDOW_HEIGHT))
pygame.display.set_caption("Open World Spiel")

# Lade die Grafiken
player_image = pygame.image.load("player.png")  # need to add player.png
player_image = pygame.transform.scale(player_image, (CELL_SIZE, CELL_SIZE))

# Startposition des Spielers
player_position = [0, 0]

# Funktion zur Darstellung der Spielwelt
def draw_world():
    for y, row in enumerate(world):
        for x, cell in enumerate(row):
            if cell == "Wald":
                color = GREEN
            elif cell == "Dorf":
                color = BROWN
            elif cell == "See":
                color = BLUE
            elif cell == "Berge":
                color = WHITE
            elif cell == "Höhle":
                color = (100, 100, 100)  # Grau für Höhlen
            elif cell == "Wiese":
                color = (144, 238, 144)  # Hellgrün für Wiesen
            elif cell == "Wüste":
                color = YELLOW
            elif cell == "Oase":
                color = (0, 255, 127)  # Türkis für Oasen
            elif cell == "Schnee":
                color = (255, 250, 250)  # Weiß für Schnee

            pygame.draw.rect(window, color, (x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE))

# Spiel-Loop
running = True
while running:
    # Überprüfe auf Ereignisse
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Aktuelle Position des Spielers
    x, y = player_position
    current_location = world[y][x]

    # Ausgabe der Spielumgebung
    window.fill(BLACK)
    draw_world()  # Zeichne die Welt
    window.blit(player_image, (x * CELL_SIZE, y * CELL_SIZE))

    # Aktualisiere das Fenster
    pygame.display.flip()

pygame.quit()