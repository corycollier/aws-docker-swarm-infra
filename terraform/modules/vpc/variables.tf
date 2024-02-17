# environments/production/networking/variables.tf

variable "vpc_name" {
  type     = string
  nullable = false
}

variable "vpc_environment" {
  type     = string
  nullable = false
}

variable "vpc_region" {
  type     = string
  default = "us-east-1"
}
