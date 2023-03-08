output "fs_id" {
  value = aws_efs_file_system.cluster-efs.id
  description = "The id of created File System"
}
