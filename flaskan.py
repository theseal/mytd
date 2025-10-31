#!/usr/bin/env python3

from flask import request, Flask
from persistqueue import FIFOSQLiteQueue

app = Flask(__name__)
q = FIFOSQLiteQueue(path="/config/queue", multithreading=True, auto_commit=False)


@app.route("/enqueue", methods=["POST"])
def enqueue():
    content = request.json
    print(content["url"])
    q.put([content["url"]])
    return f"Enqueued {content['url']}"
