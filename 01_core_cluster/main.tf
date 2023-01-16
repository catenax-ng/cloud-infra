module "core_cluster" {
  source = "../modules/consortium_cluster"

  cluster_name = "core"
  dns_zone_provider = azurerm.speedboat-sub
}
