data "azurerm_client_config" "current" {}
data "azuread_client_config" "current" {}

###
#   Resource Group
###
resource "azurerm_resource_group" "team_specific_resources" {
  location = var.resource_group_location
  name     = "team-specific-resources"
}

###
#   EDC Service Principal
###
resource "azuread_application" "edc_keyvault_app" {
  display_name = "edc-keyvault-app"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "edc_key_vault_sp" {
  application_id               = azuread_application.edc_keyvault_app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "edc_keyvault_sp_password" {
  service_principal_id = azuread_service_principal.edc_key_vault_sp.id
}

resource "azurerm_role_assignment" "edc_keyvault_sp_secrets_office_assignment" {
  principal_id = azuread_service_principal.edc_key_vault_sp.application_id
  scope        = "/subscriptions/${var.provider_azure_subscription_id}/resourceGroups/${azurerm_resource_group.team_specific_resources.name}"
  # See: https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#key-vault-secrets-officer
  role_definition_id = "b86a8fe4-44ce-4948-aee5-eccb2c155cd7"
}

###
#   EDC Key Vault
###
resource "azurerm_key_vault" "edc_key_vault" {
  name                = "cx-edc-team-key-vault"

  location            = azurerm_resource_group.team_specific_resources.location
  resource_group_name = azurerm_resource_group.team_specific_resources.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enable_rbac_authorization = true

  sku_name            = var.sku_name
}

resource "azurerm_key_vault_access_policy" "edc_key_vault_access_policy" {
  key_vault_id = azurerm_key_vault.edc_key_vault.id
  object_id    = azuread_service_principal.edc_key_vault_sp.object_id
  tenant_id    = data.azuread_client_config.current.tenant_id
}

###
#   Providing credentials in Hashicorp Vault
###

resource "vault_generic_secret" "secret-edc-sp-credentials" {
  path      = "/edc/azure-key-vault"
  data_json = <<EOT
{
  "key_vault_uri": "${azurerm_key_vault.edc_key_vault.vault_uri}",
  "sp_client_id": "${azuread_service_principal.edc_key_vault_sp.application_id}",
  "sp_client_secret": "${azuread_service_principal_password.edc_keyvault_sp_password.value}",
}
EOT
}
