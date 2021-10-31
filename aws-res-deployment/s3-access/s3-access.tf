provider "aws" {
    access_key= var.aws_access_key
    secret_key=var.aws_secret_key
    region = var.region
}

module "my_s3_bucket" {
    source = "../Modules/s3"
    bucket_name = "terraform-sample-bucket"
    acl_name = "public"
    tag_name = "terraform-sample-bucket"
    tag_environment = "develop"

}
