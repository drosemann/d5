import turtle
import random
import math
import time  # Add at the top with other imports

# Game Constants
WINDOW_WIDTH = 1920
WINDOW_HEIGHT = 1080
PADDLE_WIDTH = 40  # Increased width
PADDLE_HEIGHT = 200  # Increased height
BALL_SIZE = 30  # Increased size
PADDLE_SPEED = 8  # Adjusted for larger area
INITIAL_BALL_SPEED = 1.0  # Faster initial speed
SPEED_INCREASE = 1.1
MAX_SCORE = 5
AI_SPEED = 10
AI_REACTION_DISTANCE = 60
POINTS_PER_SCORE = 10
TIME_REWARD = 1

# Add to Game Constants (after existing constants)
SHOP_ITEMS = {
    'paddle_size': {'name': '1. Bigger Paddle', 'cost': 20, 'level': 1, 'max_level': 3},
    'paddle_speed': {'name': '2. Faster Paddle', 'cost': 30, 'level': 1, 'max_level': 3},
}

# Initialize screen
wn = turtle.Screen()
wn.title("Enhanced Ping Pong")
wn.bgcolor("black")
wn.setup(width=WINDOW_WIDTH, height=WINDOW_HEIGHT)
wn.cv._rootwindow.attributes('-fullscreen', True)  # Force fullscreen
wn.tracer(0)

# Modify paddle positions
PADDLE_X_OFFSET = WINDOW_WIDTH//2 - 100  # Move paddles further from edges

class Background(turtle.Turtle):
    def __init__(self):
        super().__init__()
        self.speed(0)
        self.penup()
        self.hideturtle()
        self.color("gray20")
        self.draw_grid()
        self.draw_center_line()
    
    def draw_grid(self):
        # Draw horizontal lines
        for y in range(-WINDOW_HEIGHT//2, WINDOW_HEIGHT//2, 50):
            self.penup()
            self.goto(-WINDOW_WIDTH//2, y)
            self.pendown()
            self.goto(WINDOW_WIDTH//2, y)
            
        # Draw vertical lines
        for x in range(-WINDOW_WIDTH//2, WINDOW_WIDTH//2, 50):
            self.penup()
            self.goto(x, -WINDOW_HEIGHT//2)
            self.pendown()
            self.goto(x, WINDOW_HEIGHT//2)
    
    def draw_center_line(self):
        self.color("white")
        self.pensize(3)
        self.penup()
        self.goto(0, -WINDOW_HEIGHT//2)
        self.setheading(90)
        
        for y in range(-WINDOW_HEIGHT//2, WINDOW_HEIGHT//2, 20):
            self.pendown()
            self.forward(10)
            self.penup()
            self.forward(10)

class EnhancedScoreboard(turtle.Turtle):
    def __init__(self):
        super().__init__()
        self.score_a = 0
        self.score_b = 0
        self.speed(0)
        self.color("white")
        self.penup()
        self.hideturtle()
        self.create_score_displays()
        
    def create_score_displays(self):
        self.score_left = turtle.Turtle()
        self.score_right = turtle.Turtle()
        
        for score in [self.score_left, self.score_right]:
            score.speed(0)
            score.color("white")
            score.penup()
            score.hideturtle()
        
        # Moved scores higher and further apart
        self.score_left.goto(-WINDOW_WIDTH//3, WINDOW_HEIGHT//2 - 100)
        self.score_right.goto(WINDOW_WIDTH//3, WINDOW_HEIGHT//2 - 100)
        
    def update_score(self):
        self.score_left.clear()
        self.score_right.clear()
        self.score_left.write(self.score_a, align="center", font=("Arial", 120, "bold"))
        self.score_right.write(self.score_b, align="center", font=("Arial", 120, "bold"))

def show_start_screen():
    start_text = turtle.Turtle()
    start_text.speed(0)
    start_text.color("white")
    start_text.penup()
    start_text.hideturtle()
    start_text.goto(0, 50)
    start_text.write("PONG", align="center", font=("Arial", 60, "bold"))
    start_text.goto(0, -50)
    start_text.write("Press SPACE to start", align="center", font=("Arial", 20, "normal"))
    return start_text

class Paddle(turtle.Turtle):
    def __init__(self, x_pos):
        super().__init__()
        self.speed(0)
        self.shape("square")
        self.color("white")
        self.shapesize(stretch_wid=PADDLE_HEIGHT//20, stretch_len=PADDLE_WIDTH//20)  # Adjust for new size
        self.penup()
        self.goto(x_pos, 0)
        self.moving = False
        self.dy = 0
        
    def move_up(self):
        self.dy = PADDLE_SPEED if self.xcor() < 0 else AI_SPEED
        self.moving = True
        
    def move_down(self):
        self.dy = -PADDLE_SPEED if self.xcor() < 0 else -AI_SPEED
        self.moving = True
        
    def stop(self):
        self.dy = 0
        self.moving = False
        
    def update(self):
        if self.moving:
            new_y = self.ycor() + self.dy
            new_y = min(max(new_y, -WINDOW_HEIGHT//2 + PADDLE_HEIGHT//2), 
                       WINDOW_HEIGHT//2 - PADDLE_HEIGHT//2)
            self.sety(new_y)

class Ball(turtle.Turtle):
    def __init__(self):
        super().__init__()
        self.speed(0)
        self.shape("circle")
        self.color("white")
        self.penup()
        self.base_speed = INITIAL_BALL_SPEED
        self.reset_position()
        
    def reset_position(self):
        self.goto(0, 0)
        angle = random.uniform(-math.pi/4, math.pi/4)
        self.dx = self.base_speed * math.cos(angle)
        self.dy = self.base_speed * math.sin(angle)
        if random.random() < 0.5:
            self.dx *= -1
        
    def move(self):
        self.setx(self.xcor() + self.dx)
        self.sety(self.ycor() + self.dy)
        
    def bounce_y(self):
        self.dy *= -1
        self.dy += random.uniform(-0.05, 0.05)
        
    def bounce_x(self, paddle):
        relative_intersect = (self.ycor() - paddle.ycor()) / (PADDLE_HEIGHT/2)
        angle = relative_intersect * math.pi/3
        speed = math.sqrt(self.dx**2 + self.dy**2) * SPEED_INCREASE
        
        direction = -1 if self.dx > 0 else 1
        self.dx = direction * speed * math.cos(angle)
        self.dy = speed * math.sin(angle)

class Shop(turtle.Turtle):
    def __init__(self):
        super().__init__()
        self.speed(0)
        self.color("white")
        self.penup()
        self.hideturtle()
        self.points = 0
        self.upgrades = SHOP_ITEMS
        
    def show_shop(self):
        self.clear()
        # Draw shop background - moved to top right
        self.color("gray20")
        self.goto(WINDOW_WIDTH//2 - 300, WINDOW_HEIGHT//2 - 20)
        self.pendown()
        self.fillcolor("gray10")
        self.begin_fill()
        for _ in range(2):
            self.forward(280)
            self.right(90)
            self.forward(300)
            self.right(90)
        self.end_fill()
        self.penup()
        
        # Show points
        self.color("yellow")
        self.goto(WINDOW_WIDTH//2 - 160, WINDOW_HEIGHT//2 - 60)
        self.write(f"💰 {self.points}", align="center", font=("Arial", 32, "bold"))
        
        # Show upgrades
        y_pos = WINDOW_HEIGHT//2 - 120
        self.color("white")
        for item, data in self.upgrades.items():
            self.goto(WINDOW_WIDTH//2 - 280, y_pos)
            self.write(f"{data['name']}", font=("Arial", 24, "normal"))
            
            self.goto(WINDOW_WIDTH//2 - 40, y_pos)
            self.write(f"Lvl {data['level']}", align="right", font=("Arial", 24, "normal"))
            
            self.goto(WINDOW_WIDTH//2 - 160, y_pos - 35)
            if data['level'] < data['max_level']:
                self.color("lime" if self.points >= data['cost'] else "red")
                self.write(f"Cost: {data['cost']}", align="center", font=("Arial", 20, "normal"))
            else:
                self.color("gray")
                self.write("MAX LEVEL", align="center", font=("Arial", 20, "normal"))
            self.color("white")
            y_pos -= 90
    
    def add_points(self, amount):
        self.points += amount
        self.show_shop()
    
    def buy_upgrade(self, item, paddle):
        if item not in self.upgrades:
            return False
        
        upgrade = self.upgrades[item]
        if upgrade['level'] >= upgrade['max_level']:
            return False
        
        if self.points >= upgrade['cost']:
            self.points -= upgrade['cost']
            upgrade['level'] += 1
            upgrade['cost'] *= 2
            
            # Apply upgrade
            if item == 'paddle_size':
                current_stretch = paddle.shapesize()[0]
                paddle.shapesize(stretch_wid=current_stretch + 1)
            elif item == 'paddle_speed':
                global PADDLE_SPEED
                PADDLE_SPEED *= 1.2
            
            self.show_shop()
            return True
        return False

# Create background
background = Background()

# Show start screen
start_screen = show_start_screen()

# Wait for space key
game_started = False
def start_game():
    global game_started
    game_started = True
    start_screen.clear()

wn.listen()
wn.onkey(start_game, "space")

# Wait until game starts
while not game_started:
    wn.update()

# Create game objects
paddle_a = Paddle(-350)
paddle_b = Paddle(350)
ball = Ball()
scoreboard = EnhancedScoreboard()
shop = Shop()
shop.show_shop()

# Keyboard bindings
wn.listen()
wn.onkeypress(paddle_a.move_up, "w")
wn.onkeypress(paddle_a.move_down, "s")
wn.onkeyrelease(lambda: paddle_a.stop(), "w")
wn.onkeyrelease(lambda: paddle_a.stop(), "s")

# Add keyboard bindings for shop
def buy_size_upgrade():
    shop.buy_upgrade('paddle_size', paddle_a)

def buy_speed_upgrade():
    shop.buy_upgrade('paddle_speed', paddle_a)

wn.onkey(buy_size_upgrade, "1")
wn.onkey(buy_speed_upgrade, "2")

# Add before game loop
last_time_reward = time.time()

# Game loop
game_active = True
ai_reaction_delay = 0
while game_active:
    wn.update()
    
    # Move ball
    ball.move()
    
    # Update paddle positions
    paddle_a.update()
    
    # Improved AI logic
    if ball.dx > 0:
        ai_reaction_delay += 1
        if ai_reaction_delay >= 2:
            ai_reaction_delay = 0
            if ball.ycor() > paddle_b.ycor() + AI_REACTION_DISTANCE:
                paddle_b.move_up()
            elif ball.ycor() < paddle_b.ycor() - AI_REACTION_DISTANCE:
                paddle_b.move_down()
            else:
                paddle_b.stop()
    else:
        if abs(paddle_b.ycor()) > 10:
            if paddle_b.ycor() > 0:
                paddle_b.move_down()
            else:
                paddle_b.move_up()
        else:
            paddle_b.stop()
            
    paddle_b.update()
    
    # Wall collisions
    if abs(ball.ycor()) > WINDOW_HEIGHT/2 - BALL_SIZE:
        ball.bounce_y()
    
    # Scoring
    if ball.xcor() > WINDOW_WIDTH/2:
        scoreboard.score_a += 1
        shop.add_points(POINTS_PER_SCORE)
        scoreboard.update_score()
        paddle_a.color(random.choice(['red', 'blue', 'green', 'yellow']))
        ball.reset_position()
    elif ball.xcor() < -WINDOW_WIDTH/2:
        scoreboard.score_b += 1
        scoreboard.update_score()
        paddle_b.color(random.choice(['red', 'blue', 'green', 'yellow']))
        ball.reset_position()
    
    # Paddle collisions
    if (ball.dx > 0 and 
        340 < ball.xcor() < 350 and 
        paddle_b.ycor() - PADDLE_HEIGHT/2 < ball.ycor() < paddle_b.ycor() + PADDLE_HEIGHT/2):
        ball.setx(340)
        ball.bounce_x(paddle_b)
        ball.color("blue")
        
    elif (ball.dx < 0 and 
          -350 < ball.xcor() < -340 and 
          paddle_a.ycor() - PADDLE_HEIGHT/2 < ball.ycor() < paddle_a.ycor() + PADDLE_HEIGHT/2):
        ball.setx(-340)
        ball.bounce_x(paddle_a)
        ball.color("red")
    
    # Check for winner
    if max(scoreboard.score_a, scoreboard.score_b) >= MAX_SCORE:
        winner = "Player A" if scoreboard.score_a >= MAX_SCORE else "Player B"
        scoreboard.goto(0, 0)
        scoreboard.write(f"{winner} Wins!", align="center", font=("Courier", 36, "bold"))
        game_active = False

    # Add inside game loop (after wn.update())
    # Time-based rewards
    current_time = time.time()
    if current_time - last_time_reward >= 1:  # Every second
        shop.add_points(TIME_REWARD)
        last_time_reward = current_time

def exit_game():
    wn.bye()

wn.onkey(exit_game, "Escape")  # Add this with your other key bindings

wn.mainloop()
