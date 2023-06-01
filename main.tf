module "vpc"{

source = "git::https://dheerajthuniki@bitbucket.org/devopsnew123/devops.git//vpc"

my_vpc_cidr = var.my_vpc_cidr

my_vpc_tag = var.my_vpc_tag

public_subnet1_cidr = var.public_subnet1_cidr

public_subnet1_az = "ap-northeast-1a"

public_subnet1_tag = var.public_subnet1_tag

vpc_id = "${module.vpc.vpc_id}"

subnet_id = "${module.vpc.subnet_id}"

route_table_id = "${module.vpc.route_table_id}"

}

module "instances"{

source = "git::https://dheerajthuniki@bitbucket.org/devopsnew123/devops.git//ec2"

ami = "ami-0ed99df77a82560e6"

instance_type = "t2.medium"

instance_name = "master"

key_pair = "tokyo"

instance2_type = "t2.micro"

instance2_name = "worker"

subnet_id = "${module.vpc.subnet_id}"

vpc_id = "${module.vpc.vpc_id}"

}
