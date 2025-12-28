resource "azurerm_storage_account" "monitoring" {
  name                     = "kubernetesmonitoring"
  resource_group_name      = "infra"
  location                 = "West US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "kube_logs" {
  name                  = "logs"
  storage_account_name    = azurerm_storage_account.monitoring.name
  container_access_type = "container"
}

resource "azurerm_storage_container" "cnpg_backups" {
  name                  = "cnpg-backups"
  storage_account_name    = azurerm_storage_account.monitoring.name
  container_access_type = "container"
}
