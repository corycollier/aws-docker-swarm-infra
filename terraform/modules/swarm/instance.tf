# environments/production/servers/instance.tf

locals {
  availability_zones = [
    "${var.vpc_region}a",
    "${var.vpc_region}b"
  ]
}

################################################################################
resource "aws_instance" "swarm_manager" {
  availability_zone           = local.availability_zones[0]
  subnet_id                   = var.subnet_ids[0]
  key_name                    = var.ec2_key_name
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  iam_instance_profile        = "${var.swarm_name}-ec2-instance-role"
  associate_public_ip_address = "true"
  ebs_optimized               = "true"

  vpc_security_group_ids = [
    aws_security_group.web.id,
    aws_security_group.internal.id,
    aws_security_group.ssh.id
  ]

  ebs_block_device {
    volume_size           = var.ec2_volume_size
    device_name           = "/dev/sdb"
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    throughput            = "125"
    volume_type           = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "required"
    instance_metadata_tags      = "enabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "50"
    volume_type           = "gp3"
  }

  tags = {
    Environment = var.swarm_environment
    Swarm       = var.value.swarm
    Name        = "${var.swarm_environment}-manager.${var.domain_name}"
  }
}


################################################################################
resource "aws_instance" "swarm_node" {
  count = var.number_workers
  # subnet_id                   = element(var.subnet_ids, random(length(var.subnet_ids)))
  # availability_zone           = element(local.availability_zones, random(length(local.availability_zones)))

  availability_zone           = local.availability_zones[1]
  subnet_id                   = var.subnet_ids[1]
  key_name                    = var.ec2_key_name
  ami                         = var.ec2_instance_ami
  instance_type               = var.ec2_instance_type
  iam_instance_profile        = "${var.swarm_name}-ec2-instance-role"
  associate_public_ip_address = "true"
  ebs_optimized               = "true"

  vpc_security_group_ids = [
    aws_security_group.internal.id
  ]

  ebs_block_device {
    volume_size           = var.ec2_volume_size
    delete_on_termination = "true"
    device_name           = "/dev/sdb"
    encrypted             = "true"
    iops                  = "3000"
    throughput            = "125"
    volume_type           = "gp3"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "required"
    instance_metadata_tags      = "enabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_aaaa_record = "false"
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = "true"
    encrypted             = "true"
    iops                  = "3000"
    throughput            = "125"
    volume_size           = "50"
    volume_type           = "gp3"
  }

  tags = {
    Environment = var.swarm_environment
    Swarm       = var.swarm_name
    Name        = "${var.swarm_environment}-worker-${count.index + 1}.${var.domain_name}"
  }
}
