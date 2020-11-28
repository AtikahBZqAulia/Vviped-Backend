# YOLO object detection
import cv2 as cv
import numpy as np
import time
from skimage import  io
from flask import Flask, jsonify, request

app = Flask(__name__)

# img = io.imread("https://i.pinimg.com/originals/c4/17/b1/c417b1bf0603fd89b5df09ef3c053537.jpg")
# img = io.imread("https://cdn.home-designing.com/wp-content/uploads/2015/09/clock-with-bent-hands-600x600.jpg")
# img = io.imread("https://cdn.vox-cdn.com/thumbor/MwokWf8IUu77WSTyqnrzfHfrWew=/0x146:2040x1214/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/19206380/akrales_190913_3666_0391.jpg")
img = io.imread("https://bicycledutch.files.wordpress.com/2013/04/willem-alexander_maxima_new-york.jpg")
img = cv.cvtColor(img, cv.COLOR_BGR2RGB)
# img = cv.resize(img, None, fx=0.4, fy=0.4)
cv.imshow('window',  img)
cv.waitKey(1)

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

# cv.imshow('blob', r)
text = f'Blob shape={blob.shape}'
# cv.displayOverlay('blob', text)
cv.waitKey(1)

net.setInput(blob)
t0 = time.time()
outputs = net.forward(ln)
t = time.time()
# print('time=', t-t0)

# print(len(outputs))
# for out in outputs:
#     print(out.shape)

def trackbar2(x):
    confidence = x/100
    r = r0.copy()
    for output in np.vstack(outputs):
        if output[4] > confidence:
            x, y, w, h = output[:4]
            p0 = int((x-w/2)*416), int((y-h/2)*416)
            p1 = int((x+w/2)*416), int((y+h/2)*416)
            cv.rectangle(r, p0, p1, 1, 1)
    cv.imshow('blob', r)
    text = f'Bbox confidence={confidence}'
    # cv.displayOverlay('blob', text)

r0 = blob[0, 0, :, :]
r = r0.copy()
# cv.imshow('blob', r)
# cv.createTrackbar('confidence', 'blob', 50, 101, trackbar2)
# trackbar2(50)

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

indices = cv.dnn.NMSBoxes(boxes, confidences, 0.5, 0.4)
if len(indices) > 0:
    for i in indices.flatten():
        (x, y) = (boxes[i][0], boxes[i][1])
        (w, h) = (boxes[i][2], boxes[i][3])
        color = [int(c) for c in colors[classIDs[i]]]
        cv.rectangle(img, (x, y), (x + w, y + h), color, 2)
        text = "{}: {:.4f}".format(classes[classIDs[i]], confidences[i])
        cv.putText(img, text, (x, y - 5), cv.FONT_HERSHEY_SIMPLEX, 0.5, color, 1)

cv.imshow('window', img)
cv.waitKey(0)

@app.route("/", methods=['GET'])
def home():
    return jsonify([{"objectName": i} for i in object_list])

if __name__ == '__main__':
    app.run(debug=True)