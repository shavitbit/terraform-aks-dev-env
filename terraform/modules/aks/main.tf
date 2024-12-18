resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name}-aks-cluster"
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = "${var.name}-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    azure_policy {
      enabled = true
    }
  }

  tags = {
    Environment = "Dev"
  }
}
