resource "azurerm_kubernetes_cluster" "chatapp_cluster" {
  name                = "chatapp-uw2"
  location            = "West US 2"
  resource_group_name = "Infrastructure"
  dns_prefix          = "chatapp"

  default_node_pool {
    name       = "chatapp"
    vm_size    = "Standard_DA2_v2"
    auto_scaling_enabled = true
    min_count           = 1   
    max_count           = 1   
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
