module "resource_groups" {
  source = "./modules/resource_group"

  network_rg_name = "network-rg-assignment2"
  linux_rg_name   = "linux-rg-assignment2"
  location        = "canadacentral"
}

module "network" {
  source = "./modules/network"

  resource_group_name           = "network-rg-assignment2"
  location                      = "canadacentral"
  virtual_network_name          = "network-vnet-assignment2"
  virtual_network_address_space = ["10.0.0.0/16"]
  subnet_name_1                 = "network-subnet1-assignment2"
  subnet_name_2                 = "network-subnet2-assignment2"
  subnet_address_space_1        = ["10.0.1.0/24"]
  subnet_address_space_2        = ["10.0.2.0/24"]
  network_security_group_1      = "network-nsg1-assignment2"
  network_security_group_2      = "network-nsg2-assignment2"

  depends_on = [module.resource_groups.network_rg]
}

module "linux_vms" {
  source = "./modules/linux"

  linux_name = "N01510487-c-vm"
  size       = "Standard_B1s"
  centos_linux_os_info = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  linux_avs      = "linux-availability-set"
  nb_count       = 2
  admin_username = "firstn01510487"
  os_disk_attributes = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = 128
    caching              = "ReadWrite"
  }
  subnet_id = module.network.subnet_id

  depends_on = [module.network]
}

resource "local_file" "ansible_inventory" {
  depends_on = [module.linux_vms]

  filename = "inventory.ini"
  content  = <<-EOF
  [linux_vms]
  vm1 ansible_host=${module.linux_vms.linux_public_ip[0]}
  vm2 ansible_host=${module.linux_vms.linux_public_ip[1]}
  EOF
}

resource "null_resource" "ansible_provisioner" {
  count = length(module.linux_vms.private_ip_address)

  triggers = {
    vm_private_ip = module.linux_vms.private_ip_address[count.index]
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.ini --user firstn01510487 --private-key /Users/canoltasgin/.ssh/id_rsa -e 'ansible_python_interpreter=/usr/bin/python3' main.yml"
  }

  depends_on = [module.linux_vms]
}



