variable "ec2_count" {
    default= "1"
}

variable "ami_id" {}

variable "instance_type" {
    default= "t2.micro"
}

variable "subnet_id" {}


variable "tenancy" {
    default = "default"
}

variable "vpc_sg_ids" {
    default = []
}

variable "source_dest_check" {
    default = true
}

variable "user_data" {
    default = null
}

variable "ebs_optimized" {
    default = false
}

variable "hibernation" {
    default = false
}

variable "disable_api_termination" {
    default = false
}

variable "monitoring" {
    default = false
}

variable "key_pair_name" {
    default = null
}

variable "placement_group" {
    default = null
}

variable "host_id" {
    default = null
}

variable "root_ebs_delete_on_termination" {
    default = true
}

variable "root_ebs_encrypted" {
    default = true
}

variable "root_ebs_type" {
    default = "gp2"
}

variable "root_ebs_size" {
    default = 10
}

variable "root_ebs_iops" {
    default = 100
}

variable "ec2_name" {
    default = "default"
}

