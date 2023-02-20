resource "aws_ebs_snapshot" "sample_snapshot" {
  volume_id = var.vol_id

  tags = {
    Created_By  = "Terraform"
  }
}