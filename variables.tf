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
                        [k9, [for k10, v10 in coalesce(v9.childs, {}) :
                          k10]
                        ]]
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
                          [k9, [for k10, v10 in coalesce(v9.childs, {}) :
                            k10]
                          ]]
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
}
