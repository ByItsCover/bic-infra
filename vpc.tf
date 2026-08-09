data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

<<<<<<< HEAD
data "aws_route_tables" "all_tables" {
  vpc_id = var.vpc_id
=======
data "aws_route_table" "all_tables" {
  for_each  = toset(data.aws_subnets.subnet.ids)
  subnet_id = each.value
>>>>>>> 45c9a0f641b7c10d7e73bd4fe8b6430fc06a74b5
}

# S3

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  route_table_ids = aws_route_tables.all_tables.ids
}
