data "aws_subnets" "sns" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

data "aws_subnet" "sn" {
  for_each = toset(data.aws_subnets.sns.ids)
  id       = each.value
}

resource "aws_elasticache_subnet_group" "my_subnet_group" {
  name       = var.ec_subnet_group_name
  subnet_ids = [ for s in data.aws_subnet.sn : s.id ]
}

resource "aws_elasticache_cluster" "my_elasticache" {
  cluster_id = var.ec_engine
  engine                = var.ec_engine
  engine_version        = var.ec_version
  az_mode               = var.ec_az_mode
  node_type             = var.ec_node_type
  num_cache_nodes       = var.ec_nodes
  port                  = var.ec_port
  auto_minor_version_upgrade = var.ec_minor_upgrade
  subnet_group_name = aws_elasticache_subnet_group.my_subnet_group.name
  security_group_ids = [ "${var.ec_sec_group}" ]
 }