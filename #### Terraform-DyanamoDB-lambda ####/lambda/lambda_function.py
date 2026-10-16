import boto3

dynamodb = boto3.resource("dynamodb")

table = dynamodb.Table("student-table")


def lambda_handler(event, context):

    table.put_item(
        Item={
            "student_id": "S101",
            "name": "Aditi",
            "course": "MCA"
        }
    )

    return {
        "statusCode": 200,
        "body": "Data inserted successfully"
    }