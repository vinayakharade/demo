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


#Cloud function creation

resource "google_cloudfunctions_function" "function" {
  project               = "${var.project_id}"
  region                = "${var.region}"
  name                  = "${var.function_name}"
  description           = "${var.function_description}"
  available_memory_mb   = "${var.function_memory}"
  source_archive_bucket = "${var.bucket_name}"
  source_archive_object = "${var.object_name}"
  trigger_http          = true
  timeout               = "${var.function_timeout}"
  entry_point           = "${var.function_entry_point}"
  runtime               = "${var.runtime}"
}


# IAM entry for all users to invoke the function

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project               = google_cloudfunctions_function.function.project
  region                = google_cloudfunctions_function.function.region
  cloud_function        = google_cloudfunctions_function.function.name

  role   = var.role   
  member = var.member  
}
