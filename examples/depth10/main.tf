module "this" {
  source = "../.."
  parent = "organizations/596332049588"
  hierarchy = {
    "key" = {
      childs = {
        "key1" = {
          childs = {
            "key2" = {
              childs = {
                "key3" = {
                  childs = {
                    "key4" = {
                      childs = {
                        "key5" = {
                          childs = {
                            "key6" = {
                              childs = {
                                "key7" = {
                                  childs = {
                                    "key8" = {
                                      childs = {
                                        "key9" = {
                                          display_name = "value9"
                                        }
                                      }
                                      display_name = "value8"
                                    }
                                  }
                                  display_name = "value7"
                                }
                              }
                              display_name = "value6"
                            }
                          }
                          display_name = "value5"
                        }
                      }
                      display_name = "value4"
                    }
                  }
                  display_name = "value3"
                }
              }
              display_name = "value2"
            }
          }
          display_name = "value1"
        }
      }
      display_name = "value"
    }
  }
}
