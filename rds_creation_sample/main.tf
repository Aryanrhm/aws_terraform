
# mysql 8.0.28
# availability and durability = single db instance
# identifier = database-1
# instance config = burstable class (db.t2.micro)
# storage type = gp2
# allocate storage 5g
# enable storage auto scaling 
# maximum storage threshold = 20 GB
# connectivity = dont connect to an ec2 instance
# do not specify a subnet group and vpc
# enable public access 
# create a security group
# databes authentication = password authentication define a password
# disable monitroing 
# db name = mydb
# enable automated backup
# backup retention period 7 days
# do not export audit log
# enable deletion protection

module "sec_group" {
  source   = "../modules/services/sec_group"
  sg_name  = "staging-cluster-sg"
  sg_ports = [3306]

}


module "rds" {
  source            = "../modules/databases/rds"
  db_identifier     = "database-1"
  db_instance_class = "db.t2.micro"
  db_storage        = 5
  db_engine         = "mysql"
  db_engine_version = "8.0.28"
  db_password = var.db_password # Will define it as the environment variable (export TF_VAR_db_password="")
  db_user_name = var.db_user_name # Will define it as the environment variable (export TF_VAR_user_name="")
  db_storage_type     = "gp2"
  db_sec_group = module.sec_group.sec_group_id
  db_max_storage      = 20
  database_name       = "mydb"
  db_retention_period = 7
  db_public_access    = true

}