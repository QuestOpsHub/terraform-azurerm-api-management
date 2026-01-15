#----------------
# API Management
#----------------
variable "name" {
  description = " (Required) The name of the API Management Service. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) The Azure location where the API Management Service exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the API Management Service should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "publisher_name" {
  description = "(Required) The name of publisher/company."
  type        = string
}

variable "publisher_email" {
  description = "(Required) The email of publisher/company."
  type        = string
}

variable "sku_name" {
  description = " (Required) sku_name is a string consisting of two parts separated by an underscore(_). The first part is the name, valid values include: Consumption, Developer, Basic, BasicV2, Standard, StandardV2, Premium and PremiumV2. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer_1)."
  type        = string
}

variable "min_api_version" {
  description = "(Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than."
  type        = string
  default     = "2019-12-01"
}

variable "identity" {
  description = "(Optional) An identity block"
  type        = any
  default     = {}
}

variable "security" {
  description = " (Optional) A security block"
  type        = any
  default     = {}
}

variable "public_network_access_enabled" {
  description = "(Optional) Is public access to the service allowed? Defaults to true."
  type        = bool
  default     = true
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}

#-----------------------
# API Management Policy
#-----------------------
variable "environment" {
  type    = string
  default = "dev"
}

#-----------------------
# API Management Logger
#-----------------------
variable "api_management_logger_name" {
  description = "(Required) The name of this Logger, which must be unique within the API Management Service. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_id" {
  description = "(Optional) The target resource id which will be linked in the API-Management portal page. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "application_insights" {
  description = "(Optional) An application_insights block as documented below."
  default     = {}
}

#---------------------------
# API Management Diagnostic
#---------------------------
variable "identifier" {
  description = "(Required) The diagnostic identifier for the API Management Service. At this time the supported values are applicationinsights and azuremonitor. Changing this forces a new resource to be created."
  type        = string
}

variable "always_log_errors" {
  description = "(Optional) Always log errors. Send telemetry if there is an erroneous condition, regardless of sampling settings."
  type        = bool
  default     = null
}

variable "http_correlation_protocol" {
  description = "(Optional) The HTTP Correlation Protocol to use. Possible values are None, Legacy or W3C."
  type        = string
  default     = null
}

variable "log_client_ip" {
  description = "(Optional) Log client IP address."
  type        = bool
  default     = null
}

variable "sampling_percentage" {
  description = "(Optional) Sampling (%). For high traffic APIs, please read this documentation to understand performance implications and log sampling. Valid values are between 0.0 and 100.0."
  type        = number
  default     = null
}

variable "verbosity" {
  description = "(Optional) Logging verbosity. Possible values are verbose, information or error."
  type        = string
  default     = null
}