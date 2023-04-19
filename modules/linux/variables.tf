
variable "linux_name" {
  default = ""
}

variable "vm_index" {
  default = "1"
}

variable "size" {
  default = "Standard_B1s"
}

variable "centos_linux_os_info" {
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "linux_avs" {
  default = "linux-availability-set"
}

variable "nb_count" {
  default = 2
}

variable "admin_username" {
  default = "firstn01510487"
}

variable "os_disk_attributes" {
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = 128
    caching              = "ReadWrite"
  }
}

variable "resource_group_name" {
  type    = string
  default = "network-rg-assignment2"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

locals {
  Name           = "Automation Project – Assignment 2"
  GroupMembers   = "canol.tasgin"
  ExpirationDate = "2023-06-30"
  Environment    = "Lab"
}

variable "subnet_id" {
  type = string
}
