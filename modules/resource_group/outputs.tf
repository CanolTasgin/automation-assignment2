output "network_rg_name" {
  value = azurerm_resource_group.network_rg.name
}

output "linux_rg_name" {
  value = azurerm_resource_group.linux_rg.name
}

output "network_rg" {
  value = azurerm_resource_group.network_rg
}
