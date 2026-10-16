output "dynamodb_table_name" {
  value = aws_dynamodb_table.student.name
}

output "lambda_function_name" {
  value = aws_lambda_function.student_insert.function_name
}