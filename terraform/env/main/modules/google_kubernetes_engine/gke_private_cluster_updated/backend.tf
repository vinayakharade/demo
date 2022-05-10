terraform {
  backend "gcs" {
    bucket = "pilot-project_id-tfstate-region-gcs"
    prefix = "pilot/modules/google_kubernetes_engine/gke_private_cluster"
  }
}

