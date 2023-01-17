resource "azurerm_resource_group" "resource_group" {
  location = var.resource_group_location
  name     = "cx-${var.cluster_name}-rg"
}

resource "azurerm_public_ip" "public_ip" {
  name                = "cx-${var.cluster_name}-public-ip"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  allocation_method = "Static"
  sku               = "Standard"

  zones = ["1", "2", "3"]

  ddos_protection_mode = "Disabled"
}

resource "azurerm_dns_a_record" "a-record" {
  name                = "*.${var.cluster_name}"
  ttl                 = var.dns_a_record_ttl
  zone_name           = var.zone_name
  target_resource_id  = azurerm_public_ip.public_ip.id
  resource_group_name = var.dns_zone_resource_group_name

  provider = azurerm.speedboat
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "cx-${var.cluster_name}-aks"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  default_node_pool {
    name                 = var.default_node_pool_name
    vm_size              = var.k8s_vm_size
    node_count           = var.k8s_cluster_node_count
    orchestrator_version = var.k8s_version

    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.max_count
    min_count           = var.min_count
  }

  identity {
    type = "SystemAssigned"
  }

  dns_prefix         = "cx-${var.cluster_name}-aks"
  kubernetes_version = var.k8s_version
}
