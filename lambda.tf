resource "aws_lambda_function" "ec2_start_stop" {

  function_name = "ec2-start-stop"

  role = aws_iam_role.lambda_role.arn

  handler = "ec2_start_stop.lambda_handler"

  runtime = "python3.14"

  filename = "${path.module}/lambda/ec2_start_stop.zip"

  source_code_hash = filebase64sha256(
    "${path.module}/lambda/ec2_start_stop.zip"
  )

  environment {
    variables = {
      INSTANCE_ID = aws_instance.ec2.id
    }
  }
}