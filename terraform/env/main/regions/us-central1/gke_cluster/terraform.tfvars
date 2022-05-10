# Global
project ="searce-academy"
region ="us-central1"

zones=[]
regional                       = "true" # a regional or a zonal cluster

# Network
network                        = "accelerators-vpc" #vpc-name
subnetwork                     = "main-accelerators-pvt-us-ct1-subnet" #subnet-name
gke_cluster_pod_range_name     = "main-accelerators-gke-pod-range"
gke_cluster_svc_range_name     = "main-accelerators-gke-svc-range"
master_ipv4_cidr_block         = "10.1.32.0/28" //modify accordingly

# cluster configurations
gke_cluster_master_version="1.21.10-gke.2000"
gke_cluster_min_master_version="1.21.10-gke.2000"

#Labels
gce_labels = {
    project       = "searce-academy"
    env           = "main"
    region        = "us-central1"
}

#Service_account
service_account = "main-accelerators-apps-gke-sa@searce-academy.iam.gserviceaccount.com"


##################################################
# Node Pool Configuration for NodePool-1 #
##################################################

image_type="COS"
machine_type="n2-standard-4"
preemptible="false"
auto_upgrade="false"
auto_repair="true"
node_count=1
enable_autoscaling="true"
min_node_count=1
max_node_count=1
disk_size_gb = 30
disk_type = "pd-standard"
kubernetes_labels_1 = {
    project = "searce-academy"
    env = "main"
    node_group = "node-pool-01"
}
