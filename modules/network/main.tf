resource "azurerm_virtual_network" "network-vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "network-subnet1" {
  name                 = var.subnet_name_1
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = var.subnet_address_space_1
}

resource "azurerm_network_security_group" "network-nsg1" {
  name                = var.network_security_group_1
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "network-subnet1-nsg-assoc" {
  subnet_id                 = azurerm_subnet.network-subnet1.id
  network_security_group_id = azurerm_network_security_group.network-nsg1.id
}

resource "azurerm_subnet" "network-subnet2" {
  name                 = var.subnet_name_2
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  address_prefixes     = var.subnet_address_space_2
}

resource "azurerm_network_security_group" "network-nsg2" {
  name                = var.network_security_group_2
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "rule1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "rule2"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "network-subnet2-nsg-assoc" {
  subnet_id                 = azurerm_subnet.network-subnet2.id
  network_security_group_id = azurerm_network_security_group.network-nsg2.id
}
