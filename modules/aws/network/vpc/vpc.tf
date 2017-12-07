variable "name" { default = "vpc" }
variable "cidr" { }

resource "aws_vpc" "vpc" {
  cidr_block = "${var.cidr}"

  tags      { Name = "${var.name}" }
  lifecycle { create_before_destroy = true }
}

output "vpc_id"   { value = "${aws_vpc.vpc.id}" }
output "vpc_cidr" { value = "${aws_vpc.vpc.cidr_block}" }
