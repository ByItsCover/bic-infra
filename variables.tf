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

# Batch

variable "max_batch_vcpus" {
  type        = number
  description = "Maximum EC2 VCPUs a Batch job can use"
  default     = 64
}

variable "batch_ebs_size" {
  type        = number
  description = "EBS Volume size for Batch"
  default     = 50
}

variable "learn_batch_name" {
  type        = string
  description = "Batch env name for Learn batch job and queue"
  default     = "learning"
}

variable "batch_envs" {
  type = list(
    object({
      name             = string
      allocation_strat = string
      instance_types   = list(string)
      compute_type     = string
      image_id         = string
    })
  )
  description = "List of Batch compute environment configurations"
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
    min_length = number
    max_length = number
  })
  default = {
    min_length = 6
    max_length = 254
  }
}

variable "uid_req" {
  description = "Requirements for site user id"
  type = object({
    min_length = number
    max_length = number

  })
  default = {
    min_length = 36
    max_length = 36
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
