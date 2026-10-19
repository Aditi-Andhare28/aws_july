
########3 actual code of iam role

resource "aws_iam_role" "lambda_role" {

  name = "ec2-start-stop-lambda-role"

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

######### this is json policy attach to iam role

resource "aws_iam_role_policy" "lambda_ec2_policy" {

  name = "ec2-start-stop-policy"

  role = aws_iam_role.lambda_role.id

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances"
        ]

        Resource = "*"
      }
    ]
  })
}