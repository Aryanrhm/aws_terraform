#Create efs
resource "aws_efs_file_system" "efs_file_system" {
  creation_token = "${var.name}-efs"
  throughput_mode = var.throughput_mode
  performance_mode = var.performance_mode
  tags = {
    Created_By = "Terraform"
  }
}