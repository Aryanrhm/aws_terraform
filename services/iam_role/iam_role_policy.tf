resource "aws_iam_role_policy" "role_policy" {
  name = "${var.name}-role-policy"
  role = "${aws_iam_role.iam_role.id}"

  policy = "${file("iam-role-policy.json")}"
}