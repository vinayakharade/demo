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

output "address" {
  value       = google_compute_global_address.google-managed-services-range.address
  description = "First IP of the reserved range."
}

output "google_compute_global_address_name" {
  value       = google_compute_global_address.google-managed-services-range.name
  description = "URL of the reserved range."
}

output "peering_completed" {
  value       = null_resource.dependency_setter.id
  description = "Use for enforce ordering between resource creation"
}

output "google_service_networking_connection" {
  value = google_service_networking_connection.private_service_access
  description = ""
}
