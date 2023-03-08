resource "aws_placement_group" "placement_group" {
  name     = "${var.name}-pg"
  strategy = var.strategy
  spread_level = var.spread_level
  tags = {
    "Created_By" = "Terraform"
  }
}  