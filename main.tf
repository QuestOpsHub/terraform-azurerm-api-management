# @todo add all supported arguments in this module
#----------------
# API Management
#----------------
resource "azurerm_api_management" "api_management" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name
  min_api_version     = try(var.min_api_version, "2019-12-01")

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  dynamic "security" {
    for_each = try(var.security, {}) != {} ? [var.security] : []
    content {
      enable_backend_ssl30  = lookup(security.value, "enable_backend_ssl30", false)
      enable_backend_tls10  = lookup(security.value, "enable_backend_tls10", false)
      enable_backend_tls11  = lookup(security.value, "enable_backend_tls11", false)
      enable_frontend_ssl30 = lookup(security.value, "enable_frontend_ssl30", false)
      enable_frontend_tls10 = lookup(security.value, "enable_frontend_tls10", false)
      enable_frontend_tls11 = lookup(security.value, "enable_frontend_tls11", false)
    }
  }

  public_network_access_enabled = try(var.public_network_access_enabled, true)

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}

#-----------------------
# API Management Policy
#-----------------------
resource "azurerm_api_management_policy" "api_management_policy" {
  api_management_id = azurerm_api_management.api_management.id
  xml_content       = file("${path.module}/scripts/global_policy_${var.environment}.xml")
}

#-----------------------
# API Management Logger
#-----------------------
resource "azurerm_api_management_logger" "api_management_logger" {
  name                = var.api_management_logger_name
  api_management_name = azurerm_api_management.api_management.name
  resource_group_name = azurerm_api_management.api_management.resource_group_name
  resource_id         = var.resource_id

  application_insights {
    instrumentation_key = var.instrumentation_key
  }
}

#---------------------------
# API Management Diagnostic
#---------------------------
resource "azurerm_api_management_diagnostic" "api_management_diagnostic" {
  resource_group_name       = azurerm_api_management.api_management.resource_group_name
  api_management_name       = azurerm_api_management.api_management.name
  api_management_logger_id  = azurerm_api_management_logger.api_management_logger.id
  identifier                = var.identifier
  sampling_percentage       = var.sampling_percentage
  always_log_errors         = var.always_log_errors
  log_client_ip             = var.log_client_ip
  verbosity                 = var.verbosity
  http_correlation_protocol = var.http_correlation_protocol
}