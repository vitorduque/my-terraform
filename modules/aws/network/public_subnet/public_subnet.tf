variable "name"   { default = "public" }
variable "vpc_id" { }
variable "cidrs"  { }
variable "azs"    { }

resource "aws_internet_gateway" "public" {
  vpc_id = "${var.vpc_id}"

  tags { Name = "${var.name}" }
}

resource "aws_subnet" "public" {
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${element(split(",", var.cidrs), count.index)}"
  availability_zone = "${element(split(",", var.azs), count.index)}"
  count             = "${length(split(",", var.cidrs))}"

  tags      { Name = "${var.name}.${element(split(",", var.azs), count.index)}" }
  lifecycle { create_before_destroy = true }

  map_public_ip_on_launch = true
}

output "subnet_ids" { value = "${join(",", aws_subnet.public.*.id)}" }
