output "virtual_network_name" {
  value = azurerm_virtual_network.network-vnet.name
}

output "virtual_network_address_space" {
  value = azurerm_virtual_network.network-vnet.address_space
}

output "subnet_name_1" {
  value = azurerm_subnet.network-subnet1.name
}

output "subnet_address_space_1" {
  value = azurerm_subnet.network-subnet1.address_prefixes
}

output "subnet_name_2" {
  value = azurerm_subnet.network-subnet2.name
}

output "subnet_address_space_2" {
  value = azurerm_subnet.network-subnet2.address_prefixes
}

output "network_security_group_1" {
  value = azurerm_network_security_group.network-nsg1.name
}

output "network_security_group_2" {
  value = azurerm_network_security_group.network-nsg2.name
}

output "subnet_id" {
  value = azurerm_subnet.network-subnet1.id
}

output "subnet_id_2" {
  value = azurerm_subnet.network-subnet2.id
}
