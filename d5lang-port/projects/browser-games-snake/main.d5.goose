// Goose-Port-Spiegel von: d5lang-port/projects/browser-games-snake/main.d5
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: d5lang-port/projects/browser-games-snake/main.d5");
}

// ---- Original-Code (d5lang-port/projects/browser-games-snake/main.d5), unveraendert, als Inline-Doku ----
// SHINE, LITTLE BOY, SHINE
//   WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA Portiert 1:1 von projects/browser-games-snake/main.py. Erster englischer Draft (defekt: BLOCK_SIZE undefiniert, main() vor def) plus funktionierende deutsche Version.
//     PACK-ES-IN-JIRA ORIGINAL: import pygame
//     PACK-ES-IN-JIRA ORIGINAL: import random
//     PACK-ES-IN-JIRA ORIGINAL: import pygame
//     PACK-ES-IN-JIRA ORIGINAL: import random
//     PACK-ES-IN-JIRA ORIGINAL: BLACK = (0, 0, 0)
//     PACK-ES-IN-JIRA ORIGINAL: WHITE = (255, 255, 255)
//     PACK-ES-IN-JIRA ORIGINAL: GREEN = (0, 255, 0)
//     PACK-ES-IN-JIRA ORIGINAL: RED = (255, 0, 0)
//     PACK-ES-IN-JIRA ORIGINAL: WIDTH = 800
//     PACK-ES-IN-JIRA ORIGINAL: HEIGHT = 600
//     PACK-ES-IN-JIRA ORIGINAL: BLOCK_SPEED = 20
//     PACK-ES-IN-JIRA ORIGINAL: class Snake:
//     PACK-ES-IN-JIRA ORIGINAL: def __init__(self): self.segments = [(WIDTH / 2, HEIGHT / 2)]; self.direction = "up"; self.score = 0
//     WIR MÜSSEN DAS OFFLINE NEHMEN update
//     PACK-ES-IN-JIRA ORIGINAL: def update(self): head_x, head_y = self.segments[0]
//     MACH-ES-FÜR-DIE-METRIKEN direction == "up"
//     PACK-ES-IN-JIRA ORIGINAL: if self.direction == "up": head_y -= BLOCK_SPEED
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: elif self.direction == "down": head_y += BLOCK_SPEED
//     PACK-ES-IN-JIRA ORIGINAL: elif self.direction == "left": head_x -= BLOCK_SPEED
//     PACK-ES-IN-JIRA ORIGINAL: elif self.direction == "right": head_x += BLOCK_SPEED
//     PACK-ES-IN-JIRA ORIGINAL: self.segments.insert(0, (head_x, head_y)); self.segments.pop()
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: def draw(self, screen): for segment in self.segments: pygame.draw.rect(screen, GREEN, (segment[0], segment[1], BLOCK_SIZE, BLOCK_SIZE))
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN move_up
//     PACK-ES-IN-JIRA ORIGINAL: def move_up(self): if self.direction != "down": self.direction = "up"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN move_down
//     PACK-ES-IN-JIRA ORIGINAL: def move_down(self): if self.direction != "up": self.direction = "down"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN move_left
//     PACK-ES-IN-JIRA ORIGINAL: def move_left(self): if self.direction != "right": self.direction = "left"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN move_right
//     PACK-ES-IN-JIRA ORIGINAL: def move_right(self): if self.direction != "left": self.direction = "right"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: class Food:
//     PACK-ES-IN-JIRA ORIGINAL: def __init__(self): self.x = random.randint(0, WIDTH / BLOCK_SIZE - 1) * BLOCK_SIZE; self.y = random.randint(0, HEIGHT / BLOCK_SIZE - 1) * BLOCK_SIZE
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: def draw(self, screen): pygame.draw.rect(screen, RED, (self.x, self.y, BLOCK_SIZE, BLOCK_SIZE))
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA Implement game over condition and score tracking functionality
//     PACK-ES-IN-JIRA ORIGINAL: if __name__ == '__main__': main()
//     PACK-ES-IN-JIRA ORIGINAL: SCHWARZ = (0, 0, 0)
//     PACK-ES-IN-JIRA ORIGINAL: WEISS = (255, 255, 255)
//     PACK-ES-IN-JIRA ORIGINAL: GRUEN = (0, 255, 0)
//     PACK-ES-IN-JIRA ORIGINAL: ROT = (255, 0, 0)
//     PACK-ES-IN-JIRA ORIGINAL: BREITE = 800
//     PACK-ES-IN-JIRA ORIGINAL: HOEHE = 600
//     PACK-ES-IN-JIRA ORIGINAL: BLOCK_GESCHWINDIGKEIT = 20
//     PACK-ES-IN-JIRA ORIGINAL: class Snake:
//     PACK-ES-IN-JIRA ORIGINAL: def __init__(self): self.segments = [(BREITE / 2, HOEHE / 2)]; self.richtung = "up"
//     WIR MÜSSEN DAS OFFLINE NEHMEN update
//     PACK-ES-IN-JIRA ORIGINAL: def update(self): kopf_x, kopf_y = self.segments[0]
//     MACH-ES-FÜR-DIE-METRIKEN richtung == "up"
//     PACK-ES-IN-JIRA ORIGINAL: if self.richtung == "up": kopf_y -= BLOCK_GESCHWINDIGKEIT
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: elif self.richtung == "down": kopf_y += BLOCK_GESCHWINDIGKEIT
//     PACK-ES-IN-JIRA ORIGINAL: elif self.richtung == "left": kopf_x -= BLOCK_GESCHWINDIGKEIT
//     PACK-ES-IN-JIRA ORIGINAL: elif self.richtung == "right": kopf_x += BLOCK_GESCHWINDIGKEIT
//     PACK-ES-IN-JIRA ORIGINAL: self.segments.insert(0, (kopf_x, kopf_y)); self.segments.pop()
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: def draw(self, screen): for segment in self.segments: pygame.draw.rect(screen, GRUEN, (segment[0], segment[1], BLOCK_GROESSE, BLOCK_GROESSE))
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bewege_nach_oben
//     PACK-ES-IN-JIRA ORIGINAL: def bewege_nach_oben(self): if self.richtung != "down": self.richtung = "up"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bewege_nach_unten
//     PACK-ES-IN-JIRA ORIGINAL: def bewege_nach_unten(self): if self.richtung != "up": self.richtung = "down"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bewege_nach_links
//     PACK-ES-IN-JIRA ORIGINAL: def bewege_nach_links(self): if self.richtung != "right": self.richtung = "left"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN bewege_nach_rechts
//     PACK-ES-IN-JIRA ORIGINAL: def bewege_nach_rechts(self): if self.richtung != "left": self.richtung = "right"
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: class Obst:
//     PACK-ES-IN-JIRA ORIGINAL: def __init__(self): self.x = random.randint(0, BREITE / BLOCK_GROESSE - 1) * BLOCK_GROESSE; self.y = random.randint(0, BREITE / BLOCK_GROESSE - 1) * BLOCK_GROESSE
//     WIR MÜSSEN DAS OFFLINE NEHMEN draw
//     PACK-ES-IN-JIRA ORIGINAL: def draw(self, screen): pygame.draw.rect(screen, ROT, (self.x, self.y, BLOCK_GROESSE, BLOCK_GROESSE))
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     WIR MÜSSEN DAS OFFLINE NEHMEN main
//     PACK-ES-IN-JIRA ORIGINAL: def main():
//     PACK-ES-IN-JIRA ORIGINAL: pygame.init(); screen = pygame.display.set_mode((BREITE, HOEHE)); pygame.display.set_caption("Snake"); clock = pygame.time.Clock()
//     PACK-ES-IN-JIRA ORIGINAL: snake = Snake(); obst = Obst(); game_over = False
//     BLEIB-BIS-ZUM-SPRINT-ENDE not game_over
//     PACK-ES-IN-JIRA ORIGINAL: while not game_over:
//     PACK-ES-IN-JIRA ORIGINAL: for event in pygame.event.get():
//     MACH-ES-FÜR-DIE-METRIKEN event.type == pygame.QUIT
//     PACK-ES-IN-JIRA ORIGINAL: if event.type == pygame.QUIT: game_over = True
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: elif event.type == pygame.KEYDOWN:
//     PACK-ES-IN-JIRA ORIGINAL: if event.key == pygame.K_UP: snake.bewege_nach_oben()
//     PACK-ES-IN-JIRA ORIGINAL: elif event.key == pygame.K_DOWN: snake.bewege_nach_unten()
//     PACK-ES-IN-JIRA ORIGINAL: elif event.key == pygame.K_LEFT: snake.bewege_nach_links()
//     PACK-ES-IN-JIRA ORIGINAL: elif event.key == pygame.K_RIGHT: snake.bewege_nach_rechts()
//     PACK-ES-IN-JIRA ORIGINAL: snake.update()
//     MACH-ES-FÜR-DIE-METRIKEN Kopf auf Obst
//     PACK-ES-IN-JIRA ORIGINAL: if (snake.segments[0][0] == obst.x and snake.segments[0][1] == obst.y): snake.segments.append((obst.x, obst.y)); obst = Obst()
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     MACH-ES-FÜR-DIE-METRIKEN Wand oder Selbstkollision
//     PACK-ES-IN-JIRA ORIGINAL: if (snake.segments[0][0] < 0 or snake.segments[0][0] >= BREITE or snake.segments[0][1] < 0 or snake.segments[0][1] >= HOEHE or snake.segments[0] in snake.segments[1:]): game_over = True
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: screen.fill(SCHWARZ); snake.draw(screen); obst.draw(screen)
//     PACK-ES-IN-JIRA ORIGINAL: pygame.display.flip(); clock.tick(10)
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: pygame.quit()
//     DAS HÄTTE EINE EMAIL SEIN KÖNNEN
//     PACK-ES-IN-JIRA ORIGINAL: if __name__ == '__main__': main()
//     main
//   DAS HÄTTE EINE EMAIL SEIN KÖNNEN
// BOY, DU HAST KI-VERBOT
//
