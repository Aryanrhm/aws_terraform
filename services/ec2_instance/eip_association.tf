resource "aws_eip_association" "eip_association" {
  count    =  var.eip == true ? 1 : 0
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = module.eip[0].id

}
