terraform {
  backend "azurerm" {
      resource_group_name  = "Infrastructure"
      storage_account_name = "tfstatestoragewu2"
      container_name       = "tfstate"
      key                  = "aks/terraform.tfstate"
  }
}
