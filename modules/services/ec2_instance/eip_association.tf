resource "aws_eip_association" "eip_assoc" {
  count    =  var.eip == true ? 1 : 0
  instance_id   = aws_instance.ec2_instance_server.id
  allocation_id = module.eip[0].eip_id

}
