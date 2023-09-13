variable "resource_group_location" {
  description = "The Azure region location for the resource group. Should also be used to set the location of all other resources"
  type        = string
  default     = "germanywestcentral"
}

variable "cluster_name" {
  description = "The name of the cluster/environment to create. Will be used in several resources like for example resource_group"
  type        = string
}

variable "dns_a_record_ttl" {
  description = "The time to live (ttl) value in seconds"
  type        = number
  default     = 3600
}

variable "zone_name" {
  description = "The name of the DNS zone, where the A record belongs to. I.e. demo.catena-x.net"
  type        = string
  default     = "demo.catena-x.net"
}

variable "dns_zone_resource_group_name" {
  description = "The name of the resource group this A Record belongs to"
  type        = string
  default     = "cxtsi-demo-shared-rg"
}

variable "default_node_pool_name" {
  description = "The name of the AKS cluster's default node pool"
  type        = string
  default     = "default"
}

variable "k8s_vm_size" {
  description = "The Azure VM Size string i.e. Standard_D2_v2 or Standard_D8s_v3"
  type        = string
  default     = "Standard_D8s_v4"
}

variable "k8s_cluster_node_count" {
  description = "The number of kubernetes nodes to create for the k8s cluster"
  type        = number
  default     = 3
}

variable "k8s_version" {
  description = "AKS k8s Version to deploy"
  type        = string
  default     = "1.26.6"
}

variable "enable_auto_scaling" {
  description = "Whether auto scaling of the worker nodes are enabled"
  type        = bool
  default     = null
}

variable "max_count" {
  description = "If auto scaling is enabled the maximum number of nodes in the pool"
  type        = number
  default     = null
}

variable "min_count" {
  description = "If auto scaling is enabled the minimum number of nodes in the pool"
  type        = number
  default     = null
}

# Provider specific variables
variable "provider_service_principal_client_id" {
  description = "The service principal client id to authenticate to Azure"
  type        = string
}

variable "provider_service_principal_client_secret" {
  description = "The service principal client secret to authenticate to Azure"
  type        = string
}

variable "provider_azure_tenant_id" {
  description = "The Azure tenant ID use"
  type = string
}

variable "provider_azure_subscription_id" {
  description = "The Azure subscription ID"
}

variable "provider_azure_dns_subscription_id" {
  description = "The Azure subscription ID for the DNS entries. Only used, because DNS zone and AKS resources are in different subscriptions"
  type = string
}

variable "public_ip_ddos_protection_mode" {
  description = "The ddos_protection_mode for the public IP resource. 'Disabled' on default"
  type = string
  default = "Disabled"
}
