
resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "${var.cluster_name}-asg-instance-"
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.k_name
  security_groups = [ "${var.sec_group_id}" ]
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "terraform-asg-example"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  max_size             = 2
  desired_capacity = 1
  availability_zones = [ "eu-central-1c","eu-central-1a","eu-central-1b" ]
  target_group_arns = [ "${var.tg_arn}" ]
  health_check_type = "ELB"
# force_delete deletes the Auto Scaling Group without waiting for all instances in the pool to terminate
  force_delete              = true
# Defining the termination policy where the oldest instance will be replaced first 
  termination_policies      = ["OldestInstance"]
}

