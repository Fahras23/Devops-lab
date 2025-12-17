terraform {
  backend "azurerm" {
      resource_group_name  = "infra"
      storage_account_name = "infrastrg"
      container_name       = "tfstate"
      key                  = "aks/terraform.tfstate"
  }
}