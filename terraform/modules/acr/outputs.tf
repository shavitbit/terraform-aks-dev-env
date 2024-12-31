output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  description = "The admin username for the ACR"
  value       = azurerm_container_registry.acr.admin_username
  #sensitive   = true
}

output "acr_admin_password" {
  description = "The admin password for the ACR"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}