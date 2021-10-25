variable "bucket_name" {
    default = "default"
}

variable "acl_name" {
    default = "private"
}

variable "tag_name" {
    default = "default"
}

variable "tag_environment" {
    default = "develop"
}

variable "force_destroy" {
    default = false
}

variable "versioning_enabled" {
    default = false
}

variable "bucket_prefix" {
  default     = null
}
variable "force_destroy" {
  default     = false
}

variable "acceleration_status" {
  default     = null
}

variable "region" {
  default     = null
}

variable "request_payer" {
  default     = null
}