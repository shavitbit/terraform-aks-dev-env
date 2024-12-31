resource "azurerm_container_registry" "acr" {
  name                = "${var.name}acr"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard"
 
   admin_enabled       = true
   anonymous_pull_enabled = true 
   # I added anonymous_pull_enabled because I don’t have permission to do azurerm_role_assignment for acr_pull
}
