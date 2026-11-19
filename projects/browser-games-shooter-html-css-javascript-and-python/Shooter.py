import pygame
import random

# Initialisierung des Pygame-Fensters
pygame.init()
width, height = 800, 600
screen = pygame.display.set_mode((width, height))
pygame.display.set_caption("Shooter")

# Farben
WHITE = (255, 255, 255)
RED = (255, 0, 0)
BLUE = (0, 0, 255)

# Spieler
player_size = 50
player_pos = [width / 2, height - player_size * 2]

# Gegner
enemy_size = 50
enemy_pos = [random.randint(0, width - enemy_size), 0]
enemy_list = [enemy_pos]

# Geschwindigkeit
player_speed = 10
enemy_speed = 5

# Punkte
score = 0

# Spiel-Loop
game_over = False
clock = pygame.time.Clock()

def drop_enemies(enemy_list):
    delay = random.random()
    if len(enemy_list) < 10 and delay < 0.1:
        x_pos = random.randint(0, width - enemy_size)
        y_pos = 0
        enemy_list.append([x_pos, y_pos])

def draw_enemies(enemy_list):
    for enemy_pos in enemy_list:
        pygame.draw.rect(screen, BLUE, (enemy_pos[0], enemy_pos[1], enemy_size, enemy_size))

def update_enemy_positions(enemy_list, score):
    for idx, enemy_pos in enumerate(enemy_list):
        if enemy_pos[1] >= 0 and enemy_pos[1] < height:
            enemy_pos[1] += enemy_speed
        else:
            enemy_list.pop(idx)
            score += 1
    return score

def collision_check(enemy_list, player_pos):
    for enemy_pos in enemy_list:
        if detect_collision(enemy_pos, player_pos):
            return True
    return False

def detect_collision(player_pos, enemy_pos):
    p_x = player_pos[0]
    p_y = player_pos[1]

    e_x = enemy_pos[0]
    e_y = enemy_pos[1]

    if (e_x >= p_x and e_x < (p_x + player_size)) or (p_x >= e_x and p_x < (e_x + enemy_size)):
        if (e_y >= p_y and e_y < (p_y + player_size)) or (p_y >= e_y and p_y < (e_y + enemy_size)):
            return True
    return False

while not game_over:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            quit()

        if event.type == pygame.KEYDOWN:
            x = player_pos[0]
            y = player_pos[1]
            if event.key == pygame.K_LEFT:
                x -= player_speed
            elif event.key == pygame.K_RIGHT:
                x += player_speed
            player_pos = [x, y]

    screen.fill(WHITE)

    drop_enemies(enemy_list)
    score = update_enemy_positions(enemy_list, score)
    text = "Score: " + str(score)
    pygame.display.set_caption(text)

    if collision_check(enemy_list, player_pos):
        game_over = True
        break

    draw_enemies(enemy_list)
    pygame.draw.rect(screen, RED, (player_pos[0], player_pos[1], player_size, player_size))

    clock.tick(30)
    pygame.display.update()

pygame.quit()
