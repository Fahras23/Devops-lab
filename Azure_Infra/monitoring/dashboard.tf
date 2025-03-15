resource "azurerm_portal_dashboard" "my-board" {
  name                = "simple-dash"
  resource_group_name = azurerm_resource_group.infrastructurerg.name
  location            = azurerm_resource_group.infrastructurerg.location
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("${path.module}/dash.tpl", {})
}