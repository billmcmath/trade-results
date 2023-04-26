import json
import boto3


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('expenses')


def postRequest(event, context):
    body = {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "input": event['body']
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response

def getRequest(event,context):
    body = {
        "message": "Go Serverless v1.0! Your function executed successfully!",
        "input": "get method"
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response