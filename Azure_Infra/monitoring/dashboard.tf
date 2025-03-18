resource "azurerm_portal_dashboard" "my-board" {
  name                = "simple-dash"
  resource_group_name = "Infrastructure"
  location            = "West US 2"
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("${path.module}/dash.tpl", {})
}