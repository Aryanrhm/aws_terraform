resource "aws_eip" "eip" {
  tags = {
    "Created_By" = "Terraform"
  }
}