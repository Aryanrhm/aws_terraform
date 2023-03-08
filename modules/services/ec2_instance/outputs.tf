output "ec2_instance_id" {
  description = "ID of created instance"
  value       = aws_instance.ec2_instance.id
}

output "ec2_subnet_id" {
  description = "Subnet ID of created instance"
  value       = aws_instance.ec2_instance.subnet_id
}

output "ec2_instance_ip" {
  description = "IP of the created ec2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

