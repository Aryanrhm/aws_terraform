resource "aws_iam_role_policy" "role_policy" {
  count    =  var.iam_role_policy ? 1 : 0
  name = "${var.name}-role-policy"
  role = "${aws_iam_role.iam_role.id}"

  policy = "${file("iam-role-policy.json")}"
}