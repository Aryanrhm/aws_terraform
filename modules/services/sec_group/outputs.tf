output "sec_group_id" {
    value = aws_security_group.ec2_instance-sg.id
    description = "The ID of created security group"
  
}