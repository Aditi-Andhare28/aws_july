data "archive_file" "lambda_zip" {

  type        = "zip"
  source_file = "${path.module}/lambda/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}


resource "aws_lambda_function" "student_insert" {

  function_name = "student-dynamodb-insert"

  filename = data.archive_file.lambda_zip.output_path

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role = aws_iam_role.lambda_role.arn

  handler = "lambda_function.lambda_handler"

  runtime = "python3.13"
}