/******************************************
  firewall variables
 *****************************************/

variable "project_id" {
  description = "Project ID to create firewall-rule"
  type        = string
}

variable "vpc_name" {
  description = "The name of the network for which Firewall rules will be created"
  type        = string
}

variable "region" {
  type        = string
  description = "Region for FW"
}

variable "deny_all_rule"{
  description = "Firewall Rule Name for Deny All Rule"
  type        = string
}
variable "lb_hc_fw_rule"{
  description = "Firewall Rule Name for Load Balancer Health Check"
  type        = string
}
variable "iap_ssh_fw_rule"{
  description = "Firewall rule name for IAP SSH"
  type        = string
}

