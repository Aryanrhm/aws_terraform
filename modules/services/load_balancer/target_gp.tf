resource "aws_alb_target_group" "target_group" {
  name = "${var.cluster_name}-tg"
  protocol = var.tg_protocol
  port = var.tg_port
  vpc_id = var.vpc_id
  # stickiness {
  #   type = "lb_cookie"
  # }
#   # Alter the destination of the health check to be the login page.
#   health_check {
#     path = "/login"
#     port = 80
#   }
 }