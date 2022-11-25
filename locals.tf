locals {
  flattened_hierachy = merge(flatten(
    [for k0, v0 in var.hierarchy :
      [{ "${k0}" = merge(v0, { parent = null }) },
        [for k1, v1 in coalesce(v0.childs, {}) :
          [{ "${k1}" = merge(v1, { parent = k0 }) },
            [for k2, v2 in coalesce(v1.childs, {}) :
              [{ "${k2}" = merge(v2, { parent = k1 }) },
                [for k3, v3 in coalesce(v2.childs, {}) :
                  [{ "${k3}" = merge(v3, { parent = k2 }) },
                    [for k4, v4 in coalesce(v3.childs, {}) :
                      [{ "${k4}" = merge(v4, { parent = k3 }) },
                        [for k5, v5 in coalesce(v4.childs, {}) :
                          [{ "${k5}" = merge(v5, { parent = k4 }) },
                            [for k6, v6 in coalesce(v5.childs, {}) :
                              [{ "${k6}" = merge(v6, { parent = k5 }) },
                                [for k7, v7 in coalesce(v6.childs, {}) :
                                  [{ "${k7}" = merge(v7, { parent = k6 }) },
                                    [for k8, v8 in coalesce(v7.childs, {}) :
                                      [{ "${k8}" = merge(v8, { parent = k7 }) },
                                        [for k9, v9 in coalesce(v8.childs, {}) :
                                          [{ "${k9}" = merge(v9, { parent = k8 }) }]
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
                    ]
                  ]
                ]
              ]
            ]
          ]
        ]
  ]])...)
}

locals {
  level_0 = { for key, value in local.flattened_hierachy :
    key => value
    if value.parent == null
  }
  level_1 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_0), value.parent), false)
  }

  level_2 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_1), value.parent), false)
  }

  level_3 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_2), value.parent), false)
  }

  level_4 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_3), value.parent), false)
  }

  //repeat this level until index 10 

  level_5 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_4), value.parent), false)
  }

  //repeat this level until index 10 

  level_6 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_5), value.parent), false)
  }

  //repeat this level until index 10 

  level_7 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_6), value.parent), false)
  }

  level_8 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_7), value.parent), false)
  }

  level_9 = { for key, value in local.flattened_hierachy :
    key => value
    if try(contains(keys(local.level_8), value.parent), false)
  }
}
