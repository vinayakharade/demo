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

output "load_balancer_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.default.address
}

output "backend_bucket_name" {
  description ="Name of the backend bucket name"
  value      = google_compute_backend_bucket.static.name
}

output "loadbbalancer_name" {
  description ="Name of load balancer"
  value = google_compute_url_map.urlmap.name
}