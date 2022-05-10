output "iap_ssh_fw_rule" {
  value       = module.iap_ssh_fw_rule
  description = "Firewall rule name for IAP SSH"
}

output "lb_hc_fw_rule" {
  value       = module.lb_hc_fw_rule
  description = "Firewall Rule Name for Load Balancer Health Check"
}

output "deny_all" {
  value       = google_compute_firewall.deny_all
  description = "Firewall Rule Name for Deny All Rule"
}
