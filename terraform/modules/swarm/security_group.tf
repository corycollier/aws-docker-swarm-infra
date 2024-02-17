
resource "aws_security_group" "ssh" {
  name        = "${var.swarm_name}-${var.swarm_environment}-ssh"
  vpc_id      = var.vpc_id
  description = "Allows SSH access externally to resources in the swarm"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  tags = {
    Name = "${var.swarm_name}-${var.swarm_environment}-ssh"
    Environment = var.swarm_environment
  }
}

resource "aws_security_group" "web" {
  name        = "${var.swarm_name}-${var.swarm_environment}-web"
  vpc_id      = var.vpc_id
  description = "Allows web access"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "443"
    protocol    = "tcp"
    self        = "false"
    to_port     = "443"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  tags = {
    Name = "${var.swarm_name}-${var.swarm_environment}-web"
    Environment = var.swarm_environment
  }
}

resource "aws_security_group" "internal" {
  name        = "${var.swarm_name}-${var.swarm_environment}-internal"
  vpc_id      = var.vpc_id
  description = "Allow all internal traffic for the swarm"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    description = "1a"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["10.0.16.0/20"]
    description = "1b"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  tags = {
    Name = "${var.swarm_name}-${var.swarm_environment}-internal"
    Environment = var.swarm_environment
  }
}
