variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "tenancy" {
    default = "dedicated"
}


variable "vpc_id" {
    
}

variable "enable_dns_hostnames" {
  default     = false
}

variable "default_vpc_enable_dns_support" {
  default     = true
}

variable "enable_classiclink" {
  default     = null
}

variable "enable_classiclink_dns_support" {
  default     = null
}

variable "enable_ipv6" {
  default     = false
}



variable "subnet_cidr" {
    default = "10.0.1.0/20"
}

variable "vpc_name" {
    default = "default"
}

variable "subnet_name" {
    default = "default"
}

