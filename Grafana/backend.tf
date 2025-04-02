terraform {
  backend "azurerm" {
      resource_group_name  = "Infrastructure"
      storage_account_name = "tfstoragebucket"
      container_name       = "tfstate"
      key                  = "grafana/terraform.tfstate"
  }
}
