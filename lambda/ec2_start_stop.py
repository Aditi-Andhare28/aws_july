import boto3
import os

ec2 = boto3.client("ec2")

INSTANCE_ID = os.environ["INSTANCE_ID"]


def lambda_handler(event, context):

    action = event.get("action", "start")

    if action == "start":

        response = ec2.start_instances(
            InstanceIds=[INSTANCE_ID]
        )

        return {
            "statusCode": 200,
            "message": "EC2 instance started",
            "response": response
        }

    elif action == "stop":

        response = ec2.stop_instances(
            InstanceIds=[INSTANCE_ID]
        )

        return {
            "statusCode": 200,
            "message": "EC2 instance stopped",
            "response": response
        }

    else:

        return {
            "statusCode": 400,
            "message": "Invalid action"
        }