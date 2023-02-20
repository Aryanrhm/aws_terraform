resource "aws_placement_group" "plcmnt_grp_pg" {
  name     = "${var.cluster_name}-pg"
  strategy = var.pg-strategy
  spread_level = var.pg-spread_level
  tags = {
    "Created_By" = "Terraform"
  }
}  