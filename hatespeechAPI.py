from hatesonar import Sonar
import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

sonar = Sonar()
x = sonar.ping(text="At least I'm not a nigger")

@app.route('/results', methods=['GET'])
def home():
    return jsonify(x)
app.run()