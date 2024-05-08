resource "azurerm_resource_group" "rg_class_two" {
  name     = var.rg_name_class_two
  location = var.location_for_azure_class_two
}
variable "rg_name_class_two" {
type = string
default = "salomon_resource_group_class_two"
}
variable "location_for_azure_class_two" {
type = string
default = "Canada East"
}
resource "azurerm_kubernetes_cluster" "batchone" {
  name                = "batcheone"
  location            = azurerm_resource_group.var.rg_name_class_two.var.location_for_azure_class_two
  resource_group_name = azurerm_resource_group.var.rg_name_class_two
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_kubernetes_cluster" "batchtwo" {
  name                = "batchetwo"
  location            = azurerm_resource_group.var.rg_name_class_two.var.location_for_azure_class_two
  resource_group_name = azurerm_resource_group.var.rg_name_class_two
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_kubernetes_cluster" "batchthree" {
  name                = "batchethree"
  location            = azurerm_resource_group.var.rg_name_class_two.var.location_for_azure_class_two
  resource_group_name = azurerm_resource_group.var.rg_name_class_two
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_kubernetes_cluster" "batchfour" {
  name                = "batchefour"
  location            = azurerm_resource_group.var.rg_name_class_two.var.location_for_azure_class_two
  resource_group_name = azurerm_resource_group.var.rg_name_class_two
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
resource "azurerm_kubernetes_cluster" "batchfive" {
  name                = "batchefive"
  location            = azurerm_resource_group.var.rg_name_class_two.var.location_for_azure_class_two
  resource_group_name = azurerm_resource_group.var.rg_name_class_two
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
