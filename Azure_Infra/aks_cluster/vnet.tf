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

  tags = {
    environment = "Kubernetes"
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = "Infrastructure"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = "Infrastructure"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
