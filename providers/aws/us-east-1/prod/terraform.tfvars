# General
name            = "prod"
region          = "us-east-1"

# Network
vpc_cidr        = "10.0.0.0/16"
azs             = "us-east-1a,us-east-1c,us-east-1e"
private_subnets = "10.0.1.0/24,10.0.3.0/24,10.0.5.0/24"
public_subnets  = "10.0.2.0/24,10.0.4.0/24,10.0.6.0/24"
