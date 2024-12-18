terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "candidate_rg" {
  name     = "${var.name}-CANDIDATE_RG"
  location = var.location
}

module "vm" {
  source              = "./modules/vm"
  resource_group      = azurerm_resource_group.candidate_rg.name
  location            = var.location
  name                = var.name
  ssh_public_key_path = var.ssh_public_key_path
  admin_username      = var.admin_username
}