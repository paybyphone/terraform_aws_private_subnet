// vpc provides the VPC module.
module "vpc" {
  source                  = "github.com/paybyphone/terraform_aws_vpc?ref=v0.1.0"
  project_path            = "${var.project_path}"
  public_subnet_addresses = ["${var.public_network_addresses}"]
  vpc_network_address     = "${var.vpc_network_address}"
}

// private_subnets provides the private subnets for the VPC.
module "private_subnets" {
  source                            = "../"
  nat_gateway_count                 = "2"
  private_subnet_addresses          = ["10.0.0.128/26", "10.0.0.192/26"]
  private_subnet_availability_zones = "${values(module.vpc.public_subnet_availability_zones)}"
  project_path                      = "${var.project_path}"
  public_subnet_ids                 = "${keys(module.vpc.public_subnet_availability_zones)}"
  route53_domain_name               = "${var.route53_domain_name}"
  route53_zone_id                   = "${var.route53_zone_id}"
  vpc_id                            = "${module.vpc.vpc_id}"
}
