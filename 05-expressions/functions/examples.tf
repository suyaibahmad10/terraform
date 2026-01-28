locals {
  name = "Lauro Muller"
  age = 15
}

output "uppercase" {
  value = upper(local.name)
}

output "lowercase" {
  value = lower(local.name)
}

output "startswith" {
  value = startswith(lower(local.name), "john")
}

output "read_users_yaml" {
  value = yamldecode(file("${path.module}/users.yml"))
}