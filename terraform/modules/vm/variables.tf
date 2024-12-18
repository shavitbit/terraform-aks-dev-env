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

variable "admin_username" {
  description = "The admin username for the Virtual Machine"
  type        = string
}

variable "custom_data" {
  description = "Custom script for VM provisioning (install Jenkins, Docker, Git)"
  type        = string
  default     = ""
}
variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}