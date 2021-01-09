# YOLO object detection
import cv2 as cv
import numpy as np
# import time
from skimage import  io
from flask import Flask, jsonify, request
from google_trans_new import google_translator

app = Flask(__name__)

def detect_object(image):
    
    # img = io.imread("https://vviped.com/uploads/5f9e859b26b00.jpeg")
    img = io.imread(image)
    img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
    img = cv.resize(img, None, fx=0.4, fy=0.4)

    # Load names of classes and get random colors
    classes = open('coco.names').read().strip().split('\n')
    np.random.seed(42)
    colors = np.random.randint(0, 255, size=(len(classes), 3), dtype='uint8')

    # Give the configuration and weight files for the model and load the network.
    net = cv.dnn.readNetFromDarknet("yolov3-spp.cfg", "yolov3-spp.weights")
    net.setPreferableBackend(cv.dnn.DNN_BACKEND_OPENCV)
    # net.setPreferableTarget(cv.dnn.DNN_TARGET_CPU)


    # determine the output layer
    ln = net.getLayerNames()
    ln = [ln[i[0] - 1] for i in net.getUnconnectedOutLayers()]

    # construct a blob from the image
    blob = cv.dnn.blobFromImage(img, 1/255.0, (416, 416), swapRB=True, crop=False)
    r = blob[0, 0, :, :]

    # text = f'Blob shape={blob.shape}'
    # cv.waitKey(1)

    net.setInput(blob)
    # t0 = time.time()
    outputs = net.forward(ln)
    # t = time.time()

    r0 = blob[0, 0, :, :]
    r = r0.copy()

    boxes = []
    confidences = []
    classIDs = []
    h, w = img.shape[:2]

    for output in outputs:
        for detection in output:
            scores = detection[5:]
            classID = np.argmax(scores)
            confidence = scores[classID]
            if confidence > 0.5:
                box = detection[:4] * np.array([w, h, w, h])
                (centerX, centerY, width, height) = box.astype("int")
                x = int(centerX - (width / 2))
                y = int(centerY - (height / 2))
                box = [x, y, int(width), int(height)]
                boxes.append(box)
                confidences.append(float(confidence))
                classIDs.append(classID)
    object_id_list = np.unique(classIDs)
    print("Object ID list", object_id_list)
    object_list = []
    for i in object_id_list:
        object_list.append(classes[i])
    print("Object list", object_list)
    return object_list

@app.route("/", methods=['GET'])
def home():
    URL = "https://jakartaqurban.com/uploads/5f9e859b26b00.jpeg"
    object_list = detect_object(URL)

    return jsonify([{"object_name": i} for i in object_list])

@app.route("/detect", methods=['GET'])
def detect():
    query_parameters = request.args
    file_name = query_parameters.get('link')
    # object_list = detect_object("https://vviped.com/detect?link=https://vviped.com/" + str(file_name))
    # return jsonify([{"link": "https://vviped.com/detect?link=https://vviped.com/" + str(file_name), "object_name": i} for i in object_list])
    object_list = detect_object(file_name)
    translator = google_translator()
    return jsonify([{"link": file_name, "object_name": translator.translate(i,lang_tgt='id')} for i in object_list])


if __name__ == '__main__': 
    app.run(debug=True)