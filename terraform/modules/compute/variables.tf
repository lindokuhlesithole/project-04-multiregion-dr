variable "app_name" {
  description = "Application name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "instance_count" {
  description = "Number of EC2 instances (0 for pilot light)"
  type        = number
  default     = 0
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = ""
}

variable "user_data" {
  description = "User data script"
  type        = string
  default     = ""
}
