output "table_name" {
  description = "DynamoDB Table Name"
  value       = aws_dynamodb_table.main.name
}

output "table_arn" {
  description = "DynamoDB Table ARN"
  value       = aws_dynamodb_table.main.arn
}
