data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_route_tables" "all_tables" {
  vpc_id = var.vpc_id
}

# S3

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  route_table_ids = data.aws_route_tables.all_tables.ids
}
