output "primary_alb_dns" {
  description = "Primary ALB DNS Name (us-east-1)"
  value       = module.primary_compute.alb_dns_name
}

output "secondary_alb_dns" {
  description = "Secondary ALB DNS Name (eu-north-1, Pilot Light)"
  value       = module.secondary_compute.alb_dns_name
}

output "primary_vpc_id" {
  value = module.primary_network.vpc_id
}

output "secondary_vpc_id" {
  value = module.secondary_network.vpc_id
}

output "dynamodb_table_primary" {
  value = module.primary_database.table_name
}

output "dynamodb_table_secondary" {
  value = module.secondary_database.table_name
}
