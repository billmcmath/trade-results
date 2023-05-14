import json
import boto3
from string import Template


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('expenses')


def postRequest(event, context):
    print(event['body'])
    return '123'
    data = json.loads(event['body'])
    item = data['name']
    amount = int(data['amount'])
    
    if amount == 0:
        table.delete_item(Key={'name': item})
        return {
            'statusCode': 200,
            'body': 'Expense deleted successfully'
        }
    
    response = table.get_item(Key={'name': item})
    
    if 'Item' in response:
        table.update_item(
            Key={'item': item},
            UpdateExpression='SET amount = :val1',
            ExpressionAttributeValues={':val1': amount}
        )
        return {
            'statusCode': 200,
            'body': 'Expense updated successfully'
        }
    else:
        table.put_item(Item={'name': item, 'amount': amount})
        return {
            'statusCode': 200,
            'body': 'Expense added successfully'
        }

def getRequest(event,context):
    data = {
        'test': 'This is the title'
    }

    with open('template.html', 'r') as f:
        src = Template(f.read())
        result = src.substitute(data)

    response = {
        "statusCode": 200,
        "headers": {
            'Content-Type': 'text/html',
        },
        "body": result
    }

    return response