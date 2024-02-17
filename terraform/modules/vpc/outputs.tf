# environments/production/networking/outputs.tf

output "vpc_id" {
  value = aws_vpc.main.id
}

outputs "subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]
}
