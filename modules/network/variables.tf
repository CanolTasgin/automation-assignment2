variable "resource_group_name" {
  type    = string
  default = "network-rg-assignment2"
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "virtual_network_name" {
  type    = string
  default = "network-vnet-assignment2"
}

variable "virtual_network_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_name_1" {
  type    = string
  default = "network-subnet1-assignment2"
}

variable "subnet_name_2" {
  type    = string
  default = "network-subnet2-assignment2"
}

variable "subnet_address_space_1" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "subnet_address_space_2" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

variable "network_security_group_1" {
  type    = string
  default = "network-nsg1-assignment2"
}

variable "network_security_group_2" {
  type    = string
  default = "network-nsg2-assignment2"
}
