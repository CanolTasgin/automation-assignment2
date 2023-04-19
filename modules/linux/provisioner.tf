# resource "null_resource" "linux_provisioner" {
#   count      = var.nb_count
#   depends_on = [azurerm_linux_virtual_machine.vm, azurerm_public_ip.pip]
#   provisioner "remote-exec" {
#     inline = [
#       "hostname"
#     ]
#     connection {
#       host        = azurerm_public_ip.pip[count.index].ip_address
#       type        = "ssh"
#       user        = var.admin_username
#       private_key = file("/Users/canoltasgin/.ssh/id_rsa")
#     }
#   }

#   # provisioner "local-exec" {
#   #   command = "ansible-playbook -i '${azurerm_public_ip.pip[count.index + 1].ip_address},' -u ${var.admin_username} --private-key=/Users/canoltasgin/.ssh/id_rsa main.yaml"
#   # }
#   # provisioner "local-exec" {
#   #   command = "printf '[linux_vms]\n20.220.211.227 ansible_user=firstn01510487 ansible_ssh_private_key_file=/Users/canoltasgin/.ssh/id_rsa\n20.220.209.12 ansible_user=firstn01510487 ansible_ssh_private_key_file=/Users/canoltasgin/.ssh/id_rsa\n' > inventory.ini && ansible-playbook main.yml"
#   #   # command = "hostname"
#   # }
# }
resource "null_resource" "linux_provisioner" {
  count = var.nb_count

  triggers = {
    public_ip = azurerm_public_ip.pip[count.index].ip_address
  }

  depends_on = [azurerm_linux_virtual_machine.vm, azurerm_public_ip.pip]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      host        = azurerm_public_ip.pip[count.index].ip_address
      type        = "ssh"
      user        = var.admin_username
      private_key = file("/Users/canoltasgin/.ssh/id_rsa")
    }
  }


}
