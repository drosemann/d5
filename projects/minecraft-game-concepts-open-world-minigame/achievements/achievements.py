import json

class Achievement:
    def __init__(self, title, description):
        self.title = title
        self.description = description
        self.completed = False

    def complete(self):
        self.completed = True

    def is_completed(self):
        return self.completed

class Player:
    def __init__(self, name):
        self.name = name
        self.score = 0
        self.achievements = []

    def add_achievement(self, achievement):
        if not achievement.is_completed():
            achievement.complete()
            self.achievements.append(achievement)
            self.score += 10  # Increment score for completing an achievement
            print(f"{self.name} completed achievement: {achievement.title}")

    def get_score(self):
        return self.score

    def get_achievements(self):
        return [ach.title for ach in self.achievements if ach.is_completed()]

class Leaderboard:
    def __init__(self):
        self.players = []

    def add_player(self, player):
        self.players.append(player)

    def get_leaderboard(self):
        # Sort players by score in descending order
        return sorted(self.players, key=lambda p: p.get_score(), reverse=True)

    def display(self):
        print("Leaderboard:")
        for idx, player in enumerate(self.get_leaderboard(), start=1):
            print(f"{idx}. {player.name} - Score: {player.get_score()}")

    def save_leaderboard(self, filename='leaderboard.json'):
        with open(filename, 'w') as file:
            json.dump([{'name': player.name, 'score': player.get_score()} for player in self.players], file)
        print("Leaderboard saved successfully!")

    def load_leaderboard(self, filename='leaderboard.json'):
        try:
            with open(filename, 'r') as file:
                data = json.load(file)
                for entry in data:
                    player = Player(entry['name'])
                    player.score = entry['score']
                    self.add_player(player)
            print("Leaderboard loaded successfully!")
        except FileNotFoundError:
            print("No leaderboard file found.")
        except Exception as e:
            print(f"An error occurred while loading the leaderboard: {e}")

# Example usage
if __name__ == "__main__":
    # Create achievements
    achievement1 = Achievement("First Steps", "Complete the tutorial.")
    achievement2 = Achievement("Treasure Hunter", "Find your first treasure.")

    # Create players
    player1 = Player("Hero")
    player2 = Player("Adventurer")

    # Add achievements to players
    player1.add_achievement(achievement1)
    player2.add_achievement(achievement2)

    # Create and display leaderboard
    leaderboard = Leaderboard()
    leaderboard.add_player(player1)
    leaderboard.add_player(player2)
    leaderboard.display()

    # Save and load leaderboard
    leaderboard.save_leaderboard()
    leaderboard.load_leaderboard() 