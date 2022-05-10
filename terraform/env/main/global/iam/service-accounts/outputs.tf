# /************************************************************
#   Outputs of service_account and role binding for jenkins apps
#  ************************************************************/

output "custom_role_jenkins_apps_project_id" {
  value = module.custom_role_jenkins_apps.project
  description ="Project ID of Jenkins Apps Custom Role"
}

output "custom_role_jenkins_apps_name" {
  value = module.custom_role_jenkins_apps.role_name
  description ="Custom Role name used by Jenkins Apps"
}

output "jenkins_apps_email" {
  value = module.service_account_jenkins_apps.email
  description ="Service account emails of Jenkins Apps by name."
}

output "custom_role_accelerators_apps_gke_name" {
  value = module.custom_role_accelerators_apps_gke.role_name
}

output "apps_gke_email" {
  value = module.service_account_accelerators_apps_gke.email
}
