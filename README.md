# Module
[![GitHub tag](https://img.shields.io/github/tag/qbeyond/terraform-google-folder-hierarchy.svg)](https://registry.terraform.io/modules/qbeyond/folder-hierarchy/google/latest)
[![License](https://img.shields.io/github/license/qbeyond/terraform-google-folder-hierarchy.svg)](https://github.com/qbeyond/terraform-google-folder-hierarchy/blob/main/LICENSE)

----
<!-- BEGIN_TF_DOCS -->
This module create a folder hierarchy based on an tree input.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_folder.level_0](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_4](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_5](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_6](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_7](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_8](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |
| [google_folder.level_9](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hierarchy"></a> [hierarchy](#input\_hierarchy) | The hierarchy of folders to create. All keys need to be unique! | <pre>map(object({<br>    display_name = string<br>    childs = optional(map(object({<br>      display_name = string<br>      childs = optional(map(object({<br>        display_name = string<br>        childs = optional(map(object({<br>          display_name = string<br>          childs = optional(map(object({<br>            display_name = string<br>            childs = optional(map(object({<br>              display_name = string<br>              childs = optional(map(object({<br>                display_name = string<br>                childs = optional(map(object({<br>                  display_name = string<br>                  childs = optional(map(object({<br>                    display_name = string<br>                    childs = optional(map(object({<br>                      display_name = string<br>                    })))<br>                  })))<br>                })))<br>              })))<br>            })))<br>          })))<br>        })))<br>      })))<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_parent"></a> [parent](#input\_parent) | The resource name of the parent Folder or Organization. Must be of the form `folders/{folder_id}` or `organizations/{org_id}`. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folders"></a> [folders](#output\_folders) | Flat map of all created folders. Keys are identical to input keys. |
<!-- END_TF_DOCS -->

# Contribute

