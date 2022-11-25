output "folders" {
  value = merge(
    google_folder.level_0,
    google_folder.level_1,
    google_folder.level_2,
    google_folder.level_3,
    google_folder.level_4,
    google_folder.level_5,
    google_folder.level_6,
    google_folder.level_7,
    google_folder.level_8,
    google_folder.level_9
  )
}
