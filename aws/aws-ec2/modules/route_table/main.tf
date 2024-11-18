# Route Table
resource "aws_route_table" "main" {
  vpc_id = var.vpc_id
}

# Route to the Internet Gateway
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id            = var.ig_id
}

# Associate route table with subnet
resource "aws_route_table_association" "subnet_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.main.id
}
