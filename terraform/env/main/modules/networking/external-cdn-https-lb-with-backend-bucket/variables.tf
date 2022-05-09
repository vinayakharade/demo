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

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------
variable "enable_ssl" {
  description = "Set to true to enable ssl. If set to 'true', you will also have to provide 'var.ssl_certificates'."
  type        = bool
  default     = false
}

variable "create_dns_entries" {
  description = "If set to true, create a DNS A Record in Cloud DNS for each domain specified in 'custom_domain_names'."
  type        = bool
  default     = false
}

variable "custom_domain_names" {
  description = "List of custom domain names."
  type        = list(string)
  default     = []
}

variable "dns_managed_zone_name" {
  description = "The name of the Cloud DNS Managed Zone in which to create the DNS A Records specified in 'var.custom_domain_names'. Only used if 'var.create_dns_entries' is true."
  type        = string
  default     = "replace-me"
}

variable "dns_record_ttl" {
  description = "The time-to-live for the site A records (seconds)"
  type        = number
  default     = 300
}

variable "custom_labels" {
  description = "A map of custom labels to apply to the resources. The key is the label name and the value is the label value."
  type        = map(string)
  default     = {}
}

variable "static_ip"{
  type        = string
  description = "Name of the external-ip. the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])?"
}

variable "lb_name"{
  type        = string
  description = "Load Balabcer Name"
}

variable "ssl_cert_name"{
  type        = string
  default     = "(Optional) Creates a unique name beginning with the specified prefix."
  description = "SSL certificate name"
}

variable "hosts"{
  type       = list(string)
  description = "Domains for which a managed SSL certificate will be valid."
}

variable "port_range"{
  type       = number
  default    = 443
  description = "HTTPS Port number"
}


/** Backend Bucket Configuration **/

variable "backend_bucket_name"{
  type        = string
  description = "Backend bucket service name"
}

variable "bucket_name"{
  type        = string
  description = "Cloud Storage bucket name"
}

variable "enable_cdn"{
  type        = string
  default     = true
  description = "Set to true to enable cdn on backend." 
}

variable "cache_mode"{
  type        =string
  description ="Specifies the cache setting for all responses from this backend. The possible values are: USE_ORIGIN_HEADERS, FORCE_CACHE_ALL and CACHE_ALL_STATIC Possible values are USE_ORIGIN_HEADERS, FORCE_CACHE_ALL, and CACHE_ALL_STATIC"
}

variable "client_ttl"{
  type        = number
  default     = 3600
  description ="Specifies the maximum allowed TTL for cached content served by this origin."
}

variable "default_ttl"{
  type        = number
  default     = 3600
  description ="Specifies the default TTL for cached content served by this origin for responses that do not have an existing valid TTL (max-age or s-max-age)"
}

variable "max_ttl"{
  type        = number
  default     = 86400
  description ="Specifies the maximum allowed TTL for cached content served by this origin."
}

variable "negative_caching"{
  type        = bool
  default     = true
  description ="Sets a cache TTL for the specified HTTP status code. negativeCaching must be enabled to configure negativeCachingPolicy. Omitting the policy and leaving negativeCaching enabled will use Cloud CDN's default cache TTLs."
}

variable "serve_while_stale"{
  type        = number
  default     = 86400
  description ="Serve existing content from the cache (if available) when revalidating content with the origin, or when an error is encountered when refreshing the cache."
}

