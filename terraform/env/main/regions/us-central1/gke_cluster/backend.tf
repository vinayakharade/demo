/******************************************
	GCS Bucket configuration for Terraform State management
 *****************************************/

 
terraform {
  backend "gcs" {
    bucket = "accelerators-us-central1"
    prefix = "gcp-deployment/terraform/env/main/regions/us-central1/gke_cluster"
  }
}
