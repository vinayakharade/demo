/******************************************
  service_account variables
 *****************************************/

variable "project_id" {
  description = "The GCP project ID"
  type = string
}

variable "region" {
  description = "The GCP region of the deployment."
  type = string
}

variable "service_account_jenkins_apps" {
  description = "service Account to add the IAM policies/bindings for Jenkins Apps"
}

variable "service_account_accelerators_apps_gke" {
  description = "service Account to add the IAM policies/bindings for GKE cluster"
}
