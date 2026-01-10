#----------------
# API Management
#----------------
resource "azurerm_api_management" "api_management" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  publisher_name             = var.publisher_name
  publisher_email            = var.publisher_email
  sku_name                   = var.sku_name
  client_certificate_enabled = var.sku_name == "Consumption" ? try(var.client_certificate_enabled, null) : null
  gateway_disabled           = try(var.additional_location, null) != null ? try(var.gateway_disabled, null) : null
  min_api_version            = try(var.min_api_version, null)
  zones                      = try(var.zones, [])

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  security {
    backend_ssl30_enabled  = try(var.security.backend_ssl30_enabled, false)
    backend_tls10_enabled  = try(var.security.backend_tls10_enabled, false)
    backend_tls11_enabled  = try(var.security.backend_tls11_enabled, false)
    frontend_ssl30_enabled = try(var.security.frontend_ssl30_enabled, false)
    frontend_tls10_enabled = try(var.security.frontend_tls10_enabled, false)
    frontend_tls11_enabled = try(var.security.frontend_tls11_enabled, false)
  }

  public_ip_address_id          = var.sku_name == "Premium" || var.sku_name == "Developer" ? try(var.public_ip_address_id, null) : null
  public_network_access_enabled = try(var.public_network_access_enabled, true)
  virtual_network_type          = try(var.virtual_network_type, "None")

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}