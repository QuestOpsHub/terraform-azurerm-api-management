# @todo add all supported arguments
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
      backend_ssl30_enabled  = lookup(security.value, "backend_ssl30_enabled", false)
      backend_tls10_enabled  = lookup(security.value, "backend_tls10_enabled", false)
      backend_tls11_enabled  = lookup(security.value, "backend_tls11_enabled", false)
      frontend_ssl30_enabled = lookup(security.value, "frontend_ssl30_enabled", false)
      frontend_tls10_enabled = lookup(security.value, "frontend_tls10_enabled", false)
      frontend_tls11_enabled = lookup(security.value, "frontend_tls11_enabled", false)
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
  always_log_errors         = var.always_log_errors
  http_correlation_protocol = var.http_correlation_protocol
  log_client_ip             = var.log_client_ip
  sampling_percentage       = var.sampling_percentage
  verbosity                 = var.verbosity
}