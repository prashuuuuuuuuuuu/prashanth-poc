output "security_group_id" {
  description = "ID of the created security group"
  value       = aws_security_group.allow_all.id
}
