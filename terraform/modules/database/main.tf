# DynamoDB Table (Pay-per-request = Free Tier friendly)
resource "aws_dynamodb_table" "main" {
  name         = "${var.app_name}-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "${var.app_name}-table"
  }
}
