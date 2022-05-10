project_id = "searce-academy" 
region     = "us-central1"


service_account_jenkins_apps = {
    service_account = "ac-main-jenkins-gce-sa"
    role_name       = "ac_main_jenkins_gce_role"
    permissions = [
        "iam.serviceAccounts.actAs",
        "iam.serviceAccounts.get",
        "iam.serviceAccounts.list",
        "logging.logEntries.create",
        "monitoring.metricDescriptors.create",
        "monitoring.metricDescriptors.get",
        "monitoring.metricDescriptors.list",
        "monitoring.monitoredResourceDescriptors.get",
        "monitoring.monitoredResourceDescriptors.list",
        "monitoring.timeSeries.create",
        "resourcemanager.projects.get",
    ]
    
}

service_account_accelerators_apps_gke = {
    service_account = "main-accelerators-apps-gke-sa"
    role_name       = "main_accelerators_apps_gke_role"
    permissions = [
        "logging.logEntries.create",
        "monitoring.metricDescriptors.create",
        "monitoring.metricDescriptors.get",
        "monitoring.metricDescriptors.list",
        "monitoring.monitoredResourceDescriptors.get",
        "monitoring.monitoredResourceDescriptors.list",
        "monitoring.timeSeries.create",
        "resourcemanager.projects.get",
        "storage.buckets.get",
        "storage.buckets.list",
        "storage.objects.create",
        "storage.objects.get",
        "storage.objects.getIamPolicy",
        "storage.objects.list",
        "storage.objects.setIamPolicy",
        "storage.objects.update",

    ]
}
