output "pg_id" {
  description = "ID of created Placement Group"
  value       = aws_placement_group.plcmnt_grp_pg.id
}