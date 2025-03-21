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


  policy_rule = templatefile("${path.module}/policy_rule.tpl", {})

}