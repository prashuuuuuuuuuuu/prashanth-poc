output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.security_group_1.id
}
