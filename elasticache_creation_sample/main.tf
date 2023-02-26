# create a new cluster
# disable the cluster mode
# name demo-redis
# locate on aws cloud
# Disable Multi-AZ
# ENable auto-failover
# default engine version and sg_ports and parameter groups
# node type cache.t2.micro
# number of replicas 0 (will disable the Multi-AZ)
# the my-first-subnet-group name for subnet group
# default vpc
# disable encryptions
# disable automatic backups
# enable auto upgrade minor versions



module "elasticache_sg" {
  source   = "../modules/services/sec_group"
  sg_name  = "elasticache-sg"
  sg_ports = [6379]
}


module "my_elasticache" {

  source           = "../modules/databases/elasticache"
  ec_engine        = "redis"
  ec_version       = "6.x"
  ec_az_mode       = "single-az"
  ec_node_type     = "cache.t2.micro"
  ec_nodes         = "1"
  ec_cluster_id = "demo-redis"
  ec_port          = 6379
  ec_sec_group     = module.elasticache_sg.sec_group_id
  ec_minor_upgrade = true
  vpc_id           = module.elasticache_sg.sec_group_vpc_id
  ec_subnet_group_name = "my-first-subnet-group"

}