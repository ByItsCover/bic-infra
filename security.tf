resource "aws_security_group" "batch" {

  name        = "batch_access_sg"
  description = "Batch Access Group"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}
