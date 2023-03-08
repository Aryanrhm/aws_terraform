output "snapshot_id" {
    value = aws_ebs_snapshot.sample_snapshot.id
    description = "ID of created snapshot"

}