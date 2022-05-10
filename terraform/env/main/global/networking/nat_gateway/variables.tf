
/******************************************
  Nat gateway variables
 *****************************************/


variable "project_id" {
  type        = string
  description = "Project ID to create NAT"
}

variable "region" {
  type        = string
  description = "Region for NAT"
}

variable "vpc_name" {
  type        = string
  description = "The name of the network for which NAT gateway will be created"
}

variable "min_ports_per_vm" {
  type        = string
  default = "128"
}

variable "icmp_idle_timeout_sec" {
  type        = string
  default = "15"
}

variable "tcp_established_idle_timeout_sec" {
  type        = string
  default = "600"
}

variable "tcp_transitory_idle_timeout_sec" {
  type        = string
  default = "15"
}

variable "udp_idle_timeout_sec" {
  type        = string
  default = "15"
}
