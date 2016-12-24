// module terraform_aws_private_subnet

// The subnet IDs of the created subnets.
output "private_subnet_ids" {
  value = "${aws_subnet.private_subnets.*.id}"
}

// The route table IDs for the created private subnets.
output "private_route_table_ids" {
  value = "${aws_route_table.private_route_tables.*.id}"
}

// The IDs of the created NAT gateways.
output "nat_gateway_ids" {
  value = "${aws_nat_gateway.nat_gws.*.id}"
}

// The public addresses of the NAT gateways.
output "nat_gateway_public_address" {
  value = "${aws_nat_gateway.nat_gws.*.public_ip}"
}

// The private addresses of the NAT gateways.
output "nat_gateway_private_address" {
  value = "${aws_nat_gateway.nat_gws.*.private_ip}"
}
