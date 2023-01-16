# Catena-X consortium cloud infrastructure 

This repository hosts configuration for setting up the cloud infrastructure for the Catena-X consortium environments.
It is mainly terraform based and involves [Azure](https://azure.microsoft.com/) resources.

## Structure

The repository follows a specific structure. On the root level, there are directories for each of our
[kubernetes](https://kubernetes.io/) clusters. The cluster directories are prefixed with a number, that should indicate
a potential order, in which clusters should be created, if we start a completely new consortium setup. The order
can be necessary, so that managing of clusters can properly be set up.

In case there are reusable parts of our terraform configuration, they are placed as module in the [/modules](/modules)
directory.  

## How to run

