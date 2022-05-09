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

output "service_name" {
  value = google_cloud_run_service.cloudrun_app.name
  description = "Name of the Cloud Run service"
}

output "url" {
  value = google_cloud_run_service.cloudrun_app.status[0].url
  description = "URL at which the service is available."
}

output "region" {
  value = google_cloud_run_service.cloudrun_app.location
  description = "Region of the service"
}

output "project_id" {
  value = google_cloud_run_service.cloudrun_app.project
  description = "Cloud Run Project ID"
}




