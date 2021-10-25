resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  acl    = var.acl_name
  bucket_prefix       = var.bucket_prefix
  force_destroy       = var.force_destroy
  acceleration_status = var.acceleration_status
  region              = var.region
  request_payer       = var.request_payer

  tags = {
    Name        = var.tag_name
    Environment = var.tag_environment
  }
}

