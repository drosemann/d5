class NPC:
    def __init__(self, name, role, dialogue):
        # Initialize the NPC with a name, role, and dialogue
        self.name = name
        self.role = role  # Role could be 'quest-giver', 'shopkeeper', 'lore', etc.
        self.dialogue = dialogue  # Dialogue options for the NPC
        self.quests = []  # List to hold quests offered by the NPC

    def add_quest(self, quest):
        # Add a quest to the NPC's list of quests
        self.quests.append(quest)

    def interact(self):
        # Display the NPC's dialogue
        print(f"{self.name} ({self.role}): {self.dialogue}")

    def show_quests(self):
        # Show available quests from the NPC
        if self.quests:
            print(f"{self.name} has the following quests:")
            for quest in self.quests:
                print(f"- {quest.title}: {quest.description}")
        else:
            print(f"{self.name} has no quests available.")

    def sell_item(self, item, price):
        # Simulate selling an item
        print(f"{self.name} sells {item} for {price} gold.") 