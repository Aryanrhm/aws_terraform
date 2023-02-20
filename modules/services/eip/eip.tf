resource "aws_eip" "assoc_eip_eip" {
  tags = {
    "Created_By" = "Terraform"
  }
}