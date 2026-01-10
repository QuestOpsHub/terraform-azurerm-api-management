#----------------
# API Management
#----------------
variable "name" {}

variable "location" {}

variable "resource_group_name" {}

variable "publisher_name" {}

variable "publisher_email" {}

variable "sku_name" {}

variable "client_certificate_enabled" {
  default = null
}

variable "gateway_disabled" {
  default = null
}

variable "min_api_version" {
  default = null
}

variable "zones" {
  default = []
}

variable "identity" {
  default = null
}

variable "public_ip_address_id" {
  default = null
}

variable "public_network_access_enabled" {
  default = true
}

variable "virtual_network_type" {
  default = "None"
}

variable "tags" {
  default = null
}