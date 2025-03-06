output "client_certificate" {
  value     = azurerm_kubernetes_cluster.chatapp_cluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.chatapp_cluster.kube_config_raw

  sensitive = true
}

output "nodes_number" {
  value = azurerm_kubernetes_cluster.chatapp_cluster.nodes_number
  
  sensitive =  false
}