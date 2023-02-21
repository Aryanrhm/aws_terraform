output "ec2_instance_id" {
  description = "ID of created instance"
  value       = aws_instance.ec2_instance_server.id
}

output "ec2_subnet_id" {
  description = "Subnet ID of created instance"
  value       = aws_instance.ec2_instance_server.subnet_id
}


output "sg_id" {
  description = "ID of created Security Group"
  value       = aws_security_group.ec2_instance-sg.id
}



output "ec2_instance_ip" {
  description = "IP of the created ec2 instance"
  value       = aws_instance.ec2_instance_server.public_ip
}


output "ec2_instance_key" {
  description = "ID of created Security Group"
  value       = tls_private_key.my-p-key.private_key_pem
}