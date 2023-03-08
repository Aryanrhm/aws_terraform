output "volume_id" {
  description = "ID of created ebs"
  value       = aws_ebs_volume.ebs_volume.id
}