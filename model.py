class User:
    def __init__(self, name, password):
        self.name = name
        self.password = password
    
class Message:
    def __init__(self, sender, receiver, content):
        self.sender = sender
        self.receiver = receiver
        self.content = content