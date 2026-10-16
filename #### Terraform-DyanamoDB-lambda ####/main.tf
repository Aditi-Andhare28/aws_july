resource "aws_dynamodb_table" "student" {
  name         = "student-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "student_id"
  attribute {
    name = "student_id"
    type = "S"
  }
}