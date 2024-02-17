# environments/production/networking/route_table.tf
#
resource "aws_route_table" "rtb_private_1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}_rtb_private_1"
    Environment = "${var.vpc_environment}"
  }
}

resource "aws_route_table" "rtb_private_2" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.vpc_name}_rtb_private_2"
    Environment = "${var.vpc_environment}"
  }
}

resource "aws_route_table" "rtb_public_gateway" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.vpc_name}_rtb_public_gateway"
    Environment = "${var.vpc_environment}"
  }
}

resource "aws_route_table" "rtb_public_subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name        = "${var.vpc_name}_rtb_public_subnet"
    Environment = "${var.vpc_environment}"
  }
}
