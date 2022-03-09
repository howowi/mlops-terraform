import io
import json
import logging
import requests
import oci
from fdk import response


def handler(ctx, data: io.BytesIO = None):
    logging.getLogger().info("ML Model Testing Started")
    
    try:
        # Load json input
        body = json.loads(data.getvalue())
        api_url = body.get("url")
        bucket_name = body.get("bucket")
        object_name = body.get("object")

        # Get data from Object Storage
        json_data = get_object(bucket_name, object_name)
        
        # Send POST request to model API
        resp = requests.post(api_url, json=json_data)
        logging.getLogger().info("POST request header: " + str(resp.headers))

        # Check prediction
        result_json = json.loads(resp.content)
        predict_result= str(result_json.get("prediction"))
        #logging.getLogger().info("Prediction result is: " + predict_result)

        if resp.status_code == 200:
            logging.getLogger().info(api_url + "API is working")

            if "true" in object_name:
                if predict_result == "[1]":
                    logging.getLogger().info("Application Accepted for dataset from: " + object_name)
                    logging.getLogger().info("Prediction is accurate using dataset from: " + object_name)
                    result = 'true'
                else:
                    logging.getLogger().info("Application Rejected for dataset from: " + object_name)
                    logging.getLogger().info("Prediction is NOT accurate using dataset from: " + object_name)
                    result = 'false'
            elif "false" in object_name:
                if predict_result == "[0]":
                    logging.getLogger().info("Application Rejected for dataset from: " + object_name)
                    logging.getLogger().info("Prediction is accurate using dataset from: " + object_name)
                    result = 'true'
                else:
                    logging.getLogger().info("Application Accepted for dataset from: " + object_name)
                    logging.getLogger().info("Prediction is NOT accurate using dataset from: " + object_name)
                    result = 'false'
            else:
                logging.getLogger().info("No expected result from object name")
                if predict_result == "[0]":
                    logging.getLogger().info("Application Rejected for dataset from: " + object_name)
                    result = 'true'
                else:
                    logging.getLogger().info("Application Accepted for dataset from: " + object_name)
                    result = 'false'
        else:
            logging.getLogger().info(api_url + " API is not working")
            result = 'false'

    except requests.exceptions.ConnectionError:
        logging.getLogger().info("Connection Error")
        result = 'false'
    return result.encode()

def get_object(bucket_name, object_name):
    signer = oci.auth.signers.get_resource_principals_signer()
    object_storage_client = oci.object_storage.ObjectStorageClient(config={},signer=signer)
    namespace = object_storage_client.get_namespace().data
    try:
        logging.getLogger().info("Get object from object storage")
        object = object_storage_client.get_object(namespace, bucket_name, object_name)
    except Exception as e:
        logging.getLogger().info("Error in getting object: " + str(e))
    return object.data.text



