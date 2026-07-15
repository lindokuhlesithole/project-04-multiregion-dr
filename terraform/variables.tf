variable "app_name" {
  description = "Application name"
  type        = string
}

variable "db_password" {
  description = "Not used for DynamoDB, kept for compatibility"
  type        = string
  default     = ""
}

variable "domain_name" {
  type    = string
  default = ""
}

variable "hosted_zone_id" {
  type    = string
  default = ""
}

variable "alert_email" {
  type    = string
  default = ""
}
