resource "aws_db_instance" "rds" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  name              = "mydb"
  username          = "chris"
  password          = "Huslentuguldur2602
  db_subnet_group_name = "[${file(aws_subnet.private-a)}]"
  security_group_names = "[${file(aws_security_group.private)}]"


}
