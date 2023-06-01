resource "aws_instance" "master" {
  instance1_name = "master"
  ami           = var.ami
  key           = "tokyo"
  instance1_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}

resource "aws_instance" "worker_1" {
  instance2_name = "worker_1"
  ami           = var.ami
  key           = "tokyo"
  instance2_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}

resource "aws_instance" "worker_2" {
  instance3_nmae = "worker_2"
  ami           = var.ami
   key           = "tokyo"
  instance3_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}
