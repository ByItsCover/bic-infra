aws_region = "us-east-2"

# S3
site_bucket_name     = "bic-site-bucket"
cover_bucket_name    = "covers-bucket"
cover_db_folder_name = "coverdb"
cover_dump_name      = "cover-dump"

# SQS

sqs_visibility_timeout   = 180
sqs_deadletter_retention = 604800 # 1 week

# Batch

learn_batch_name    = "learning"
listopia_batch_name = "listopia"

batch_envs = [
  {
    name             = "listopia"
    allocation_strat = "SPOT_CAPACITY_OPTIMIZED"
    instance_types   = ["default_x86_64"]
    compute_type     = "SPOT"
    image_id         = "/aws/service/ecs/optimized-ami/amazon-linux-2023/recommended/image_id"
  },
  {
    name             = "learning"
    allocation_strat = "SPOT_CAPACITY_OPTIMIZED"
    instance_types = [
      "g4dn.xlarge",
      "g6.xlarge",
      "g4dn.2xlarge",
      "optimal"
    ]
    compute_type = "SPOT"
    image_id     = "/aws/service/ecs/optimized-ami/amazon-linux-2023/gpu/recommended/image_id"
  }
]

# Website
domain_name = "by-its-cover.com"
password_req = {
  min_length  = 8
  req_upper   = true
  req_lower   = true
  req_numbers = true
  req_symbols = false
}
