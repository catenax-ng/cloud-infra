# Terraform INT Cluster Setup

> If you want to change the INT cluster you have to implement all changes in this directory, and not in the module
> `modules/consortium` directory.

Please keep in mind, that this cluster does not use the Terraform `modules/consortium` module, as INT cluster has been
created manually when no standards were defined yet, which are enforced in the modules, and we decided to
keep the module unchanged. Instead, we created this Terraform script, based on the modules, including all required
changes to match deployed INT AKS cluster.
