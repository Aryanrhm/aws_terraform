resource "aws_lb_target_group_attachment" "tg_attachment" {
  count = var.tg_attach ? 1 : 0 
  target_group_arn = var.tg_arn
  target_id        = aws_instance.ec2_instance.id
  port  = var.tg_port
}