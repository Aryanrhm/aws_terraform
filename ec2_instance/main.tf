module "iam_role_create" {
  source       = "../modules/services/iam_role_create"
  cluster_name = "staging-cluster"
}

module "sec_group" {
  source   = "../modules/services/sec_group"
  sg_name  = "staging-cluster-sg"
  sg_ports = [80, 22]

}


module "key_pairs" {
  source = "../modules/services/key_pairs"

}

module "lb_sec_group" {
  source   = "../modules/services/sec_group"
  sg_name  = "lb-sg"
  sg_ports = [80]

}
module "lb" {
  tg_port         = 80
  tg_protocol     = "HTTP"
  vpc_id          = module.lb_sec_group.sec_group_vpc_id
  lb_sec_group_id = module.lb_sec_group.sec_group_id
  cluster_name    = "staging-cluster"
  depends_on = [
    module.lb_sec_group
  ]
  source = "../modules/services/load_balancer"

}


module "ec2_instance" {
  count         = 3
  cluster_name  = "staging-cluster-${count.index}"
  source        = "../modules/services/ec2_instance"
  ami_id        = "ami-0c0d3776ef525d5dd"
  instance_type = "t2.micro"
  eip           = false
  extra_ebs     = false
  ebs_size      = 2
  sec_group_id  = module.sec_group.sec_group_id
  ebs_az        = "eu-central-1a"
  role_name     = module.iam_role_create.role_name
  k_name        = module.key_pairs.k_name
  tg_attach     = true
  tg_arn = module.lb.target_g_arn

  depends_on = [
    module.iam_role_create, module.sec_group, module.key_pairs
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
