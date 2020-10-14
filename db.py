from pymongo import MongoClient
from bson.json_util import dumps
import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

books = [
    {'id': 0,
     'title': 'A Fire Upon the Deep',
     'author': 'Vernor Vinge',
     'first_sentence': 'The coldsleep itself was dreamless.',
     'year_published': '1992'},
    {'id': 1,
     'title': 'The Ones Who Walk Away From Omelas',
     'author': 'Ursula K. Le Guin',
     'first_sentence': 'With a clamor of bells that set the swallows soaring, the Festival of Summer came to the city Omelas, bright-towered by the sea.',
     'published': '1973'},
    {'id': 2,
     'title': 'Dhalgren',
     'author': 'Samuel R. Delany',
     'first_sentence': 'to wound the autumnal city.',
     'published': '1975'}
]

client = MongoClient("mongodb+srv://vviped:mobcomp2020@clusterjakarta.xzmfh.mongodb.net/UserAuth?retryWrites=true&w=majority")
# db = client.test
db = client.get_database("UserAuth")
records = db.userAuth
a = records.count_documents({})

new_data = {"title":"Harvard Yard","author":"Atikah"}


all_data = records.find()
# print(records.find_one_and_delete({"title": "La Casa De Papel"}))

# records.delete_one({'author': 'Dante'})

@app.route('/api/v1/post', methods=['GET'])
def api_all():
    return jsonify(dumps(all_data))

@app.route('/api/v1/add', methods=['GET', 'POST'])
def insert():
    return records.insert_one(new_data)

@app.route('/api/v1/delete', methods=['GET', 'DELETE'])
def delete():
    return records.delete_one({'username':"atikahbzqaulia"})

app.run()