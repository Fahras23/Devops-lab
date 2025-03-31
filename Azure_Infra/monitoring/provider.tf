terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.4.0"
    }
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

}