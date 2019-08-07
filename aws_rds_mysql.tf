resource "aws_db_instance" "rds" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "mydb"
  username          = "chris"
  password          = "Huslentuguldur2602
  db_subnet_group_name = "[${aws_subnet.private-a.id}]"
  vpc_security_group_ids = "[${aws_security_group.private.id}]"
}
