resource "azurerm_kubernetes_cluster" "chatapp_cluster" {
  name                = "chat-uw2"
  location            = "West US 2"
  resource_group_name = "Infrastructure"
  dns_prefix          = "chat"
  
  default_node_pool {
    name       = "chatapp"
    vm_size    = "Standard_D2s_v4"
    auto_scaling_enabled = true
    min_count           = 1 
    max_count           = 1
    node_count          = 1
    temporary_name_for_rotation = "maintenance"   
    vnet_subnet_id = azurerm_virtual_network.chat-vnet.subnet.subnet1.id
    pod_subnet_id = azurerm_virtual_network.chat-vnet.subnet.subnet2.id
  }
  
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Testing"
  }
}
