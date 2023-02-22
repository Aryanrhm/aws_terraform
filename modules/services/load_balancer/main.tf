
data "aws_subnets" "sns" {
  filter {
    name   = "vpc-id"
    values = ["${var.vpc_id}"]
  }
}
 
data "aws_subnet" "sn" {
  for_each = toset(data.aws_subnets.sns.ids)
  id       = each.value
}

resource "aws_alb" "alb" {
  name            = "${var.cluster_name}-lb"
  security_groups = [ "${var.lb_sec_group_id}" ]
  subnets = [ for s in data.aws_subnet.sn : s.id ]
}