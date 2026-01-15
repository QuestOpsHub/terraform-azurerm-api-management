#----------------
# Resource Group
#----------------
module "resource_group" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-resource-group.git?ref=v1.0.0"

  name     = "rg-apim-${local.resource_suffix}"
  location = "centralus"
  tags     = merge(local.resource_tags, local.timestamp_tag)
}

#------------------------
# User Assigned Identity
#------------------------
module "user_assigned_identity" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-user-assigned-identity.git?ref=v1.0.0"

  name                = "id-apim-${local.resource_suffix}"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = merge(local.resource_tags, local.timestamp_tag)
}

#----------------------
# Application Insights
#----------------------
module "application_insights" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-application-insights.git?ref=v1.0.1"

  name                                  = "appi-apim-${local.resource_suffix}"
  location                              = module.resource_group.location
  resource_group_name                   = module.resource_group.name
  application_type                      = "web"
  daily_data_cap_in_gb                  = 100
  daily_data_cap_notifications_disabled = false
  retention_in_days                     = 90
  sampling_percentage                   = 100
  disable_ip_masking                    = false
  workspace_id                          = null
  local_authentication_disabled         = false
  internet_ingestion_enabled            = true
  internet_query_enabled                = true
  force_customer_storage_for_profiler   = false
  tags                                  = merge(local.resource_tags, local.timestamp_tag)
}

#----------------
# API Management
#----------------
# @todo add all supported arguments
module "api_management" {
  source = "git::https://github.com/QuestOpsHub/terraform-azurerm-api-management.git?ref=v1.0.3"

  name                = "apim-${local.resource_suffix}"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  publisher_name      = "QuestOpsHub"
  publisher_email     = "questopshub.microsoft_gmail.com#EXT#@questopshubmicrosoftgmail.onmicrosoft.com"
  sku_name            = "Basic_1"
  identity = {
    type         = "UserAssigned"
    identity_ids = [module.user_assigned_identity.id]
  }
  security = {
    frontend_ssl30_enabled = true
  }
  public_network_access_enabled = true
  environment                   = local.resource_tags.environment
  identifier                    = "applicationinsights"
  api_management_logger_name    = "apim-logger"
  resource_id                   = module.application_insights.id
  application_insights = {
    instrumentation_key = module.application_insights.instrumentation_key
  }
  sampling_percentage       = 100.0
  always_log_errors         = true
  log_client_ip             = true
  verbosity                 = "information"
  http_correlation_protocol = "W3C"
  tags                      = merge(local.resource_tags, local.timestamp_tag)
}