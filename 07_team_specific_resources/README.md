# Team specific cloud infra

This module contains team specific cloud infrastructure, that is provided and maintained centrally.
It is provided centrally, to keep the number of people that have access to our consortium Azure subscription small.
Instead, access to resources should be granted via dedicated `Service Principals (SP)`. SP credentials can than
be shared through the team specific secret engine in our [Hashicorp Vault instance](https://vault.demo.catena-x.net/).

## How to run

> __INFO:__
> 
> Currently, there is only one team specific resource block. If there will be more, we should introduce a better separation
> of the teams resources. This was not done yet, to keep running and maintaining the tf declarations easy.

To run the resource creation, you can use the following commands, assuming, your working directory is the one containing this README.

```shell
terraform init -upgrade

# Create a plan file and check if proposed changes match your expectation
terraform plan -out tf.plan

# Apply the plan, if the proposed changes are ok
terraform apply "tf.plan"
```

## EDC Azure Key Vault

We provide a centrally managed `Azure Key Vault` for the EDC team, that they need to test their Azure Key Vault extension.
It is created in a dedicated resource group and a dedicated SP with the `Key Vault Certificates Officer` Role.
See [built-in roles documentation](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#key-vault-certificates-officer)
for more information or other available roles.
