resource "aws_iam_instance_profile" "ec2_instance-profile" {
  name = "${var.cluster_name}-instance-pro"
  role = var.role_name

}


