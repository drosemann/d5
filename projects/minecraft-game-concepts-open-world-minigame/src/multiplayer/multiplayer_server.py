import socket
import threading

class MultiplayerServer:
    def __init__(self, host='127.0.0.1', port=12345):
        self.server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.server.bind((host, port))
        self.server.listen()
        self.clients = []
        self.players = {}

    def broadcast(self, message, client):
        for c in self.clients:
            if c != client:
                c.send(message)

    def handle_client(self, client):
        while True:
            try:
                message = client.recv(1024)
                if message:
                    self.broadcast(message, client)
                else:
                    break
            except:
                break
        client.close()
        self.clients.remove(client)

    def add_player(self, client, player_name):
        self.players[client] = player_name
        self.broadcast(f"{player_name} has joined the game.".encode('utf-8'), client)

    def start(self):
        print("Multiplayer server started...")
        while True:
            client, address = self.server.accept()
            print(f"Connected with {str(address)}")
            self.clients.append(client)
            threading.Thread(target=self.handle_client, args=(client,)).start()

if __name__ == "__main__":
    multiplayer_server = MultiplayerServer()
    multiplayer_server.start() 