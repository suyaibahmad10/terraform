output "users" {
  value = local.user_from_yml
}

output "passwords" {
  sensitive = true
  value     = { for user, user_login in aws_iam_user_login_profile.users_login_profile : user => user_login.password }
}