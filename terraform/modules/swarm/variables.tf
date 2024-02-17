# environments/production/servers/acm.tf

variable "vpc_id" {
  type = string
  nullable = false
}

variable "vpc_region" {
  type     = string
  default = "us-east-1"
}

variable "subnet_ids" {
  type = string
  nullable = false
}

variable "number_workers" {
  type = number
  default = 2
}

variable "domain_name" {
  type = string
  nullable = false
}

variable "swarm_name" {
  type = string
  nullable = false
}

variable "swarm_environment" {
  type     = string
  default = "production"
}

variable "aws_account_id" {
  type     = string
  nullable = false
}

variable "ec2_key_name" {
  type     = string
  nullable = false
}

variable "ec2_volume_size" {
  type = number
  default = 500
}

variable "ec2_instance_ami" {
  type    = string
  # the default ami is Verified Ubuntu Server 22.04 LTS (64bit x86)
  default = "ami-0c7217cdde317cfec"
}

variable "ec2_instance_type" {
  type    = string
  # The default ec2 instance type is the smallest c6a available.
  default = "c6a.large"
}
