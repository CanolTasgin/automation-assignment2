output "network_rg_name" {
  value = module.resource_groups.network_rg_name
}

output "linux_rg_name" {
  value = module.resource_groups.linux_rg_name
}


output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "virtual_network_address_space" {
  value = module.network.virtual_network_address_space
}

output "subnet_name_1" {
  value = module.network.subnet_name_1
}

output "subnet_address_space_1" {
  value = module.network.subnet_address_space_1
}

output "subnet_name_2" {
  value = module.network.subnet_name_2
}

output "subnet_address_space_2" {
  value = module.network.subnet_address_space_2
}

output "network_security_group_1_name" {
  value = module.network.network_security_group_1
}

output "network_security_group_2_name" {
  value = module.network.network_security_group_2
}

output "vm_hostnames" {
  value = module.linux_vms.vm_hostname
}

output "private_ip_addresses" {
  value = module.linux_vms.private_ip_address
}

output "public_ip_addresses" {
  value = module.linux_vms.public_ip_address
}

output "linux_avs_name" {
  value = module.linux_vms.linux_avs_name
}

output "linux_vm_names" {
  value = module.linux_vms.vm_hostname
}

output "linux_private_ips" {
  value = module.linux_vms.private_ip_address
}

output "linux_public_ips" {
  value = module.linux_vms.public_ip_address
}

