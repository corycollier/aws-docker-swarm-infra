# environments/production/networking/route_table_association.tf

resource "aws_route_table_association" "rta_subnet_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.rtb_public_subnet.id
}

resource "aws_route_table_association" "rta_subnet_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.rtb_public_subnet.id
}
