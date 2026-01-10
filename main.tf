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

  dynamic "additional_location" {
    for_each = try(var.additional_location, null) != null ? [var.additional_location] : []
    content {
      location             = additional_location.value.location
      capacity             = lookup(additional_location.value, "capacity", null)
      zones                = lookup(additional_location.value, "zones", [])
      public_ip_address_id = lookup(additional_location.value, "public_ip_address_id", null)
      dynamic "virtual_network_configuration" {
        for_each = lookup(additional_location.value, "virtual_network_configuration", null) != null ? [additional_location.value.virtual_network_configuration] : []
        content {
          subnet_id = virtual_network_configuration.value.subnet_id
        }
      }
      gateway_disabled = lookup(additional_location.value, "gateway_disabled", null)
    }
  }

  dynamic "certificate" {
    for_each = try(var.certificate, null) != null ? [var.certificate] : []
    content {
      encoded_certificate  = certificate.value.encoded_certificate
      store_name           = certificate.value.store_name
      certificate_password = lookup(certificate.value, "certificate_password", null)
    }
  }

  client_certificate_enabled = var.sku_name == "Consumption" ? try(var.client_certificate_enabled, null) : null

  dynamic "delegation" {
    for_each = try(var.delegation, null) != null ? [var.delegation] : []
    content {
      subscriptions_enabled     = lookup(delegation.value, "subscriptions_enabled", false)
      user_registration_enabled = lookup(delegation.value, "user_registration_enabled", false)
      url                       = lookup(delegation.value, "url", null)
      validation_key            = lookup(delegation.value, "validation_key", null)
    }
  }

  gateway_disabled = try(var.additional_location, null) != null ? try(var.gateway_disabled, null) : null
  min_api_version  = try(var.min_api_version, null)
  zones            = try(var.zones, [])

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
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