/******************************************
  Resource for External Static IPs
 *****************************************/
 
resource "google_compute_address" "address" {
  count  = 2
  name   = "${var.vpc_name}-natgw-cr-us-ctrl-${count.index}-ext-ip"
  region = var.region
}


/******************************************
  Module for NAT Gateway
 *****************************************/

module "cloud_nat" {
  source                             = "../../../modules/networking/nat-gateway"
  project_id                         = var.project_id
  region                             = var.region
  create_router                      = true
  router                             = "${var.vpc_name}-natgw-us-ctrl-01-cr"
  name                               = "${var.vpc_name}-natgw-us-ctrl-01-nat"
  network                            = "${var.vpc_name}"
  nat_ips                            = google_compute_address.address.*.self_link
  min_ports_per_vm                   = var.min_ports_per_vm 
  icmp_idle_timeout_sec              = var.icmp_idle_timeout_sec 
  tcp_established_idle_timeout_sec   = var.tcp_established_idle_timeout_sec 
  tcp_transitory_idle_timeout_sec    = var.tcp_transitory_idle_timeout_sec 
  udp_idle_timeout_sec               = var.udp_idle_timeout_sec 
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
