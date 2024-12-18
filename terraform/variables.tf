variable name {
  type        = string
  default     = "oren"
  description = "my name to be use as a base name"
}

variable "location" {
  default = "West Europe"
}

variable "admin_username" {
  description = "The admin username for the Virtual Machine"
  type        = string
}
variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}