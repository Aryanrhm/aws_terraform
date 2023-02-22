output "role_name" {
  value = aws_iam_role.ec2_instance-role.name
  description = "The name of created iam role"
}