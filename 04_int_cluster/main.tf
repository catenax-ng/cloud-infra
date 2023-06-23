resource "azurerm_resource_group" "resource_group" {
  location = var.resource_group_location
  name     = "cxtsi-${var.cluster_name}-rg"

  tags = {
    environment = "int"
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "cx-${var.cluster_name}-public-ip"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_kubernetes_cluster.aks_cluster.node_resource_group

  allocation_method = "Static"
  sku               = "Standard"

  zones = ["1", "2", "3"]

  ddos_protection_mode = var.public_ip_ddos_protection_mode
}

resource "azurerm_dns_a_record" "a-record" {
  name                = "*.int"
  ttl                 = var.dns_a_record_ttl
  zone_name           = var.zone_name
  records             = ["20.113.19.82"]
  resource_group_name = var.dns_zone_resource_group_name

  provider = azurerm.speedboat
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "cxtsi-${var.cluster_name}-aks-services"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  #  oms_agent {
  #    log_analytics_workspace_id      = "/subscriptions/899135fc-19c6-47cb-82f1-0230af7b99b5/resourceGroups/shared-services-rg/providers/Microsoft.OperationalInsights/workspaces/cxtsi-hotel-budapest-log"
  #    msi_auth_for_monitoring_enabled = false
  #  }

  default_node_pool {
    name                 = var.default_node_pool_name
    vm_size              = var.k8s_vm_size
    node_count           = var.k8s_cluster_node_count
    orchestrator_version = var.k8s_version

    enable_auto_scaling = var.enable_auto_scaling
    max_count           = var.max_count
    min_count           = var.min_count
    os_disk_type        = "Ephemeral"
    zones               = ["1", "2", "3"]
  }

  identity {
    type = "SystemAssigned"
  }

  dns_prefix                       = "cxtsi-${var.cluster_name}-aks-services-dns"
  http_application_routing_enabled = true
  kubernetes_version               = var.k8s_version
  sku_tier                         = "Standard"
}
