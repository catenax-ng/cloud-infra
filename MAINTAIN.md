# Maintaining the cloud infra

## AKS (Azure Kubernetes Service) cluster management

- Login to Azure Portal
- Check our version for the Cluster
- Check the available versions for the clusters within the Azure Portal
- Read the linked documentation for the Kubernetes upgrade and recommendations for upgrading.

## Upgrading kubernetes version

- Upgrade default value for `k8s_version` in [modules/consortium_cluster/variables.tf](modules/consortium_cluster/variables.tf)
- Overwrite `k8s_version` in `variables.tf` (int-cluster) or `main.tf` (stable-cluster) of the clusters, in case you cannot upgrade the instance.
- Perform terraform `plan` to validate the changes to kubernetes version of our AKS resources
- Run terraform `apply` to upgrade our resources to the new kubernetes version if the plan is valid

## Key vault secrets

The following secrets are needed and stored in our vault to run the terraform scripts: 

vault path: `devsecops/azure/demo.catena-x.net/service-principals/automation`.

| Naming for automation secret in vault | Naming in our Terraform scripts            |
|---------------------------------------|--------------------------------------------|
| `dns_subscriptionId`                  | `provider_azure_dns_subscription_id`       |
| `subscriptionId`                      | `provider_azure_subscription_id`           |
| `tenantId`                            | `provider_azure_tenant_id`                 |
| `appId`                               | `provider_service_principal_client_id`     |
| `password`                            | `provider_service_principal_client_secret` |
