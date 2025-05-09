resource "aws_db_instance" "postgres" {
  identifier             = "dotnet-postgres-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  name                   = "dotnetdb"
  username               = "admin"
  password               = var.db_password
  publicly_accessible    = false
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
  tags = {
    Name = "dotnet-postgres-db"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main-db-subnet-group"
  subnet_ids = aws_subnet.public[*].id
  tags = {
    Name = "main-db-subnet-group"
  }
}
