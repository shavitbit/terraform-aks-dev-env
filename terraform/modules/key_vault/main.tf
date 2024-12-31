data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                        = "${var.name}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
}

resource "azurerm_key_vault_access_policy" "aks_access" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.client_id

  secret_permissions = [
    "Get",
    "List",
  ]
}





#resource "azurerm_key_vault_access_policy" "aks_access" {
#  key_vault_id = azurerm_key_vault.keyvault.id
#  tenant_id    = data.azurerm_client_config.current.tenant_id
#  #object_id    = azurerm_kubernetes_cluster.aks.identity[0].principal_id
#  #object_id    = var.aks_principal_id
#  object_id = var.kubelet_identity_object_id 
#  secret_permissions = [
#    "Get",
#    "List",
#  ]
#  key_permissions = [
#    "Get",
#    "List",
#  ]
#}

#resource "azurerm_key_vault_access_policy" "aks_kubelet" {
#  key_vault_id = azurerm_key_vault.keyvault.id
#
#  tenant_id = data.azurerm_client_config.current.tenant_id
#  object_id = var.kubelet_identity_object_id
#
#  secret_permissions = [
#    "Get",
#    "List",
#  ]
#}