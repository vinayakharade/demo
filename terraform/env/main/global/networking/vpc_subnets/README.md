# Subnetwork Module

This module makes it easy to create Network and Subnetwork for the GCP Network.

- Subnetwork (Subnets)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.7 |
| google | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.0 |


## Configure a Service Account

In order to execute this module you must have a Service Account with the
following project roles:

- [roles/compute.networkAdmin](https://cloud.google.com/nat/docs/using-nat#iam_permissions)

## Enable APIs

In order to operate with the Service Account you must activate the following APIs on the project where the Service Account was created:

- Compute Engine API - compute.googleapis.com


## Usage

Basic usage of this module is as follows:

* Subnetwork

```hcl
module "subnets" {
  source                  = "../../../modules/networking/subnets"
  project_id              = var.project_id
  network_name            = var.vpc_name  
  subnets                 = var.subnets
}
```

* Provide the variables values to the modules from terraform.tfvars file.

```hcl
/* GLOBAL */
project_id = "XXXX"
region     = "us-central1"
vpc_name   = "XXXX"
routing_mode = "XXXX"

/* Subnets */
subnets = [
  {
    subnet_name           = "XXXX"
    subnet_ip             = "X.X.X.X/X"
    subnet_region         = "XXXX"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  },
  {
    subnet_name           = "XXXX"
    subnet_ip             = "X.X.X.X/X"
    subnet_region         = "XXXX"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc\_name | The name of the network where subnets will be created | `string` | n/a | yes |
| project\_id | The ID of the project where subnet will be created | `string` | n/a | yes |
| subnets | The list of subnets being created | `list(map(string))` | n/a | yes |
| region | The Region to deploy subnet | `string` | n/a | yes | 


## Outputs

| Name | Description |
|------|-------------|
| subnets_names | The names of the subnets being created |
| subnets_ips | The IPs and CIDRs of the subnets being created |
| subnets_regions | The region where the subnets will be created |
| project | The ID of the project where this subnet will be created |


## Subnet Inputs

The subnets list contains maps, where each object represents a subnet. Each map has the following inputs (please see examples folder for additional references):

| Name                         | Description                                                                                                     |  Type  |         Default          | Required |
| ---------------------------- | --------------------------------------------------------------------------------------------------------------- | :----: | :----------------------: | :------: |
| subnet\_name                 | The list of subnets being created                                                                            | string |            -             |   yes    |
| subnet\_ip                   | The IP and CIDR range of the subnet being created                                                               | string |            -             |   yes    |
| subnet\_region               | The region where the subnet will be created                                                                     | string |            -             |   yes    |
| subnet\_private\_access      | Whether this subnet will have private Google access enabled                                                     | string |        `"false"`         |    no    |
| subnet\_flow\_logs           | Whether the subnet will record and send flow log data to logging                                                | string |        `"false"`         |    no    |


<br>

* Then perform the following commands in the directory:

   `terraform init` to get the plugins

   `terraform plan` to see the infrastructure plan

   `terraform apply` to apply the infrastructure build

   `terraform destroy` to destroy the built infrastructure
