from flask import Flask
import os
import socket

app = Flask(__name__)


@app.route("/")
def hello():
    hostname = socket.gethostname()
    return f"Hallo Welt! 🐳 Ich laufe auf: {hostname}"


if __name__ == "__main__":
    # 0.0.0.0 = auf allen Netzwerkschnittstellen lauschen (wichtig fuer Container spaeter)
    # Port 5000 = Standard-Flask-Port
    app.run(host="0.0.0.0", port=5000)
