import time
import pyautogui
import random
import requests
import logging
from datetime import datetime

pyautogui.PAUSE = 0.5

# Add your Tenor API key here
TENOR_API_KEY = "YOUR_API_KEY"  # Get from https://tenor.com/developer/dashboard

# Setup logging configuration
logging.basicConfig(
    filename=f'spammer_{datetime.now().strftime("%Y%m%d_%H%M%S")}.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

# jokes = [
#     "Why don't programmers like nature? It has too many bugs.",
#     "Why did the programmer quit his job? Because he didn't get arrays.",
#     "What do you call a programmer from Finland? Nerdic.",
#     "Why do programmers always mix up Halloween and Christmas? Because Oct 31 equals Dec 25.",
#     "How many programmers does it take to change a light bulb? None, that's a hardware problem.",
#     "Why do programmers prefer dark mode? Because light attracts bugs.",
#     "Why did the computer show up late to work? It had a hard drive.",
#     "I just saw my code running flawlessly... in production. Ever have that moment?",
#     "Software developers like to solve problems. If there are no problems, they will create their own.",
#     "A programmer’s wife tells him: 'Go to the store and buy a loaf of bread, and if they have eggs, buy ten.' He comes back with ten loaves.",
#     "A C programmer's wife tells him to go to the store and get a loaf of bread, and if they have butter, get some too. He comes back with a loaf of bread and butter.",
#     "Why do Java developers wear glasses? Because they can't C#.",
#     "What did the router say to the doctor? It hurts when IP.",
#     "I tried to catch some fog yesterday. I mist.",
#     "A programmer walks into a bar and orders 1.000000119 beers.",
#     "Computers make very fast, very accurate mistakes.",
#     "Why did the programmer use dark mode? Because light attracts bugs.",
#     "I had a problem, so I thought, 'I’d use recursion.' Now I have a problem inside a problem inside a problem...",
#     "Has anyone tried turning it off and on again? The programmer’s motto.",
#     "To err is human; to really foul things up requires a computer.",
#     "I don't always test my code, but when I do, I do it in production.",
#     "Why did the programmer get kicked out of school? Because he kept breaking the class rules.",
#     "Computers are fast; programmers keep it slow.",
#     "I wrote a program so smart that it could pass the Turing test, but then it kept asking me if I passed it.",
#     "What do you call 8 hobbits? A hobbyte.",
#     "I would love to change the world, but they won’t give me the source code.",
#     "What’s a programmer’s favorite hangout place? The Foo Bar.",
#     "How do you comfort a JavaScript bug? You console it.",
#     "Why don't bachelors like Git? Because they are afraid to commit.",
#     "Programming is like a relationship. You can only find the bugs if you really get committed.",
#     "I asked a programmer for a copy of his code. He said, 'It's proprietary.'",
#     "My code doesn’t always work, but when it does, I don’t know why.",
#     "There are 10 types of people in this world: those who understand binary and those who don't.",
#     "Programmers are not to be trusted. They can drop exceptions.",
#     "An algorithm walks into a bar, orders a drink, and then immediately leaves. The bartender says: 'Time complexity.'",
#     "Debugging: where you remove the needles from the haystack.",
#     "I have trust issues with my code. I usually assume there’s a bug lurking.",
#     "All programmers are playwrights; they write their scripts and run them.",
#     "The code compiled on first run. What sorcery is this?",
#     "Ever tried to explain your code to someone? It's like teaching a cat to use a computer.",
#     "I’m not lazy, I just use asynchronous programming.",
#     "My computer beat me in chess… but it was no match for me in kickboxing.",
#     "Life is too short for bad code and long meetings.",
#     "My code never works on the first try. That's why I call it a prototype.",
#     "I’d tell you another programming joke, but it's recursive.",
#     "Writing code is easy; solving problems is the challenge.",
#     "Programming: turning caffeine into code.",
#     "If at first you don’t succeed; call it version 1.0.",
#     "Real programmers don’t comment their code. If it wasn’t done in such a mysterious way, it wouldn’t be fun.",
#     "I named my dog 'Debugger'. Now whenever he barks, I check the logs.",
#     "In programming, there are two ways to do things: one that works, and the other is the one you write.",
#     "Why did the developer go broke? Because he used up all his cache.",
#     "I got a job as a daemon process; the work is non-stop.",
#     "When the world hands you lemons, make lemonade. Then code an app to sell it.",
#     "Programmers always live life in binary; either you're on or you're off.",
#     "What do you get when you cross a computer and a life coach? A mentor program."
# ]
jokes = ["minecraft 1.21.5 IP: shadowunity.de"]

def get_random_meme():
    """Get a random programming meme from Tenor"""
    try:
        search_term = "programming memes"
        url = f"https://g.tenor.com/v1/search?q={search_term}&key={TENOR_API_KEY}&limit=50"
        
        response = requests.get(url)
        if response.status_code == 200:
            results = response.json()['results']
            meme = random.choice(results)
            share_url = f"https://g.tenor.com/v1/registershare?id={meme['id']}&key={TENOR_API_KEY}&q={search_term}"
            requests.get(share_url)
            logging.info(f"Successfully retrieved meme: {meme['url']}")
            return meme['url']
        logging.error(f"Failed to get meme. Status code: {response.status_code}")
    except Exception as e:
        logging.error(f"Error in get_random_meme: {str(e)}")
    return None

def spam_user(username):
    try:
        logging.info(f"Starting user spam for: {username}")
        print(f"Starting in 3 seconds... Move your cursor to where you want to ping {username}")
        time.sleep(3)
        while True:
            pyautogui.typewrite(f"@{username}")
            pyautogui.press('space')
            pyautogui.press('enter')
            logging.debug(f"Sent ping to {username}")
    except Exception as e:
        logging.error(f"Error in spam_user: {str(e)}")

def send_jokes():
    try:
        logging.info("Starting joke spam")
        print("Starting in 3 seconds... Move your cursor to where you want to type jokes")
        time.sleep(3)
        while True:
            joke = random.choice(jokes)
            pyautogui.typewrite(joke)
            pyautogui.press('enter')
            logging.debug(f"Sent joke: {joke[:30]}...")
    except Exception as e:
        logging.error(f"Error in send_jokes: {str(e)}")

def send_memes():
    try:
        logging.info("Starting meme spam")
        print("Starting in 3 seconds... Move your cursor to where you want to paste meme URLs")
        time.sleep(3)
        while True:
            meme_url = get_random_meme()
            if meme_url:
                pyautogui.typewrite(meme_url)
                pyautogui.press('enter')
            time.sleep(0.8)
    except Exception as e:
        logging.error(f"Error in send_memes: {str(e)}")

def spam_tabs():
    try:
        logging.info("Starting tab spam")
        print("Starting in 3 seconds... Move your cursor to the target window")
        time.sleep(3)
        while True:
            pyautogui.press('tab')
            pyautogui.press('enter')
            logging.debug("Sent tab + enter combination")
            time.sleep(0.8)  # Using same delay as other modes
    except Exception as e:
        logging.error(f"Error in spam_tabs: {str(e)}")

if __name__ == "__main__":
    try:
        logging.info("Program started")
        mode = input("Choose mode (1 for jokes, 2 for user spam, 3 for memes, 4 for tab spam): ")
        if mode == "2":
            username = input("Enter username to spam: ")
            spam_user(username)
        elif mode == "1":
            send_jokes()
        elif mode == "3":
            send_memes()
        elif mode == "4":
            spam_tabs()
        else:
            logging.warning(f"Invalid mode selected: {mode}")
            print("Invalid choice. Please choose 1, 2, 3, or 4.")
    except KeyboardInterrupt:
        logging.info("Program stopped by user")
        print("\nScript stopped by user")
    except Exception as e:
        logging.critical(f"Unexpected error: {str(e)}")

if __name__ == "__main__":
    try:
        logging.info("Program started")
        mode = input("Choose mode (1 for jokes, 2 for user spam, 3 for memes): ")
        if mode == "2":
            username = input("Enter username to spam: ")
            spam_user(username)
        elif mode == "1":
            send_jokes()
        elif mode == "3":
            send_memes()
        else:
            logging.warning(f"Invalid mode selected: {mode}")
            print("Invalid choice. Please choose 1, 2, or 3.")
    except KeyboardInterrupt:
        logging.info("Program stopped by user")
        print("\nScript stopped by user")
    except Exception as e:
        logging.critical(f"Unexpected error: {str(e)}")