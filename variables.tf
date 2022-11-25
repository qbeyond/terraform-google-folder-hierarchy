variable "hierarchy" {
  description = "The hierarchy of folders to create. All keys need to be unique!"
  type = map(object({
    display_name = string
    childs = optional(map(object({
      display_name = string
      childs = optional(map(object({
        display_name = string
        childs = optional(map(object({
          display_name = string
          childs = optional(map(object({
            display_name = string
            childs = optional(map(object({
              display_name = string
              childs = optional(map(object({
                display_name = string
                childs = optional(map(object({
                  display_name = string
                  childs = optional(map(object({
                    display_name = string
                    childs = optional(map(object({
                      display_name = string
                    })))
                  })))
                })))
              })))
            })))
          })))
        })))
      })))
    })))
  }))
  validation {
    condition = length(flatten([
      for k0, v0 in var.hierarchy :
      [k0, [for k1, v1 in coalesce(v0.childs, {}) :
        [k1, [for k2, v2 in coalesce(v1.childs, {}) :
          [k2, [for k3, v3 in coalesce(v2.childs, {}) :
            [k3, [for k4, v4 in coalesce(v3.childs, {}) :
              [k4, [for k5, v5 in coalesce(v4.childs, {}) :
                [k5, [for k6, v6 in coalesce(v5.childs, {}) :
                  [k6, [for k7, v7 in coalesce(v6.childs, {}) :
                    [k7, [for k8, v8 in coalesce(v7.childs, {}) :
                      [k8, [for k9, v9 in coalesce(v8.childs, {}) :
                        [k9]
                        ]
                      ]]
                    ]]
                  ]]
                ]]
              ]]
            ]]
          ]]
        ]]
      ]
      ])) == length(distinct(flatten([
        for k0, v0 in var.hierarchy :
        [k0, [for k1, v1 in coalesce(v0.childs, {}) :
          [k1, [for k2, v2 in coalesce(v1.childs, {}) :
            [k2, [for k3, v3 in coalesce(v2.childs, {}) :
              [k3, [for k4, v4 in coalesce(v3.childs, {}) :
                [k4, [for k5, v5 in coalesce(v4.childs, {}) :
                  [k5, [for k6, v6 in coalesce(v5.childs, {}) :
                    [k6, [for k7, v7 in coalesce(v6.childs, {}) :
                      [k7, [for k8, v8 in coalesce(v7.childs, {}) :
                        [k8, [for k9, v9 in coalesce(v8.childs, {}) :
                          [k9]
                          ]
                        ]]
                      ]]
                    ]]
                  ]]
                ]]
              ]]
            ]]
          ]]
        ]
    ])))
    error_message = "All keys in the whole hierarchy must be unique!"
  }

  validation {
    error_message = "Google supports only 10 nested folders!"
    condition = alltrue(flatten([
      for k0, v0 in var.hierarchy :
      [for k1, v1 in coalesce(v0.childs, {}) :
        [for k2, v2 in coalesce(v1.childs, {}) :
          [for k3, v3 in coalesce(v2.childs, {}) :
            [for k4, v4 in coalesce(v3.childs, {}) :
              [for k5, v5 in coalesce(v4.childs, {}) :
                [for k6, v6 in coalesce(v5.childs, {}) :
                  [for k7, v7 in coalesce(v6.childs, {}) :
                    [for k8, v8 in coalesce(v7.childs, {}) :
                      [for k9, v9 in coalesce(v8.childs, {}) :
                        [for k10, v10 in try(coalesce(v9.childs, {}), {}) :
                          false
                        ]
                      ]
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
      ]
    ]))
  }
}

variable "parent" {
  description = "Parent in folders/folder_id or organizations/org_id format."
  type        = string
  validation {
    condition     = var.parent == null || can(regex("(organizations|folders)/[0-9]+", var.parent))
    error_message = "Parent must be of the form folders/folder_id or organizations/organization_id."
  }
}
