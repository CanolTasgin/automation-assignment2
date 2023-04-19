
resource "azurerm_network_interface" "nic" {
  count               = var.nb_count
  name                = "${var.linux_name}-${var.vm_index}-${count.index}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Name           = local.Name
    GroupMembers   = local.GroupMembers
    ExpirationDate = local.ExpirationDate
    Environment    = local.Environment
  }

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1-${var.vm_index}-${count.index}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}


resource "azurerm_public_ip" "pip" {
  count               = var.nb_count
  name                = "${var.linux_name}-${var.vm_index}-${count.index}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags = {
    Name           = local.Name
    GroupMembers   = local.GroupMembers
    ExpirationDate = local.ExpirationDate
    Environment    = local.Environment
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.nb_count
  name                            = "${var.linux_name}-${var.vm_index}-${count.index}"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = var.size
  admin_username                  = var.admin_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.nic[count.index].id]
  availability_set_id             = azurerm_availability_set.linux_avs.id

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("/Users/canoltasgin/.ssh/id_rsa.pub")
  }

  tags = {
    Name           = local.Name
    GroupMembers   = local.GroupMembers
    ExpirationDate = local.ExpirationDate
    Environment    = local.Environment
  }

  os_disk {
    name                 = "${var.linux_name}-${var.vm_index}-${count.index}-os-disk"
    storage_account_type = var.os_disk_attributes.storage_account_type
    disk_size_gb         = var.os_disk_attributes.disk_size
    caching              = var.os_disk_attributes.caching
  }

  source_image_reference {
    publisher = var.centos_linux_os_info.publisher
    offer     = var.centos_linux_os_info.offer
    sku       = var.centos_linux_os_info.sku
    version   = var.centos_linux_os_info.version
  }
}

resource "azurerm_availability_set" "linux_avs" {
  name                = var.linux_avs
  location            = var.location
  resource_group_name = var.resource_group_name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

resource "azurerm_managed_disk" "data_disk" {
  count                = var.nb_count
  name                 = "${var.linux_name}-${var.vm_index}-${count.index}-data-disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "StandardSSD_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" {
  count              = var.nb_count
  virtual_machine_id = azurerm_linux_virtual_machine.vm[count.index].id
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  lun                = 0
  caching            = "ReadWrite"
}
