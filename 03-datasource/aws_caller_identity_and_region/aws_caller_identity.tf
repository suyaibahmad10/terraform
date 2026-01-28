data "aws_caller_identity" "current" {}

output "account_details" {
  value = data.aws_caller_identity.current
}