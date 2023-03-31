resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$"
}

resource "aws_db_instance" "defaultdb" {
  allocated_storage   = 20
  db_name             = "MYRDS"
  engine              = "MySQL"
  engine_version      = "8.0.28"
  instance_class      = "db.t3.micro"
  identifier          = "terraform1234"
  password            = "random_password.password.result"
  username            = "madhuri"
  skip_final_snapshot = true
}