module "int_cluster" {
  source = "../modules/consortium_cluster"

  cluster_name = "int"
  default_node_pool_name = "agentpool"
  k8s_cluster_node_count = 5

  provider_azure_dns_subscription_id       = var.provider_azure_dns_subscription_id
  provider_azure_subscription_id           = var.provider_azure_subscription_id
  provider_azure_tenant_id                 = var.provider_azure_tenant_id
  provider_service_principal_client_id     = var.provider_service_principal_client_id
  provider_service_principal_client_secret = var.provider_service_principal_client_secret
}
