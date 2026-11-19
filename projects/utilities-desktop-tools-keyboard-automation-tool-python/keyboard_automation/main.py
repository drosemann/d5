from key_presser import KeyPresser

def main():
    presser = KeyPresser(interval=0.5)
    
    while True:
        print("\nSelect mode:")
        print("1. A-D alternating")
        print("2. QE sequence")
        print("3. Hold a key")
        print("4. Perform key combo")
        print("5. Record and playback")
        print("6. Type with delay")
        print("7. Exit")
        
        choice = input("Enter choice (1-7): ")
        
        try:
            if choice == "1":
                randomize = input("Randomize interval? (y/n): ").lower() == 'y'
                print("Starting A-D alternation (Press Ctrl+C to stop)")
                presser.press_alternating_keys(("a", "d"), randomize)
            elif choice == "2":
                repetitions = int(input("Enter number of repetitions: "))
                print(f"Starting QE sequence {repetitions} times (Press Ctrl+C to stop)")
                presser.type_sequence("qe", repetitions)
            elif choice == "3":
                key = input("Enter key to hold: ")
                duration = float(input("Enter duration to hold (in seconds): "))
                presser.hold_key(key, duration)
            elif choice == "4":
                combo = input("Enter key combo (e.g., 'ctrl+c'): ").split('+')
                presser.perform_key_combo(combo)
            elif choice == "5":
                duration = float(input("Enter recording duration (in seconds): "))
                playback_times = int(input("Enter number of playback times: "))
                presser.record_and_playback(duration, playback_times)
            elif choice == "6":
                text = input("Enter text to type: ")
                char_delay = float(input("Enter delay between characters (in seconds): "))
                presser.type_with_delay(text, char_delay)
            elif choice == "7":
                print("Exiting program.")
                break
            else:
                print("Invalid choice")
        except KeyboardInterrupt:
            print("\nOperation interrupted by user.")
        except ValueError:
            print("Invalid input. Please enter a number where required.")

if __name__ == "__main__":
    main() 