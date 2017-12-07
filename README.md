# my-terraform
Launch some resources in some cloud :D

## Structure
```
.
├── empty.tf
├── modules
│   └── aws
│       └── network
│           ├── network.tf
│           ├── public_subnet
│           │   └── public_subnet.tf
│           └── vpc
│               └── vpc.tf
└── providers
    └── aws
        ├── global
        └── us-east-1
            ├── prod
            │   ├── terraform.tfvars
            │   └── us_east_1_prod.tf
            └── staging
```
