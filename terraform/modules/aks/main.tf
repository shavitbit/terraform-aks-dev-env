
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name}-aks"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "${var.name}-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
   # type = "UserAssigned"
   # identity_ids =  [azurerm_user_assigned_identity.orenaksuser.id]

  }

 # enable CSI driver to access key vault
  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  tags = {
    Environment = "Sandbox"
  }
}


#resource "azurerm_role_assignment" "akv_kubelet" {
#  scope                =  var.keyvault_id
#  role_definition_name = "Key Vault Secrets Officer"
#  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
#}



provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.aks.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)
  }
}
#mc_oren-candidate_rg_oren-aks_westeurope
resource "azurerm_public_ip" "static_ip" {
  name                = "${var.name}-ingress-static-ip"
  location            = var.location
  resource_group_name = "mc_oren-candidate_rg_oren-aks_westeurope"
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Sandbox"
  }
}


#data "azurerm_resource_group" "aks_rg" {
#  name = var.resource_group
#}
#resource "azurerm_role_assignment" "aks_network_contributor" {
#  principal_id   = "a58cf9fe-0b89-444a-9c7c-ac0950256e16"  # The Identity that AKS is using
#  role_definition_name = "Network Contributor"
#  scope          = "/subscriptions/2fa0e512-f70e-430f-9186-1b06543a848e/resourceGroups/oren-CANDIDATE_RG"
#}
## Assign Network Contributor role to System-Assigned Managed Identity
#resource "azurerm_role_assignment" "aks_system_assigned_network_contributor" {
#  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
#  role_definition_name = "Network Contributor"
#  scope                = data.azurerm_resource_group.aks_rg.id
#}
#
## Assign Network Contributor role to Control Plane Identity
#resource "azurerm_role_assignment" "aksy_control_plane_network_contributor" {
#  principal_id         = "a58cf9fe-0b89-444a-9c7c-ac0950256e16" # Control Plane Identity from error
#  role_definition_name = "Network Contributor"
#  scope                = data.azurerm_resource_group.aks_rg.id
#}


resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  values = [file ("${path.module}/values/ingress.yaml")]


  set {
    name  = "controller.service.loadBalancerIP"
    value = azurerm_public_ip.static_ip.ip_address
  }


}

