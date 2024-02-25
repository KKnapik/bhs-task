terraform {
  #   required_version = ">= 1.5.7"
  backend "azurerm" {
    resource_group_name  = "fstates"
    storage_account_name = "bhstskstf"
    container_name       = "tfstatedevops"
    key                  = "github-thomasthorntoncloud-terraform-example.tfstate"
  }
}

terraform {
  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
