
/******************************************
  Cloud NAT gateway details
 *****************************************/

output "cloud_nat_name" {
  value       = module.cloud_nat
  description = "Name of the Cloud NAT"
}

output "region" {
  value       = module.cloud_nat.region 
  description = "Region for NAT. Currently can be only `us-central1`"
}

output "project" {
  value       = module.cloud_nat.project
  description = "Project ID to create NAT"
}
