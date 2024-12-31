variable "resource_group" {
  description = "The name of the resource group where the VM will be created"
  type        = string
}

variable "location" {
  description = "The location where the VM will be created"
  type        = string
}

variable "name" {
  description = "The base name for the VM and associated resources"
  type        = string
}

variable "aks_principal_id" {
  description = "The principal ID of the AKS cluster"
  type        = string
}

#variable "kubelet_identity_object_id" {
#  description = "The object ID of the AKS kubelet managed identity"
#  type        = string
#}