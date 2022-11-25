/**
 * This module create a folder hierarchy based on an tree input.
 *
 * 
 */

resource "google_folder" "level_0" {
  for_each     = local.level_0
  display_name = each.value.display_name
  parent       = var.parent
}

resource "google_folder" "level_1" {
  for_each     = local.level_1
  display_name = each.value.display_name
  parent       = google_folder.level_0[each.value.parent].name
}


resource "google_folder" "level_2" {
  for_each     = local.level_2
  display_name = each.value.display_name
  parent       = google_folder.level_1[each.value.parent].name
}

resource "google_folder" "level_3" {
  for_each     = local.level_3
  display_name = each.value.display_name
  parent       = google_folder.level_2[each.value.parent].name
}

resource "google_folder" "level_4" {
  for_each     = local.level_4
  display_name = each.value.display_name
  parent       = google_folder.level_3[each.value.parent].name
}

resource "google_folder" "level_5" {
  for_each     = local.level_5
  display_name = each.value.display_name
  parent       = google_folder.level_4[each.value.parent].name
}

resource "google_folder" "level_6" {
  for_each     = local.level_6
  display_name = each.value.display_name
  parent       = google_folder.level_5[each.value.parent].name
}

resource "google_folder" "level_7" {
  for_each     = local.level_7
  display_name = each.value.display_name
  parent       = google_folder.level_6[each.value.parent].name
}

resource "google_folder" "level_8" {
  for_each     = local.level_8
  display_name = each.value.display_name
  parent       = google_folder.level_7[each.value.parent].name
}

resource "google_folder" "level_9" {
  for_each     = local.level_9
  display_name = each.value.display_name
  parent       = google_folder.level_8[each.value.parent].name
}
