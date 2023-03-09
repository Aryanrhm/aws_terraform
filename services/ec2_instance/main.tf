module "ebs_volume" {
  source = "git::https://github.com/Aryanrhm/aws-terraform-modules.git//storages/ebs_volume/"
  count    =  var.extra_ebs == true ? 1 : 0
  ebs_size = var.ebs_size
  ebs_az = var.ebs_az
  }

module "eip" {
  source = "git::https://github.com/Aryanrhm/aws-terraform-modules.git//services/elastic_ip/"
  count    =  var.eip == true ? 1 : 0
  }


resource "aws_instance" "ec2_instance" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  vpc_security_group_ids = ["${var.sg_id}"]
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  hibernation = var.hibernate ### These 4 lines are needed to enable the hibernation in the instance.
  root_block_device {
    encrypted = var.root_block_encrypt
   }

  tags = {
    Created_By = "Terraform"
    Name       = "${var.name}-instance" # The name of instance is given like this.
  }
  user_data = "${file("./user-data.sh")}"
}
  

