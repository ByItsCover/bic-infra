# General AWS

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

# S3

variable "s3_bucket_name" {
  type        = string
  description = "AWS S3 bucket name"
}

variable "db_folder_name" {
  type        = string
  description = "AWS S3 db folder name"
}
