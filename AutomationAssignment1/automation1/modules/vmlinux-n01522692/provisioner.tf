resource "null_resource" "display_hostnames" {
  for_each = azurerm_linux_virtual_machine.linux_vm

  depends_on = [azurerm_linux_virtual_machine.linux_vm]

  provisioner "remote-exec" {

    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key)
      host        = azurerm_public_ip.pip[each.key].ip_address  
    }

    
  }
}
