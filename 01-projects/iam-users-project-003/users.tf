locals {
  user_from_yml = yamldecode(file("${path.module}/user-roles.yml")).users
}

resource "aws_iam_user" "users" {
  for_each = toset(local.user_from_yml[*].username)
  name     = each.value
}

resource "aws_iam_user_login_profile" "users_login_profile" {
  for_each                = aws_iam_user.users
  user                    = each.value.name
  password_length         = 8
  password_reset_required = true

  lifecycle {
    ignore_changes = [
      password_reset_required,
      password_length,
      pgp_key
    ]
  }
}
