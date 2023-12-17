# -----------------------------------------------------
# VM
# -----------------------------------------------------

output "vm_id" {
  value = azurerm_windows_virtual_machine.vm.id
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.vm.name
}

output "vm_private_ip" {
  value = azurerm_network_interface.vm_nic.private_ip_address
}

