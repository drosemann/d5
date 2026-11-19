import pickle

class GameState:
    def __init__(self, player_name, health, inventory, quests):
        self.player_name = player_name
        self.health = health
        self.inventory = inventory  # This could be an instance of the Inventory class
        self.quests = quests  # This could be a list of Quest instances

def save_game(game_state, filename='savegame.pkl'):
    # Save the game state to a file
    with open(filename, 'wb') as file:
        pickle.dump(game_state, file)
    print("Game saved successfully!")

def load_game(filename='savegame.pkl'):
    # Load the game state from a file
    try:
        with open(filename, 'rb') as file:
            game_state = pickle.load(file)
        print("Game loaded successfully!")
        return game_state
    except FileNotFoundError:
        print("Save file not found.")
        return None
    except Exception as e:
        print(f"An error occurred while loading the game: {e}")
        return None

# Example usage
if __name__ == "__main__":
    # Create a sample game state
    player_name = "Hero"
    health = 100
    inventory = {"Health Potion": 3, "Mana Potion": 2}  # Example inventory
    quests = []  # Example quests list

    game_state = GameState(player_name, health, inventory, quests)

    # Save the game state
    save_game(game_state)

    # Load the game state
    loaded_game_state = load_game()
    if loaded_game_state:
        print(f"Player Name: {loaded_game_state.player_name}")
        print(f"Health: {loaded_game_state.health}")
        print(f"Inventory: {loaded_game_state.inventory}")
        print(f"Quests: {loaded_game_state.quests}") 