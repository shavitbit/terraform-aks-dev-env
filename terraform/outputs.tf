output "public_ip" {
  value = module.vm.public_ip
  description = "The public IP address of the VM"
}

output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = module.acr.acr_login_server
}

#output "acr_admin_username" {
#  description = "The admin username for the ACR"
#  value       = module.acr.acr_admin_username
#  #sensitive   = true
#}
#
#output "acr_admin_password" {
#  value = module.acr.acr_admin_password
#  sensitive = true
#}

#output "kube_config" {
#  value = module.aks.kube_config
#  sensitive = true
#}
output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}


#output "kubelet_identity_object_id" {
#  value = module.aks.kubelet_identity_object_id
#}

output "aks_principal_id" {
  value = module.aks.aks_principal_id
}

output "public_ip_aks" {
  value = module.aks.public_ip_aks
}
