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


output function_name{
  value= "${google_cloudfunctions_function.function.name}"
  description = "A user-defined name of the function. Function names must be unique globally"
}

output "url" {
  value       = "${google_cloudfunctions_function.function.https_trigger_url}"
  description = "URL which triggers function execution"
}

output "region" {
  value       = "${google_cloudfunctions_function.function.region}"
  description = "Region of function. Currently can be only `us-central1`"
}