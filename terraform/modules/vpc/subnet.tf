# environments/production/networking/subnet.tf

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc_region}a"
  tags = {
    Name = "${var.vpc_name}_public_${var.vpc_region}a"
    Environment = "${var.vpc_environment}"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc_region}b"
  tags = {
     Name = "${var.vpc_name}_public_${var.vpc_region}b"
     Environment = "${var.vpc_environment}"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.128.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc_region}a"
  tags = {
    Name = "${var.vpc_name}_private_${var.vpc_region}a"
    Environment = "${var.vpc_environment}"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.144.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.vpc_region}b"
  tags = {
    Name = "${var.vpc_name}_private_${var.vpc_region}b"
    Environment = "${var.vpc_environment}"
  }
}
