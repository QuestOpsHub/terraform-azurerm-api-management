## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_api_management.api_management](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_location"></a> [additional\_location](#input\_additional\_location) | n/a | `any` | `null` | no |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | n/a | `any` | `null` | no |
| <a name="input_client_certificate_enabled"></a> [client\_certificate\_enabled](#input\_client\_certificate\_enabled) | n/a | `any` | `null` | no |
| <a name="input_delegation"></a> [delegation](#input\_delegation) | n/a | `any` | `null` | no |
| <a name="input_gateway_disabled"></a> [gateway\_disabled](#input\_gateway\_disabled) | n/a | `any` | `null` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | n/a | `any` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_min_api_version"></a> [min\_api\_version](#input\_min\_api\_version) | n/a | `any` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | ---------------- API Management ---------------- | `any` | n/a | yes |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | n/a | `any` | `null` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | n/a | `any` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | n/a | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `any` | `null` | no |
| <a name="input_virtual_network_type"></a> [virtual\_network\_type](#input\_virtual\_network\_type) | n/a | `string` | `"None"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `list` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ---------------- API Management ---------------- |
| <a name="output_name"></a> [name](#output\_name) | n/a |
