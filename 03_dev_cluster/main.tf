module "dev_cluster" {
  source = "../modules/consortium_cluster"

  cluster_name = "dev"

  default_node_pool_name = "defaultng"
  k8s_cluster_node_count = 6

  provider_azure_dns_subscription_id       = var.provider_azure_dns_subscription_id
  provider_azure_subscription_id           = var.provider_azure_subscription_id
  provider_azure_tenant_id                 = var.provider_azure_tenant_id
  provider_service_principal_client_id     = var.provider_service_principal_client_id
  provider_service_principal_client_secret = var.provider_service_principal_client_secret
}

resource "azurerm_public_ip" "esc-backbone-dev-ip-1" {
  name                = "esc-backbone-dev-ip-1"
  allocation_method   = "Static"
  location            = module.dev_cluster.resource_group_location
  resource_group_name = module.dev_cluster.node_pool_resource_group

  sku = "Standard"
  zones = ["1", "2", "3"]
}

resource "azurerm_public_ip" "esc-backbone-dev-ip-2" {
  name                = "esc-backbone-dev-ip-2"
  allocation_method   = "Static"
  location            = module.dev_cluster.resource_group_location
  resource_group_name = module.dev_cluster.node_pool_resource_group

  sku = "Standard"
  zones = ["1", "2", "3"]
}
