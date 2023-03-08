resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = var.ebs_az
  size              = var.ebs_size
  tags = {
    Created_By = "Terraform"
  }
}