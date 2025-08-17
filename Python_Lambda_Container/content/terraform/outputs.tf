output "lambda_function_name" {
  description = "The name of the deployed Lambda function"
  value = aws_lambda_function.hello_world.function_name
}

output "lambda_function_arn" {
  description = "The ARN of the deployed Lambda function"
  value = aws_lambda_function.hello_world.arn
}

output "lambda_function_url" {
  description = "The URL of the deployed Lambda function"
  value = aws_lambda_function_url.hello_world_url.function_url
}

output "lambda_role_arn" {
  description = "The ARN of the IAM role associated with the Lambda function"
  value = aws_iam_role.lambda_role.arn
}

output "cloudwatch_log_group_name" {
  description = "The name of the CloudWatch log group for the Lambda function"
  value = aws_cloudwatch_log_group.lambda_logs.name
}