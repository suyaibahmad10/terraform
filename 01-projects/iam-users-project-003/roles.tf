locals {
  role_policies = {
    readonly = [
      "ReadOnlyAccess"
    ]
    admin = [
      "AdministratorAccess"
    ]
    auditor = [
      "SecurityAudit"
    ]
    devloper = [
      "AmazonVPCFullAccess",
      "AmazonS3FullAccess",
      "AmazonEC2FullAccess"
    ]
  }
}

resource "aws_iam_role" "iam_roles" {
  for_each = local.role_policies

  name               = each.key
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}