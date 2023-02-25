output "target_g_arn" {
  value = aws_alb_target_group.target_group.arn
  description = "The arn of created Target Group"
}


output "loadbalancer_id" {
  value = aws_alb.alb.id
  description = "The ID of created Load Balancer"
}

