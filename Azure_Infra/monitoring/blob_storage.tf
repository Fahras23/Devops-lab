resource "azurerm_storage_account" "monitoring" {
  name                     = "kubernetes"
  resource_group_name      = "MC_Infrastructure_chatapp-uw2_westus2"
  location                 = "West US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "kube_logs" {
  name                  = "kube-logs"
  storage_account_name    = "MC_Infrastructure_chatapp-uw2_westus2"
  container_access_type = "private"
}