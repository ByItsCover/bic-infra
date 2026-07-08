aws_region = "us-east-2"

# S3
site_bucket_name     = "bic-site-bucket"
cover_bucket_name    = "covers-bucket"
cover_db_folder_name = "coverdb"

# SQS

sqs_visibility_timeout   = 180
sqs_deadletter_retention = 604800 # 1 week

# Website
domain_name = "by-its-cover.com"
password_req = {
  min_length  = 8
  req_upper   = true
  req_lower   = true
  req_numbers = true
  req_symbols = false
}
