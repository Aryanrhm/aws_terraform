module "ec2_instance" {
  count = 2
  cluster_name  = "staging-cluster-${count.index + 1}"
  source        = "../modules/services/ec2_instance"
  
  ami_id        = "ami-0c0d3776ef525d5dd"
  instance_type = "t2.micro"
  sg_ports      = [80, 22]
  eip           = false
  extra_ebs     = false
  ebs_size      = 2
  ebs_az        = "eu-central-1a"
}

