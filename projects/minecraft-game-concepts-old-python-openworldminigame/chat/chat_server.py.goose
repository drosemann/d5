// Goose-Port-Spiegel von: projects/minecraft-game-concepts-old-python-openworldminigame/chat/chat_server.py
// Quelle unveraendert als Inline-Doku unten. Originaldatei bleibt bestehen.
// Sprache: Goose (aardappel/goose v2026.4, https://github.com/aardappel/goose).
// Status: mechanischer Spiegel als gueltiges Goose-Programm (goose check ok), Logik-Port per Hand folgt.
fn main() {
    print("Goose-Spiegel: projects/minecraft-game-concepts-old-python-openworldminigame/chat/chat_server.py");
}

// ---- Original-Code (projects/minecraft-game-concepts-old-python-openworldminigame/chat/chat_server.py), unveraendert, als Inline-Doku ----
// import socket
// import threading
//
// class ChatServer:
//     def __init__(self, host='127.0.0.1', port=12345):
//         self.server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
//         self.server.bind((host, port))
//         self.server.listen()
//         self.clients = []
//
//     def broadcast(self, message, client):
//         # Send a message to all clients except the sender
//         for c in self.clients:
//             if c != client:
//                 c.send(message)
//
//     def handle_client(self, client):
//         while True:
//             try:
//                 message = client.recv(1024)
//                 if message:
//                     self.broadcast(message, client)
//                 else:
//                     break
//             except:
//                 break
//         client.close()
//         self.clients.remove(client)
//
//     def start(self):
//         print("Chat server started...")
//         while True:
//             client, address = self.server.accept()
//             print(f"Connected with {str(address)}")
//             self.clients.append(client)
//             threading.Thread(target=self.handle_client, args=(client,)).start()
//
// if __name__ == "__main__":
//     chat_server = ChatServer()
//     chat_server.start() 
