terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "~> 3.0"
      version = ">= 3.70.0"
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

module "acr" {
  source              = "./modules/acr"
  resource_group      = azurerm_resource_group.candidate_rg.name
  location            = var.location
  name                = var.name
}

module "key_vault" {
  source              = "./modules/key_vault"
  name                = var.name
  resource_group      = azurerm_resource_group.candidate_rg.name
  location            = var.location
  aks_principal_id    = module.aks.aks_principal_id
  #kubelet_identity_object_id = module.aks.kubelet_identity_object_id
}

module "aks" {
  source              = "./modules/aks"
  name                = var.name
  resource_group      = azurerm_resource_group.candidate_rg.name
  location            = var.location
  acr_id              = module.acr.acr_id 
  keyvault_id         = module.key_vault.keyvault_id
}