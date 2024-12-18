resource "azurerm_container_registry" "acr" {
  name                = "${var.name}acr"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Basic"
  admin_enabled       = true
}
