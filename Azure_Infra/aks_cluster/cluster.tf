resource "azurerm_kubernetes_cluster" "chatapp_cluster" {
  name                = "chat-uw2"
  location            = "West US 2"
  resource_group_name = "infra"
  dns_prefix          = "infra"
  oidc_issuer_enabled = false

  #Overwritten by spot node pool
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size = "Standard_D2s_v3"
    temporary_name_for_rotation = "maintenance"
  }


  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "spot" {
  name = "spot"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.chatapp_cluster.id
  
  #General VM Config
  vm_size = "Standard_D2s_v3"
  os_type = "Linux"
  node_count = 2
  os_disk_size_gb = "150GB"
  os_disk_type = "Ephemeral"

  #Cost Optimization with spot instances
  priority = "Spot"
  eviction_policy = "Delete"
  spot_max_price = -1

  #Autoscaling setup
  auto_scaling_enabled = true
  min_count = 2
  max_count = 3

  node_labels = {
    "nodepool-type" = "spot"
    "workload"      = "infra"
  }

}