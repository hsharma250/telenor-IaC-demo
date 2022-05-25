output "ids" {
  description = "Folder ids."
  value       = values(module.folders_env)[*].ids
}

# output "names" {
#   description = "Folder names."
#   value       = module.folders_env.names
# }

output "ids_list" {
  description = "List of folder ids."
  value       = values(module.folders_env)[*].ids_list
}