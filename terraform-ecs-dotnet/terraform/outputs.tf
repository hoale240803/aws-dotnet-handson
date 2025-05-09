output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.app_alb.dns_name
}

output "rds_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.postgres.endpoint
}
