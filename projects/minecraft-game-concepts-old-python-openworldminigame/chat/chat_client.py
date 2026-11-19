import socket
import threading

class ChatClient:
    def __init__(self, host='127.0.0.1', port=12345):
        self.client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.client.connect((host, port))

    def receive_messages(self):
        while True:
            try:
                message = self.client.recv(1024).decode('utf-8')
                if message:
                    print(message)
                else:
                    break
            except:
                break

    def send_messages(self):
        while True:
            message = input()
            self.client.send(message.encode('utf-8'))

    def start(self):
        threading.Thread(target=self.receive_messages).start()
        self.send_messages()

if __name__ == "__main__":
    chat_client = ChatClient()
    chat_client.start() 