output "ids" {
  description = "Folder ids."
  value       = values(module.folders_env)[*].ids
}

output "names" {
  description = "Folder names."
  value       = values(module.folders_env)[*].names
}

output "names_list" {
  description = "Folder names."
  value       = values(module.folders_env)[*].names_list
}

output "ids_list" {
  description = "List of folder ids."
  value       = values(module.folders_env)[*].ids_list
}