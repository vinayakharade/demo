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


variable "project_id" {
  type        = string
  description = "The ID of the project where this VPC will be created"
}

variable "region"{
  type        = string
  description = "The region name"
}

variable "runtime"{
  type        = string
  description = "The runtime value"
}

variable "connector_name"{
  description = "The name of the connector"
  type        = string
}

variable "role"{
  description = "The role"
  type        = string
}

variable "member"{
  description = "The member name who has the particular role"
  type        = string
}

############################
###        FUNCTION      ###
############################

variable "function_name" {
  type        = string
  description = "A user-defined name of the function. Function names must be unique globally"
}

variable "function_description" {
  type        = string
  description = "Description of the function"
}

variable "function_memory" {
  type        = string
  default     = 128
  description = "Memory (in MB), available to the function. Allowed values are: 128MB, 256MB, 512MB, 1024MB, and 2048MB"
}

variable "function_timeout" {
  type        = string
  default     = 30
  description = "Timeout (in seconds) for the function. Default value is 60 seconds. Cannot be more than 540 seconds"
}

variable "function_entry_point" {
  type        = string
  description = "Name of a JavaScript function that will be executed when the Google Cloud Function is triggered"
}

# ############################
# ###        BUCKET        ###
# ############################

variable "bucket_name" {
  type        = string
  description = "The name of the containing bucket"
}

variable "object_name" {
  type        = string
  # default     = "XXXX"
  description = "The name of the object"
}
