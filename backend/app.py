from flask import Flask
import socket

app = Flask(__name__)


@app.route("/")
def hello():
    hostname = socket.gethostname()
    return f"Pizza-API laeuft! 🍕 Container: {hostname}"


if __name__ == "__main__":
    # Anderer Port als das Frontend (5000), damit beide parallel laufen koennen.
    app.run(host="0.0.0.0", port=6000)
