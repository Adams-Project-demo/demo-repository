"""
Simple AWS Lambda function using Python in a container.
"""

import json

def lambda_handler(event, context):
    """
    AWS Lambda function handler.
    """
    print("Hello World")

    name = event.get('name', 'World')

    response = {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        'body': json.dumps({
            'message': f'Hello {name}!',
            'event': event,
            'function_name': context.function_name if context else 'local'
        })
    }

    print(f"Response: {response}")
    return response


if __name__ == '__main__':
    test_event = {"name": "Python Lambda"}

    class MockContext:
        function_name = "hello-world-lambda"
    
    result = lambda_handler(test_event, MockContext())
    print("Local test result:")
    print(json.dumps(result, indent=2))
    