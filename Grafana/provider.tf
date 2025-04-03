terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.4.0"
    }
    grafana = {
      source = "grafana/grafana"
      version = ">= 3.20.0"
    }
    required_version = "~> 1.2"
  }
}

provider "azurerm" {
  features {}
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth
}