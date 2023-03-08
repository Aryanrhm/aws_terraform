
resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.cluster_name}-asg-instance"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [ "${var.sg_id}" ]
  lifecycle {
    create_before_destroy = var.create_before_destroy
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = var.name
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity = var.desired_capacity
  availability_zones = var.azs
  target_group_arns = [ "${var.tg_arns}" ]
  health_check_type = var.health_check_type
  force_delete              = var.force_delete
  termination_policies      = var.termination_policies
}
