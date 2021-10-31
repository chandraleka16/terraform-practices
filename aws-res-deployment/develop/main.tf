provider "aws" {
    access_key= var.aws_access_key
    secret_key=var.aws_secret_key
    region = "us-east-2"
}

module "my_vpc" {
    source = "../Modules/vpc"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
    vpc_id = module.my_vpc.vpc_id
    subnet_cidr = "192.168.1.0/24"
}

module "my_instance" {
    source = "../Modules/ec2"
    # ec2_count = 1
    ami_id = "ami-0e84e211558a022c0"
    #instance_type = "t2-micro"
    subnet_id = module.my_vpc.subnet_id
    
}