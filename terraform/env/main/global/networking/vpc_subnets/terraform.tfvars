/* GLOBAL */
project_id = "searce-academy"
region     = "us-central1"
vpc_name   = "accelerators-vpc"
routing_mode = "GLOBAL"

/* Subnets */
subnets = [
  {
    subnet_name           = "main-accelerators-pvt-us-ct1-subnet"
    subnet_ip             = "10.1.0.0/20"
    subnet_region         = "us-central1"
    subnet_private_access = "true"
    subnet_flow_logs      = "false"
  }
]

secondary_ip_ranges = {
    "main-accelerators-pvt-us-ct1-subnet" = [
      {
        range_name    = "main-accelerators-gke-pod-range"
        ip_cidr_range = "10.1.64.0/18"
      },
      {
        range_name    = "main-accelerators-gke-svc-range"
        ip_cidr_range = "10.1.16.0/20"
      }
    ]
  }
