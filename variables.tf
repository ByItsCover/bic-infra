# General AWS

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

# S3

variable "site_bucket_name" {
  type        = string
  description = "AWS S3 BIC Site bucket name"
}

variable "site_bucket_index_doc" {
  type        = string
  description = "Index document file name within site S3 bucket"
  default     = "index.html"
}

variable "cover_bucket_name" {
  type        = string
  description = "AWS S3 Cover bucket name"
}

variable "cover_db_folder_name" {
  type        = string
  description = "AWS S3 Cover DB folder name"
}

# Website

variable "domain_name" {
  type        = string
  description = "Domain name for site"
}
