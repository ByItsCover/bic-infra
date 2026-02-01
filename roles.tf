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

# ECS

data "aws_iam_policy_document" "ecs_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_api_access_policy" {
  statement {
    actions = ["execute-api:Invoke"]

    resources = [
      "${aws_apigatewayv2_api.embed_api.execution_arn}/*",
    ]
  }
}

resource "aws_iam_role" "ecs_role" {
  name               = "ecs_role"
  assume_role_policy = data.aws_iam_policy_document.ecs_policy.json
}

resource "aws_iam_policy" "ecs_api_access_policy" {
  name   = "ecs_api_access_policy"
  role   = aws_iam_role.ecs_role.name
  policy = data.aws_iam_policy_document.ecs_api_access_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
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
