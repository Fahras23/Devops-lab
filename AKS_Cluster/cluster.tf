resource "azurerm_kubernetes_cluster" "chatapp_cluster" {
  name                = "chatapp-uw2"
  location            = "West US 2"
  resource_group_name = "Infrastructure"
  dns_prefix          = "chatapp"

  default_node_pool {
    name       = "chatapp"
    vm_size    = "Standard_B2ms"
    auto_scaling_enabled = true
    min_count           = 2   
    max_count           = 3   
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
