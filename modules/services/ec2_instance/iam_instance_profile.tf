resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.cluster_name}-instance-profile"
  role = var.role_name

}


