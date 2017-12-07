variable "name"            { }
variable "vpc_cidr"        { }
variable "azs"             { }
variable "region"          { }
variable "private_subnets" { }
variable "public_subnets"  { }

module "vpc" {
  source = "./vpc"

  name = "vtrduque-${var.name}"
  cidr = "${var.vpc_cidr}"
}


module "public_subnet" {
  source = "./public_subnet"

  name   = "${var.name}-public"
  vpc_id = "${module.vpc.vpc_id}"
  cidrs  = "${var.public_subnets}"
  azs    = "${var.azs}"
}

# VPC
output "vpc_id"   { value = "${module.vpc.vpc_id}" }
output "vpc_cidr" { value = "${module.vpc.vpc_cidr}" }

# Subnets
output "public_subnet_ids"  { value = "${module.public_subnet.subnet_ids}" }
