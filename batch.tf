resource "aws_security_group" "batch" {

  name        = "batch_access_sg"
  description = "Batch Access Group"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"
    cidr_blocks = [
      data.aws_vpc.default.cidr_block
    ]
  }
}

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

data "aws_iam_policy_document" "ecs_instance_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_role"

  assume_role_policy = data.aws_iam_policy_document.ecs_instance_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.ecs_instance_role.name
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name = "ecs_instance_role"
  role = aws_iam_role.ecs_instance_role.name
}
