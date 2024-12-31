variable "location" {
  description = "The location where the VM will be created"
  type        = string
}

variable "name" {
  description = "The base name for the VM and associated resources"
  type        = string
}
variable "resource_group" {
  description = "The name of the resource group where the VM will be created"
  type        = string
}