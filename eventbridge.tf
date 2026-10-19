# =========================
# START EC2 - 9:00 AM IST
# =========================

resource "aws_cloudwatch_event_rule" "start_ec2" {

  name        = "start-ec2-daily"
  description = "Start EC2 instance every morning"

  schedule_expression = "cron(30 3 * * ? *)"
}


resource "aws_cloudwatch_event_target" "start_ec2" {

  rule = aws_cloudwatch_event_rule.start_ec2.name

  arn = aws_lambda_function.ec2_start_stop.arn

  input = jsonencode({
    action = "start"
  })
}


resource "aws_lambda_permission" "allow_eventbridge_start" {

  statement_id = "AllowEventBridgeStart"

  action = "lambda:InvokeFunction"

  function_name = aws_lambda_function.ec2_start_stop.function_name

  principal = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.start_ec2.arn
}


# =========================
# STOP EC2 - 8:00 PM IST
# =========================

resource "aws_cloudwatch_event_rule" "stop_ec2" {

  name        = "stop-ec2-daily"
  description = "Stop EC2 instance every evening"

  schedule_expression = "cron(30 14 * * ? *)"
}


resource "aws_cloudwatch_event_target" "stop_ec2" {

  rule = aws_cloudwatch_event_rule.stop_ec2.name

  arn = aws_lambda_function.ec2_start_stop.arn

  input = jsonencode({
    action = "stop"
  })
}


resource "aws_lambda_permission" "allow_eventbridge_stop" {

  statement_id = "AllowEventBridgeStop"

  action = "lambda:InvokeFunction"

  function_name = aws_lambda_function.ec2_start_stop.function_name

  principal = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.stop_ec2.arn
}