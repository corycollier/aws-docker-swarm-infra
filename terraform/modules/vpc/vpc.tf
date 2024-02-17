# environments/production/networking/vpc.tf

resource "aws_vpc" "main" {
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  tags = {
    Name = "${var.vpc_name}"
    Environment = "${var.vpc_environment}"
  }
}
