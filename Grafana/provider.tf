terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.4.0"
    }
    grafana = {
      source = "grafana/grafana"
      version = "3.20.0"
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