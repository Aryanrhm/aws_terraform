
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



module "asg" {
  source        = "../modules/services/asg"
  cluster_name  = "staging-cluster"
  image_id    = "ami-0d5741cadff3501c9"
  instance_type = "t2.micro"
  tg_arn        = module.lb.target_g_arn
  az_list       = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  sec_group_id  = module.sec_group.sec_group_id
  k_name        = module.key_pairs.k_name

}