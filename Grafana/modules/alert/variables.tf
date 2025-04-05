variable "folder_name" {
  type      = string
}

variable "alert_name" {
  type      = string
}

variable "grafana_url_module" {
  type      = string
  sensitive = true
}

variable "grafana_auth_module" {
  type      = string
  sensitive = true
}