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

variable "acr_id" {
  description = "The ID of the Azure Container Registry to integrate with AKS."
  type        = string
}

variable "keyvault_id" {
  description = "The ID of the Key Vault to integrate with AKS."
  type        = string
}