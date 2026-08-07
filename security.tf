# Batch

resource "aws_security_group" "batch" {
  name        = "batch_access_sg"
  description = "Batch Access Group"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_egress_rule" "batch_egress" {
  security_group_id = aws_security_group.batch.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

# Lambda

resource "aws_security_group" "lambda" {
  name        = "lambda_access_sg"
  description = "Lambda Access Group"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_egress_rule" "lambda_egress" {
  security_group_id = aws_security_group.lambda.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

# Rec Model EFS

resource "aws_security_group" "rec_efs" {
  name        = "rec_efs_access_sg"
  description = "Rec Model EFS Access Group"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_egress_rule" "rec_efs_egress" {
  security_group_id = aws_security_group.rec_efs.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "rec_efs_batch_ingress" {
  security_group_id = aws_security_group.rec_efs.id

  ip_protocol                  = "tcp"
  from_port                    = 2049
  to_port                      = 2049
  referenced_security_group_id = aws_security_group.batch.id
}

resource "aws_vpc_security_group_ingress_rule" "rec_efs_lambda_ingress" {
  security_group_id = aws_security_group.rec_efs.id

  ip_protocol                  = "tcp"
  from_port                    = 2049
  to_port                      = 2049
  referenced_security_group_id = aws_security_group.lambda.id
}
