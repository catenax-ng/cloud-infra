module "beta_cluster" {
  source = "../modules/consortium_cluster"

  cluster_name = "beta"

  public_ip_ddos_protection_mode = "VirtualNetworkInherited"
  k8s_version = "1.23.12"

  provider_azure_dns_subscription_id       = var.provider_azure_dns_subscription_id
  provider_azure_subscription_id           = var.provider_azure_subscription_id
  provider_azure_tenant_id                 = var.provider_azure_tenant_id
  provider_service_principal_client_id     = var.provider_service_principal_client_id
  provider_service_principal_client_secret = var.provider_service_principal_client_secret
}
