output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}
output "aks_principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "public_ip_aks" {
value = azurerm_public_ip.static_ip.ip_address
}