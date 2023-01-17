# Maintaining the cloud infra

## Upgrading kubernetes version

- Upgrade default value for `k8s_version` in [modules/consortium_cluster/variables.tf](modules/consortium_cluster/variables.tf)
- Overwrite `k8s_version` in `main.tf` of the clusters, in case you cannot upgrade the instance
- Run terraform `plan` and `apply` to upgrade kubernetes version of our AKS resources
