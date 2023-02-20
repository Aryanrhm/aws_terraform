output "eip_id" {
  description = "ID of created eip"
  value       = aws_eip.assoc_eip_eip.id
}