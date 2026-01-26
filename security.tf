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
