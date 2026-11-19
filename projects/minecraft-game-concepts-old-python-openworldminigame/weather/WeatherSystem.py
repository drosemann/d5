import time
import random

class WeatherSystem:
    def __init__(self):
        self.current_weather = 'sunny'
        self.weather_types = ['sunny', 'rainy', 'stormy', 'cloudy', 'snowy']
        self.weather_effects = {
            'sunny': {'visibility': 'high', 'movement_speed': 'normal', 'visual_effect': None},
            'rainy': {'visibility': 'medium', 'movement_speed': 'slow', 'visual_effect': 'rain'},
            'stormy': {'visibility': 'low', 'movement_speed': 'very slow', 'visual_effect': 'storm'},
            'cloudy': {'visibility': 'medium', 'movement_speed': 'normal', 'visual_effect': None},
            'snowy': {'visibility': 'medium', 'movement_speed': 'slow', 'visual_effect': 'snow'}
        }

    def update_weather(self):
        # Logic to update the weather over time
        if time.time() % 10 == 0:
            index = self.weather_types.index(self.current_weather)
            self.current_weather = self.weather_types[(index + 1) % len(self.weather_types)]

    def get_weather_effects(self):
        # Return effects based on the current weather
        effects = self.weather_effects[self.current_weather]
        return {
            'visibility': effects['visibility'],
            'movement_speed': effects['movement_speed'],
            'visual_effect': effects['visual_effect']
        }

    def transition_weather(self):
        # Transition to the next weather type
        self.current_weather = self.weather_types[(self.weather_types.index(self.current_weather) + 1) % len(self.weather_types)]
        # Update weather effects
        weather_effects = self.get_weather_effects()
        return weather_effects

    def get_current_weather(self):
        # Return the current weather type
        return self.current_weather

    def apply_weather_effects(self):
        # Apply gameplay effects based on the current weather
        effects = self.get_weather_effects()
        if effects['visual_effect'] == 'rain':
            print("It's raining! The ground is slippery.")
        elif effects['visual_effect'] == 'snow':
            print("It's snowing! The ground is covered in snow.")
        elif effects['visual_effect'] == 'storm':
            print("A storm is brewing! Visibility is low.")
        else:
            print("The weather is clear and sunny.")

weather_system = WeatherSystem()

# In your game loop
while running:
    weather_system.update_weather()
    weather_system.apply_weather_effects()
    # Other game logic...