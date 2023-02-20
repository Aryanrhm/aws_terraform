resource "aws_iam_instance_profile" "ec2_instance-profile" {
  name = "${var.cluster_name}-instance-profile"
  role = aws_iam_role.ec2_instance-role.name

}


