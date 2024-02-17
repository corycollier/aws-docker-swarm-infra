# environments/production/networking/igw.tf

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.vpc_name}_igw"
    Environment = "${var.vpc_environment}"
  }
}
