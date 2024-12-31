output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_private_ip" {
  description = "The private IP address of the Virtual Machine"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "public_ip" {
  description = "The public IP address of the Virtual Machine"
  value       = azurerm_public_ip.public_ip.ip_address
}




output "nic_id" {
  description = "The ID of the Network Interface attached to the Virtual Machine"
  value       = azurerm_network_interface.nic.id
}