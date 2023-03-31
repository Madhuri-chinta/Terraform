resource "random_password" "sweety" {
  length           = 16
  special          = true
  override_special = "!#$%&"
}

resource "aws_db_instance" "sweetydb" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0.32"
  instance_class       = "db.t3.micro"
  username             = "madhuri"
  password             = "random_password.sweety.result"
  skip_final_snapshot  = true
}