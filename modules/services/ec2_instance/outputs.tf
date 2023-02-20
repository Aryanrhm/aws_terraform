output "ec2_instance_id" {
  description = "ID of created instance"
  value       = aws_instance.ec2_instance_server.id
}