/******************************************
  Module for service_account_jenkins_apps
 *****************************************/
module "custom_role_jenkins_apps" {
  source                    = "../../../modules/iam/custom-role"
  project                   = var.project_id
  role_id                   = var.service_account_jenkins_apps["role_name"]
  permissions               = var.service_account_jenkins_apps["permissions"]
}

module "service_account_jenkins_apps" {
  source                = "../../../modules/iam/service-account-new"
  project_id            = var.project_id
  service_account_name  = var.service_account_jenkins_apps["service_account"]
}

module "member_roles_jenkins_apps" {
  source                      = "../../../modules/iam/member-iam"
  service_account_address     = module.service_account_jenkins_apps.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_jenkins_apps["role_name"]}"]
}

/******************************************
  Module for service_account_apps_gke
 *****************************************/

module "custom_role_accelerators_apps_gke" {
  source                    = "../../../modules/iam/custom-role"
  project                   = var.project_id
  role_id                   = var.service_account_accelerators_apps_gke["role_name"]
  permissions               = var.service_account_accelerators_apps_gke["permissions"]
}

module "service_account_accelerators_apps_gke" {
  source                = "../../../modules/iam/service-account-new"
  project_id            = var.project_id
  service_account_name  = var.service_account_accelerators_apps_gke["service_account"]
}

module "member_roles_accelerators_apps_gke" {
  source                      = "../../../modules/iam/member-iam"
  service_account_address     = module.service_account_accelerators_apps_gke.email
  project_id                  = var.project_id
  project_roles               = ["projects/${var.project_id}/roles/${var.service_account_accelerators_apps_gke["role_name"]}"]
}
