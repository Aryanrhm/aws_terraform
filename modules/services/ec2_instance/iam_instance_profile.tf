resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.name}-instance-profile"
  role = var.role_name
}


