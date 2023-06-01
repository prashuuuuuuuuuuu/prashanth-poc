resource "aws_instance" "master" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}

resource "aws_instance" "worker_1" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}

resource "aws_instance" "worker_2" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_group_ids = var.security_group_id
}
