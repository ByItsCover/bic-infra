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

# SQS

variable "sqs_visibility_timeout" {
  type        = number
  description = "SQS message timeout in seconds"
  default     = 180
}

variable "sqs_deadletter_retention" {
  type        = number
  description = "SQS deadletter queue message retention in seconds"
  default     = 345600
}

# Website

variable "domain_name" {
  type        = string
  description = "Domain name for site"
}

variable "password_req" {
  type = object({
    min_length  = number
    req_upper   = bool
    req_lower   = bool
    req_numbers = bool
    req_symbols = bool
  })
  description = "Requirements for site user passwords"
}

variable "email_req" {
  description = "Requirements for site user emails"
  type = object({
    max_length = number
    min_length = number
  })
  default = {
    max_length = 254
    min_length = 6
  }
}

# APIs

variable "hardcover_key_name" {
  type        = string
  description = "Name of the HardCover key secret"
  default     = "hardcover-key"
}

variable "hardcover_api_key" {
  type        = string
  description = "The HardCover API Key"
  sensitive   = true
}
