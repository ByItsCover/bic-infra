data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_route_table" "all_tables" {
  for_each = toset(data.aws_subnets.subnet.ids)
  subnet_id = each.value
}

# S3

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  route_table_ids = [distinct(data.aws_route_table.all_tables[*].id)]
}
