module "ebs_volume" {
  source = "../ebs_volume"
  count    =  var.extra_ebs == true ? 1 : 0
  ebs_size = var.ebs_size
  ebs_az = var.ebs_az
  }

module "eip" {
  source = "../eip"
  count    =  var.eip == true ? 1 : 0
  }


resource "aws_instance" "ec2_instance_server" {
  depends_on = [
    aws_security_group.ec2_instance-sg
  ]
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = aws_key_pair.my-key.key_name
  vpc_security_group_ids = ["${aws_security_group.ec2_instance-sg.id}"]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance-profile.name
  hibernation = var.hibernate ### The 4 following lines are needed to enable the hibernation in the instance.
  root_block_device {
    encrypted = var.root_block_encrypt
   }
  tags = {
    Created_By = "Terraform"
    Name       = "${var.cluster_name}-instance" # The name of instance is given like this. Why? I don't know either.
  }
  user_data = "${file("./user-data.sh")}"

}
  

