# PROVIDER AWS
provider "aws"{
    access_key= var.aws_access_key
    secret_key=var.aws_secret_key
    region=var.region
}

data "aws_availability_zones" "available"{}

# DATA AMI
data "aws_ami" "aws-linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "name"
        values = ["amzn-ami-hvm*"]

    }

    filter {
        name = "root-device-type"
        values =["ebs"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

# RESOURCES
# VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.network_address_space
    enable_dns_hostnames = "true"
}

# GATEWAY
resource "aws_internet_gateway" "igw" {
    vpc_id =aws_vpc.vpc.id

}

# SUBNET
resource "aws_subnet" "subnet1" {
    cidr_block = var.subnet1_address_space
    vpc_id =aws_vpc.vpc.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[0]
}


# ROUTE TABLE 
resource "aws_route_table" "rtb" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rta-subnet1" {
    subnet_id = aws_subnet.subnet1.id
    route_table_id = aws_route_table.rtb.id
}

# SECURITY GROUP
resource "aws_security_group" "nginx-sg" {
    name = "nginx-sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


}

# INSTANCE
resource "aws_instance" "nginx1" {
    ami = data.aws_ami.aws-linux.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet1.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    key_name = var.key_name

    connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file(var.private_key_path)
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install nginx -y",
            "sudo service nginx start",
            "echo '<html><head><title>Blue team server</title></head><body></body></html>'"
        ]
    }
}