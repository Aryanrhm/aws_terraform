output "id" {
    value = aws_security_group.ec2_instance-sg.id
    description = "The ID of created security group"
  
}

output "vpc_id" {
    value = aws_security_group.ec2_instance-sg.vpc_id
    description = "The VPC ID which the sg is created in"
  
}
