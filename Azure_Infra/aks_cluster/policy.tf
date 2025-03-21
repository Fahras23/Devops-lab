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


  policy_rule = <<POLICY_RULE
 {
   "if": {
      "allOf": [
        {
          "field": "type",
          "equals": "Microsoft.ContainerService/managedClusters/agentPools"
        },
        {
          "not": {
            "field": "Microsoft.ContainerService/managedClusters/agentPools/vmSize",
            "equals": "Standard_D2s_v4"
          }
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
POLICY_RULE



}