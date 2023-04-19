output "linux_avs_name" {
  value = azurerm_availability_set.linux_avs.name
}

output "vm_hostname" {
  value = [for i in range(var.nb_count) : "${var.linux_name}-${var.vm_index}-${i}"]
}

output "private_ip_address" {
  value = [for nic in azurerm_network_interface.nic : nic.private_ip_address]
}

output "public_ip_address" {
  value = [for pip in azurerm_public_ip.pip : pip.ip_address]
}

# output "linux_vm_ids" {
#   value = [for vm in azurerm_linux_virtual_machine.vm : vm.availability_set_id]
# }

output "linux_public_ip" {
  value = [for pip in azurerm_public_ip.pip : pip.ip_address]
}

output "linux_vm_ids" {
  value = azurerm_linux_virtual_machine.vm.*.id
}
