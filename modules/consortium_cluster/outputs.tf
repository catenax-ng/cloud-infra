output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
}

output "resource_group_location" {
  value = azurerm_resource_group.resource_group.location
}

output "node_pool_resource_group" {
  value = azurerm_kubernetes_cluster.aks_cluster.node_resource_group
}
