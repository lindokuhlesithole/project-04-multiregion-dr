variable "app_name" {
  description = "Application name"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (2 AZs)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets (2 AZs)"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
