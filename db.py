from pymongo import MongoClient
from bson.json_util import dumps
import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

client = MongoClient("mongodb+srv://vviped:mobcomp2020@clusterjakarta.xzmfh.mongodb.net/UserAuth?retryWrites=true&w=majority")
# db = client.test
db = client.get_database("UserAuth")
records = db.userAuth
a = records.count_documents({})

new_data = {"title":"Harvard Yard","author":"Atikah"}

all_data = records.find()

@app.route('/api/v1/post', methods=['GET'])
def api_all():
    return jsonify(dumps(all_data))

@app.route('/api/v1/add', methods=['GET', 'POST'])
def insert():
    return records.insert_one(new_data)

@app.route('/api/v1/delete', methods=['GET', 'DELETE'])
def delete():
    return records.delete_one({'image':"https://cdn.home-designing.com/wp-content/uploads/2015/09/clock-with-bent-hands-600x600.jpg"})

@app.route('/api/v1/search', methods=['GET'])
def search():
    query_parameters = request.args
    objectName = query_parameters.get('objectName')
    return jsonify(dumps(records.find({'object':objectName})))

app.run()
