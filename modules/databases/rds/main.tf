

resource "aws_db_instance" "my_db_instance" {
  identifier              = var.db_identifier
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_storage
  engine                  = var.db_engine
  engine_version          = var.db_engine_version
  password                = var.db_password
  username = var.db_user_name
  storage_type            = var.db_storage_type
  max_allocated_storage   = var.db_max_storage
  db_name                 = var.database_name
  vpc_security_group_ids = ["${var.db_sec_group}"]
  apply_immediately       = true
  backup_retention_period = var.db_retention_period
  publicly_accessible     = var.db_public_access
  skip_final_snapshot     = true
}