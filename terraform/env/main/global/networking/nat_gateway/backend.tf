/******************************************
	GCS Bucket configuration for Terraform State management
 *****************************************/

terraform {
  backend "gcs" {
    bucket = "accelerators-us-central1"
    prefix = "gcp-deployment/terraform/env/main/global/networking/nat_gateway"
  }
}
