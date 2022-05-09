/**
 * Copyright 2022 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
	Cloud Run Configuration 
 *****************************************/

resource "google_cloud_run_service" "cloudrun_app" {
  name     = var.cloudrun_service_config["service_name"]
  location = var.region_name
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.cloudrun_service_config["container_image"]
        resources {
          limits = {
            cpu    = "${var.cpu_limits}"
            memory = "${var.memory_limits}"
          }
          requests = {
            cpu    = "${var.cpu_requests}"
            memory = "${var.memory_requests}"
          }
        }
        env {
          name = var.env_name_1
           value = "postgresql://${var.database_user}:${var.database_password}@${var.database_host}:${var.database_port}/${var.database_name}"
        }
        env {
         name = var.env_name_2
          value = "${var.database_host}"
        }
        env {
         name = var.env_name_3
          value = "${var.database_name}"
        }
        ports {
        container_port = "${var.container_port}"
        }	
        command = [""]
        args    = [""]
      }
      container_concurrency = var.cloudrun_service_config["container_concurrency"]
      timeout_seconds       = var.cloudrun_service_config["timeout_seconds"]
      service_account_name  = var.cloudrun_service_config["service_account_name"]
    }
    metadata {
      annotations = {
        "autoscaling.knative.dev/maxScale"        = var.cloudrun_service_config["max_instances"],
        "run.googleapis.com/cloudsql-instances" = var.cloudrun_service_config["connection_name"],
        "run.googleapis.com/vpc-access-connector" = var.cloudrun_service_config["serverless_vpc_connector"]
      }
      labels = {
	      "name" = var.cloudrun_service_config["container_label"]
	    }
    }
  }
  metadata {
      labels = {
    	"name" = var.cloudrun_service_config["cloudrun_label"]
    }
  }
  traffic {
      percent         = var.cloudrun_service_config["traffic_percent"]
      latest_revision = true
  }
  
}

resource "google_cloud_run_service_iam_member" "member" {
  location = google_cloud_run_service.cloudrun_app.location
  project = google_cloud_run_service.cloudrun_app.project
  service = google_cloud_run_service.cloudrun_app.name
  role = "roles/run.invoker"
  member = var.member // access for all authenticated users "allUsers"
}
