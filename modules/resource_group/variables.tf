variable "network_rg_name" {
  description = "Name of the resource group for networking resources"
  type        = string
  default     = "n01510487-assignment2-RG"
}

variable "linux_rg_name" {
  description = "Name of the resource group for Linux virtual machines"
  type        = string
  default     = "n01510487-linux-rg"
}

variable "location" {
  description = "Location of the resource groups"
  type        = string
  default     = "canadacentral"
}
