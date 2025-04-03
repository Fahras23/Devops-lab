provider "grafana" {
  alias = "module"
  url  = var.grafana_url
  auth = var.grafana_auth
}

variable "grafana_url" {
  type      = string
  sensitive = true
}

variable "grafana_auth" {
  type      = string
  sensitive = true
}