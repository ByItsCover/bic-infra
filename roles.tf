# S3 Site

data "aws_iam_policy_document" "s3_full_access_policy" {
  statement {
    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.site_bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
  }
}

resource "aws_s3_bucket_policy" "s3_allow_full_access_policy" {
  bucket = aws_s3_bucket.site_bucket.id
  policy = data.aws_iam_policy_document.s3_full_access_policy.json

  depends_on = [
    aws_s3_bucket_public_access_block.site_bucket
  ]
}

# SQS

data "aws_iam_policy_document" "sqs_message_policy" {
  statement {
    actions = ["sqs:SendMessage"]

    resources = [aws_sqs_queue.embed_queue.arn]
  }
}

# Lambda

data "aws_iam_policy_document" "lambda_function_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_function_role" {
  name = "lambda_function_role"

  assume_role_policy = data.aws_iam_policy_document.lambda_function_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_function_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_function_role.name
}

resource "aws_iam_role_policy" "lambda_sqs_message_policy" {
  name   = "lambda_sqs_message_policy"
  role   = aws_iam_role.lambda_function_role.name
  policy = data.aws_iam_policy_document.sqs_message_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_sqs_execute_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
  role       = aws_iam_role.lambda_function_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_s3_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.lambda_function_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_secrets_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSSecretsManagerClientReadOnlyAccess"
  role       = aws_iam_role.lambda_function_role.name
}

# Batch

data "aws_iam_policy_document" "batch_service_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["batch.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "batch_service_role" {
  name = "batch_service_role"

  assume_role_policy = data.aws_iam_policy_document.batch_service_policy.json
}

resource "aws_iam_role_policy_attachment" "batch_service_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
  role       = aws_iam_role.batch_service_role.name
}

# Scheduler

data "aws_iam_policy_document" "scheduler_policy" {
  statement {
    actions = [
      "batch:SubmitJob",
      "batch:DescribeJobs",
      "batch:TerminateJob"
    ]

    resources = [aws_sqs_queue.embed_queue.arn]
  }
}

resource "aws_iam_role" "scheduler_role" {
  name = "scheduler_role"

  assume_role_policy = data.aws_iam_policy_document.scheduler_policy.json
}

# ECS

data "aws_iam_policy_document" "ecs_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com", "ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_role" {
  name               = "ecs_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_policy.json
}

resource "aws_iam_role_policy" "ecs_sqs_message_policy" {
  name   = "ecs_sqs_policy"
  role   = aws_iam_role.ecs_role.name
  policy = data.aws_iam_policy_document.sqs_message_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  role       = aws_iam_role.ecs_role.name
}

resource "aws_iam_role_policy_attachment" "ecs_secrets_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AWSSecretsManagerClientReadOnlyAccess"
  role       = aws_iam_role.ecs_role.name
}

resource "aws_iam_role_policy_attachment" "ecs_ssm_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.ecs_role.name
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = "ecs_instance_role"
  role = aws_iam_role.ecs_role.name
}
