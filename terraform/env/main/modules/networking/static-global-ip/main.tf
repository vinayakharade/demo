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
  Resource for Static external IP
 *****************************************/
resource "google_compute_global_address" "external_address" {
  project      = var.project_id
  name         = var.name
  network      = var.network
  address_type = var.address_type
  purpose      = var.purpose
  ip_version   = var.ip_version
  prefix_length= var.prefix_length
  description  = var.description
}




