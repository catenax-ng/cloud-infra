# Terraform INT Cluster Setup

Beside the default behavior of the `modules/consortium` module, this directory contains all changes, which are dedicated to our INT cluster.

> If you want to change the INT cluster you have to implement all changes in this directory, and not in the module
> `modules/consortium` directory.

Please keep in mind, that this cluster does not use the Terraform `modules/consortium` module, as INT cluster has been
created manually when no standards were defined yet, which are enforced in the modules, and we decided to
keep the module unchanged. Instead, we created this Terraform script, based on the modules, including all required
changes to match deployed INT AKS cluster. You can find instructions on how we maintain the standard conform clusters in [MAINTAIN.md](../MAINTAIN.md).

## Example

INT cluster k8s-cluster version needs to be configured under [04_int_cluster/variables.tf](variables.tf) `k8s_version` variable.
