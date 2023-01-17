# Catena-X consortium cloud infrastructure

This repository hosts configuration for setting up the cloud infrastructure for the Catena-X consortium environments. It
is mainly terraform based and involves [Azure](https://azure.microsoft.com/) resources.

## Structure

The repository follows a specific structure. On the root level, there are directories for each of our
[kubernetes](https://kubernetes.io/) clusters. The cluster directories are prefixed with a number, that should indicate
a potential order, in which clusters should be created, if we start a completely new consortium setup. The order can be
necessary, so that managing of clusters can properly be set up.

In addition to the cluster modules, there is a single [consortium_cluster](modules/consortium_cluster) module, which
defines all the necessary Azure resources to form a complete environment. This module is inteded to define the basis for
all consortium environments and can be configured through [dedicated variables](modules/consortium_cluster/variables.tf)

## How to run

To manage the cloud infrastructure defined in this repository, you need a local installation
of [terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli). For installation,
just follow the instruction for your operating system.

### Update an existing environment

To update an

### Create a new environment
