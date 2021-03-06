variable "aws_access_key" {
}
variable "aws_secret_key" {
}
variable "private_key_path" {
    default = "/Users/coda/Downloads/ac-new-key-pair.pem"
}
variable "key_name" {
    default = "ac-new-key-pair"
}
variable "region" {
    default= "us-east-2"
}

variable "network_address_space" {
    default = "10.1.0.0/16"
}
variable "subnet1_address_space" {
    default = "10.1.0.0/24"
}
