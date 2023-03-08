resource "aws_volume_attachment" "ebs_att" {
  count    =  var.extra_ebs == true ? 1 : 0
  device_name = "/dev/sdh"
  volume_id   = module.ebs_volume[0].ebs_volume_id
  instance_id = aws_instance.ec2_instance.id
}
