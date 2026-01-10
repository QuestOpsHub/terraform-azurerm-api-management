#----------------
# API Management
#----------------
output "name" {
  description = "The Name of the API Management Service."
  value       = azurerm_api_management.api_management.name
}

output "id" {
  description = "The ID of the API Management Service."
  value       = azurerm_api_management.api_management.id
}

output "portal_url" {
  description = "The URL for the Publisher Portal associated with this API Management service."
  value       = azurerm_api_management.api_management.portal_url
}

#-----------------------
# API Management Logger
#-----------------------
output "logger_id" {
  description = "The ID of the API Management Logger."
  value       = azurerm_api_management_logger.api_management_logger.id
}