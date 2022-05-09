
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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A HTTP LOAD BALANCER
# This module deploys a HTTP(S) Cloud Load Balancer
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# ------------------------------------------------------------------------------
# CREATE A PUBLIC IP ADDRESS
# ------------------------------------------------------------------------------

resource "google_compute_global_address" "default" {
  project      = var.project
  name         = var.static_ip
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}


# ------------------------------------------------------------------------------
# GOOGLE MANAGE SSL CERTIFICATE
# ------------------------------------------------------------------------------

resource "google_compute_managed_ssl_certificate" "default" {
  name = var.ssl_cert_name

  managed {
    domains = var.hosts
  }
}


resource "google_compute_target_https_proxy" "default" {
  count   = var.enable_ssl ? 1 : 0
  name    = "${var.name}-https-proxy"
  url_map    = google_compute_url_map.urlmap.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.default.id]
}

# ------------------------------------------------------------------------------
# CREATE THE URL MAP TO MAP PATHS TO BACKENDS
# ------------------------------------------------------------------------------

resource "google_compute_url_map" "urlmap" {
  name= var.lb_name
  description = "a url map for lb"
  default_service = google_compute_backend_bucket.static.self_link

host_rule {
    hosts        = var.hosts
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_bucket.static.self_link

    path_rule {
      paths   = ["/*"]
      service = google_compute_backend_bucket.static.self_link
    }
  }

}

# ------------------------------------------------------------------------------
# CREATE THE BACKEND FOR THE STORAGE BUCKET
# ------------------------------------------------------------------------------

resource "google_compute_backend_bucket" "static" {
  project = var.project
  name= var.backend_bucket_name

  bucket_name=var.bucket_name
  enable_cdn  = var.enable_cdn
  cdn_policy {
    cache_mode        = var.cache_mode 
    client_ttl        = var.client_ttl 
    default_ttl       = var.default_ttl
    max_ttl           = var.max_ttl
    negative_caching  = var.negative_caching
    serve_while_stale = var.serve_while_stale 
  }
}

# ------------------------------------------------------------------------------
# IF SSL ENABLED, CREATE FORWARDING RULE AND PROXY
# ------------------------------------------------------------------------------

resource "google_compute_global_forwarding_rule" "https" {
  provider   = google-beta
  project    = var.project
  count      = var.enable_ssl ? 1 : 0
  name       = "${var.name}-https-forwarding-rule"
  target     = google_compute_target_https_proxy.default[0].self_link
  ip_address = google_compute_global_address.default.address
  port_range = var.port_range
  depends_on = [google_compute_global_address.default]
  labels = var.custom_labels
}



 


