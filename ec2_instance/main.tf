module "iam_role_create" {
  source       = "../modules/services/iam_role_create"
  cluster_name = "staging-cluster"

}

module "ec2_instance" {
  count = 3
  cluster_name  = "staging-cluster-${count.index}"
  source        = "../modules/services/ec2_instance"
  ami_id        = "ami-0c0d3776ef525d5dd"
  instance_type = "t2.micro"
  sg_ports      = [80, 22, 2049]
  eip           = false
  extra_ebs     = false
  ebs_size      = 2
  ebs_az        = "eu-central-1a"
  role_name     = module.iam_role_create.role_name
  depends_on = [
    module.iam_role_create
  ]
}


# module "efs" {
#   depends_on = [
#     module.ec2_instance
#   ]
#   cluster_name = "staging-cluster"
#   source       = "../modules/services/efs"

# }

# module "efs_mount" {
#   depends_on = [
#     module.efs, module.ec2_instance
#   ]
#   source           = "../modules/services/efs_mount"
#   efs_id           = module.efs.fs_id
#   efs_subnet_id    = module.ec2_instance.ec2_subnet_id
#   sg_id            = module.ec2_instance.sg_id
#   ec2_instance_key = module.ec2_instance.ec2_instance_key
#   ec2_instance_ip  = module.ec2_instance.ec2_instance_ip
# }
