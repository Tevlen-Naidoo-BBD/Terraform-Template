resource "aws_db_subnet_group" "this" {
  count      = var.enabled ? 1 : 0
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "this" {
  count                     = var.enabled ? 1 : 0
  identifier                = "${var.project_name}-db"
  allocated_storage         = 20
  engine                    = "postgres"
  engine_version            = "15.4"
  instance_class            = "db.t3.micro"
  username                  = "postgres"
  password                  = var.db_password
  db_subnet_group_name      = aws_db_subnet_group.this[0].name
  vpc_security_group_ids    = var.vpc_security_group_ids
  skip_final_snapshot       = true
  publicly_accessible       = false
  storage_encrypted         = false
  apply_immediately         = true
  tags = {
    Name = "${var.project_name}-db"
  }
}
