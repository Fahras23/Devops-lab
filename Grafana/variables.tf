variable "folder_name" {
  type      = string
}

variable "alert_name" {
  type      = string
}

variable "grafana_url" {
  type      = string
  sensitive = true
}

variable "grafana_auth" {
  type      = string
  sensitive = true
}