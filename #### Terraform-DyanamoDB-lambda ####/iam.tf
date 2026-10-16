resource "aws_iam_role" "lambda_role" {

  name = "lambda-dynamodb-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_role_policy" "lambda_dynamodb_policy" {

  name = "lambda-dynamodb-policy"

  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "dynamodb:PutItem"


        ]

        Resource = aws_dynamodb_table.student.arn
      }
    ]
  })
}