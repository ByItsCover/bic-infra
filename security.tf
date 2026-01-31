# RDS

resource "aws_security_group" "rds" {
  name        = "rds_access_sg"
  description = "RDS Access Group"
  vpc_id      = data.aws_vpc.default.id
}

resource "aws_vpc_security_group_egress_rule" "rds_egress" {
  security_group_id = aws_security_group.rds.id

  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "rds_ingress" {
  security_group_id = aws_security_group.rds.id

  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.batch.id
}

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
