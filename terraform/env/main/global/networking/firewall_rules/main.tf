/******************************************
  Module for Google IAP Firewall Rule
 *****************************************/

module "iap_ssh_fw_rule" {
  source = "../../../modules/networking/firewall_rules"

  network       = var.vpc_name
  name          = var.iap_ssh_fw_rule
  protocol      = "tcp"
  ports         = ["22","3389"]
  source_ranges = ["35.235.240.0/20"] 
  source_tags   = []
  target_tags   = ["allow-iap"] 
}


/******************************************
  Module for Google LB Healthcheck access
 *****************************************/

module "lb_hc_fw_rule" {
  source = "../../../modules/networking/firewall_rules"
  
  network                   = var.vpc_name
  name                      = var.lb_hc_fw_rule
  protocol                  = "tcp"
  ports                     = ["80","443"]
  source_ranges             = ["209.85.204.0/22","209.85.152.0/22","130.211.0.0/22","35.191.0.0/16"] 
  source_tags               = []
  target_tags               = ["allow-hc-access"]
}

/*******************************
  Resource for Default deny rule
 *******************************/

resource "google_compute_firewall" "deny_all" {
  name     = var.deny_all_rule
  network  = var.vpc_name
  disabled = false
  direction = "EGRESS"
  deny {
    protocol = "all"
  }
  priority      = "64000"
}
