// Goose-Port-Spiegel von: projects/browser-games-snake/main.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/browser-games-snake/main.py");
}

// ---- Original-Code (projects/browser-games-snake/main.py), unveraendert, als Inline-Doku ----
// import pygame
// import random
//
// import pygame
// import random
//
// BLACK = (0, 0, 0)
// WHITE = (255, 255, 255)
// GREEN = (0, 255, 0)
// RED = (255, 0, 0)
//
// WIDTH = 800
// HEIGHT = 600
//
// BLOCK_SPEED = 20
//
// class Snake:
//     def __init__(self):
//         self.segments = [(WIDTH / 2, HEIGHT / 2)]
//         self.direction = "up"
//         self.score = 0  # Initialize score
//
//     def update(self):
//         head_x, head_y = self.segments[0]
//
//         if self.direction == "up":
//             head_y -= BLOCK_SPEED
//         elif self.direction == "down":
//             head_y += BLOCK_SPEED
//         elif self.direction == "left":
//             head_x -= BLOCK_SPEED
//         elif self.direction == "right":
//             head_x += BLOCK_SPEED
//
//         self.segments.insert(0, (head_x, head_y))
//         self.segments.pop()
//
//     def draw(self, screen):
//         for segment in self.segments:
//             pygame.draw.rect(screen, GREEN, (segment[0], segment[1], BLOCK_SIZE, BLOCK_SIZE))
//
//     def move_up(self):
//         if self.direction != "down":
//             self.direction = "up"
//
//     def move_down(self):
//         if self.direction != "up":
//             self.direction = "down"
//
//     def move_left(self):
//         if self.direction != "right":
//             self.direction = "left"
//
//     def move_right(self):
//         if self.direction != "left":
//             self.direction = "right"
//
// class Food:
//     def __init__(self):
//         self.x = random.randint(0, WIDTH / BLOCK_SIZE - 1) * BLOCK_SIZE
//         self.y = random.randint(0, HEIGHT / BLOCK_SIZE - 1) * BLOCK_SIZE
//
//     def draw(self, screen):
//         pygame.draw.rect(screen, RED, (self.x, self.y, BLOCK_SIZE, BLOCK_SIZE))
//
// # Implement game over condition and score tracking functionality
//
// if __name__ == '__main__':
//     main()
//
// SCHWARZ = (0, 0, 0)
// WEISS = (255, 255, 255)
// GRUEN = (0, 255, 0)
// ROT = (255, 0, 0)
//
// BREITE = 800
// HOEHE = 600
//
// BLOCK_GESCHWINDIGKEIT = 20
//
// class Snake:
//     def __init__(self):
//         self.segments = [(BREITE / 2, HOEHE / 2)]
//         self.richtung = "up"
//
//     def update(self):
//         kopf_x, kopf_y = self.segments[0]
//
//         if self.richtung == "up":
//             kopf_y -= BLOCK_GESCHWINDIGKEIT
//         elif self.richtung == "down":
//             kopf_y += BLOCK_GESCHWINDIGKEIT
//         elif self.richtung == "left":
//             kopf_x -= BLOCK_GESCHWINDIGKEIT
//         elif self.richtung == "right":
//             kopf_x += BLOCK_GESCHWINDIGKEIT
//
//         self.segments.insert(0, (kopf_x, kopf_y))
//         self.segments.pop()
//
//     def draw(self, screen):
//         for segment in self.segments:
//             pygame.draw.rect(screen, GRUEN, (segment[0], segment[1], BLOCK_GROESSE, BLOCK_GROESSE))
//
//     def bewege_nach_oben(self):
//         if self.richtung != "down":
//             self.richtung = "up"
//
//     def bewege_nach_unten(self):
//         if self.richtung != "up":
//             self.richtung = "down"
//
//     def bewege_nach_links(self):
//         if self.richtung != "right":
//             self.richtung = "left"
//
//     def bewege_nach_rechts(self):
//         if self.richtung != "left":
//             self.richtung = "right"
//
// class Obst:
//     def __init__(self):
//         self.x = random.randint(0, BREITE / BLOCK_GROESSE - 1) * BLOCK_GROESSE
//         self.y = random.randint(0, HOEHE / BLOCK_GROESSE - 1) * BLOCK_GROESSE
//
//     def draw(self, screen):
//         pygame.draw.rect(screen, ROT, (self.x, self.y, BLOCK_GROESSE, BLOCK_GROESSE))
//
// def main():
//     pygame.init()
//
//     screen = pygame.display.set_mode((BREITE, HOEHE))
//     pygame.display.set_caption("Snake")
//
//     clock = pygame.time.Clock()
//
//     snake = Snake()
//     obst = Obst()
//
//     game_over = False
//
//     while not game_over:
//         for event in pygame.event.get():
//             if event.type == pygame.QUIT:
//                 game_over = True
//             elif event.type == pygame.KEYDOWN:
//                 if event.key == pygame.K_UP:
//                     snake.bewege_nach_oben()
//                 elif event.key == pygame.K_DOWN:
//                     snake.bewege_nach_unten()
//                 elif event.key == pygame.K_LEFT:
//                     snake.bewege_nach_links()
//                 elif event.key == pygame.K_RIGHT:
//                     snake.bewege_nach_rechts()
//
//         snake.update()
//
//         if (snake.segments[0][0] == obst.x and snake.segments[0][1] == obst.y):
//             snake.segments.append((obst.x, obst.y))
//             obst = Obst()
//
//         if (snake.segments[0][0] < 0 or snake.segments[0][0] >= BREITE or
//             snake.segments[0][1] < 0 or snake.segments[0][1] >= HOEHE or
//             snake.segments[0] in snake.segments[1:]):
//             game_over = True
//
//         screen.fill(SCHWARZ)
//         snake.draw(screen)
//         obst.draw(screen)
//
//         pygame.display.flip()
//         clock.tick(10)
//
//     pygame.quit()
//
// if __name__ == '__main__':
//     main()
//
