variable "arm_tenant_id" {
  description = "Tenant id in Azure"
}

variable "arm_subscription_id" {
  description = "Subscription id in Azure"
}

variable "resource_group_name" {}

provider "azurerm" {
  features {}
  tenant_id       = var.arm_tenant_id
  subscription_id = var.arm_subscription_id
}

resource "random_string" "random" {
  length  = 8
  special = false
}

resource "azurerm_virtual_network" "example" {
  name                = "nw-jrx-${random_string.random.result}"
  resource_group_name = var.resource_group_name
  location            = "WestEurope"
  address_space       = ["10.0.0.0/16"]
  tags = {
    owner = "jrepnak"
  }
}
