resource "aws_volume_attachment" "volume_attachment" {
  count    =  var.extra_ebs == true ? 1 : 0
  device_name = var.ebs_device_name
  volume_id   = module.ebs_volume[0].volume_id
  instance_id = aws_instance.ec2_instance.id
}
