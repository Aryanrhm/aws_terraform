resource "aws_iam_role_policy" "ec2_instance-policy" {
  name = "${var.cluster_name}-role-policy"
  role = "${aws_iam_role.ec2_instance-role.id}"

  policy = "${file("iam-role-policy.json")}"
}