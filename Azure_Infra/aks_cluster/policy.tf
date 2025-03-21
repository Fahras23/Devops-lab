resource "azurerm_policy_definition" "aks_policy" {
  name         = "VMSizePolicy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allow only 1 type of vm size"

  metadata = <<METADATA
    {
    "category": "AKS"
    }

METADATA


  policy_rule = templatefile("${path.module}/templates/policy_rule.tpl", {})

}

resource "azurerm_resource_policy_assignment" "rule_assigm" {
  name                 = "aks-policy-assignment"
  resource_id          = azurerm_kubernetes_cluster.chatapp_cluster.id
  policy_definition_id = azurerm_policy_definition.example.id
}