resource "aws_security_group" "database" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "postgres-db"
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "mydb-subnet-group"
  subnet_ids = aws_subnet.private[*].id
}


resource "aws_db_instance" "postgres_db" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "11"
  instance_class         = "db.t3.micro"
  identifier             = "mydatabase"
  username               = "myadmin"
  skip_final_snapshot    = true
  password               = var.db_password
  parameter_group_name   = "default.postgres11"
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.database.id]
  
}

