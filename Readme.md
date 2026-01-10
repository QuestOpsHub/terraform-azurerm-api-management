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
| [azurerm_api_management_diagnostic.api_management_diagnostic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_diagnostic) | resource |
| [azurerm_api_management_logger.api_management_logger](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_logger) | resource |
| [azurerm_api_management_policy.api_management_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_always_log_errors"></a> [always\_log\_errors](#input\_always\_log\_errors) | (Optional) Always log errors. Send telemetry if there is an erroneous condition, regardless of sampling settings. | `bool` | n/a | yes |
| <a name="input_api_management_logger_name"></a> [api\_management\_logger\_name](#input\_api\_management\_logger\_name) | value | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | ----------------------- API Management Policy ----------------------- | `string` | `"dev"` | no |
| <a name="input_http_correlation_protocol"></a> [http\_correlation\_protocol](#input\_http\_correlation\_protocol) | (Optional) The HTTP Correlation Protocol to use. Possible values are None, Legacy or W3C. | `string` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | (Required) The diagnostic identifier for the API Management Service. At this time the supported values are applicationinsights and azuremonitor. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | (Optional) An identity block | `any` | `{}` | no |
| <a name="input_instrumentation_key"></a> [instrumentation\_key](#input\_instrumentation\_key) | (Optional) The instrumentation key used to push data to Application Insights. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) The Azure location where the API Management Service exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_log_client_ip"></a> [log\_client\_ip](#input\_log\_client\_ip) | (Optional) Log client IP address. | `bool` | n/a | yes |
| <a name="input_min_api_version"></a> [min\_api\_version](#input\_min\_api\_version) | (Optional) The version which the control plane API calls to API Management service are limited with version equal to or newer than. | `string` | `"2019-12-01"` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the API Management Service. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is public access to the service allowed? Defaults to true. | `bool` | `true` | no |
| <a name="input_publisher_email"></a> [publisher\_email](#input\_publisher\_email) | (Required) The email of publisher/company. | `string` | n/a | yes |
| <a name="input_publisher_name"></a> [publisher\_name](#input\_publisher\_name) | (Required) The name of publisher/company. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the Resource Group in which the API Management Service should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | (Optional) The target resource id which will be linked in the API-Management portal page. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sampling_percentage"></a> [sampling\_percentage](#input\_sampling\_percentage) | (Optional) Sampling (%). For high traffic APIs, please read this documentation to understand performance implications and log sampling. Valid values are between 0.0 and 100.0. | `number` | n/a | yes |
| <a name="input_security"></a> [security](#input\_security) | (Optional) A security block | `any` | `{}` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Required) sku\_name is a string consisting of two parts separated by an underscore(\_). The first part is the name, valid values include: Consumption, Developer, Basic, BasicV2, Standard, StandardV2, Premium and PremiumV2. The second part is the capacity (e.g. the number of deployed units of the sku), which must be a positive integer (e.g. Developer\_1). | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(any)` | `{}` | no |
| <a name="input_verbosity"></a> [verbosity](#input\_verbosity) | (Optional) Logging verbosity. Possible values are verbose, information or error. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the API Management Service. |
| <a name="output_logger_id"></a> [logger\_id](#output\_logger\_id) | The ID of the API Management Logger. |
| <a name="output_name"></a> [name](#output\_name) | The Name of the API Management Service. |
| <a name="output_portal_url"></a> [portal\_url](#output\_portal\_url) | The URL for the Publisher Portal associated with this API Management service. |
