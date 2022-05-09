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
    description = "Name of the Project ID"
    type = string
}

variable "region_name" {
    description = "Name of the Region for deployment"
    type= string    
}

variable "cloudrun_access" {
    default = "allUsers"
    type        = string
}

variable "cloudrun_service_config" {
     description = "Configurations for cloud run services"
}

variable "limits_cpu" {
    description = "Limits for CPU"
     default = "2000m" 
     type        = string
}

variable "limits_memory" {
    description = "Limits for Memory"
     default = "2048Mi"
     type        = string
}

variable "requests_cpu" {
    description = "Requests for CPU"
     default = "1000m"
     type        = string
}

variable "requests_memory" {
    description = "Requests for Memory"
     default = "1048Mi"
     type        = string
}

variable "member" {
    description = "The member name who has the particular role"
     default = "allUsers"
     type        = string
}

variable "container_port" {
    description = "Port number the container listens on. This must be a valid port number, 0 < x < 65536."
    default = "3000" 
    type        = string
}

/** Resources **/

variable "cpu_limits" {
    description = "The maximum amount of compute cpu limit allowed."
    default = "1000m" 
    type        = string
}

variable "memory_limits" {
    description = "The maximum amount of compute memory limit allowed."
    default = "128Mi" 
    type        = string
}

variable "cpu_requests" {
    description = "Minimum amount of compute cpu required"
    default = "100m" 
    type        = string
}

variable "memory_requests" {
    description = "Minimum amount of compute memory required"
    default = "128Mi" 
    type        = string
}

/** ENVIRONMENT VARIABLE **/

variable "env_name_1" {
    description = "DB_URL key environment variable for Cloud run"
    default = "DATABASE_URL" 
    type        = string
}

variable "env_name_2" {
    description = "DB_HOST key environment variable for Cloud run"
    default = "DATABASE_HOST" 
    type        = string
}

variable "env_name_3" {
    description = "DB_NAME key environment variable for Cloud run"
    default = "DB_NAME" 
    type        = string
}

/** DB VARIABLE **/

variable "database_host" {
    description = "DB_HOST value environment variable for Cloud run"
    default = "10.0.1.0" 
    type        = string
}

variable "database_user" {
    description = "DB_USER value environment variable for Cloud run"
    default = "test" 
    type        = string
}

variable "database_password" {
    description = "DB_PASSWORD value environment variable for Cloud run"
    default = "password" 
    type        = string
}

variable "database_port" {
    description = "DB_PORT value environment variable for Cloud run"
    default = "5432" 
    type        = string
}

variable "database_name" {
    description = "DB_NAME value environment variable for Cloud run"
    default = "test" 
    type        = string
}