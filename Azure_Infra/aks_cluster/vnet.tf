resource "azurerm_network_security_group" "chat-nsg" {
  name                = "chat-cluster-nsg"
  location            = "West US 2"
  resource_group_name = "Infrastructure"
}

resource "azurerm_virtual_network" "chat-vnet" {
  name                = "chat-cluster-vnet"
  location            = "West US 2"
  resource_group_name = "Infrastructure"
  address_space       = ["10.0.0.0/20"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
    security_group   = azurerm_network_security_group.chat-nsg.id
  }

  tags = {
    environment = "Kubernetes"
  }
}