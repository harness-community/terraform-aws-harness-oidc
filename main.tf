resource "aws_iam_openid_connect_provider" "this" {
  url = "https://app.harness.io/ng/api/oidc/account/${var.harness_account_id}"

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [var.thumbprint]
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.this.arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "app.harness.io/ng/api/oidc/account/${var.harness_account_id}:aud"
      values = [
        "sts.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "this" {
  path                 = var.path
  name                 = var.name ? var.name : "oidc_harness_${var.harness_account_id}"
  description          = var.description
  assume_role_policy   = data.aws_iam_policy_document.this.json
  max_session_duration = var.max_session_duration
  permissions_boundary = var.permissions_boundary
}
