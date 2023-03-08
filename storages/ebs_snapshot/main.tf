resource "aws_ebs_snapshot" "ebs_snapshot" {
  volume_id = var.volume_id
  tags = {
    Created_By  = "Terraform"
  }
}