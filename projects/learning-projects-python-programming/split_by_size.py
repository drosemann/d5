import json
import os

file_size = os.path.getsize("chat.json")
print(f"Original Größe: {file_size / 1024 / 1024:.2f} MB")

with open("chat.json", "r", encoding="utf-8") as f:
    data = json.load(f)

if "messages" not in data:
    print("Keine messages gefunden!")
    exit(1)

messages = data["messages"]
total = len(messages)
half = total // 2

data["messages"] = messages[:half]

with open("teil1.json", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

data["messages"] = messages[half:]

with open("teil2.json", "w", encoding="utf-8") as f:
    json.dump(data, f, indent=2, ensure_ascii=False)

print(f"teil1.json: {len(messages[:half])} messages")
print(f"teil2.json: {len(messages[half:])} messages")
