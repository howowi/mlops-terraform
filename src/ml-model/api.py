from score import *
from dataframelabelencoder import *
from flask import Flask, request

# Creation of the Flask app
app = Flask(__name__)

@app.route('/predict',methods=['POST', 'GET'])
def call_api(model=load_model()):
    data = request.get_json()
    prediction= predict(data,model)
    return prediction

@app.route('/health',methods=['POST', 'GET'])
def health_check():
    health = "healthy"
    print (health)
    return health

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)