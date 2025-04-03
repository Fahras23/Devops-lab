terraform {
  required_providers {
    grafana = {
      source = "grafana/grafana"
      version = ">= 2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "grafana" {
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