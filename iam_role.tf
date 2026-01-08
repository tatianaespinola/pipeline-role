# -------------------------------
# TRUST POLICY (quem assume a role)
# -------------------------------
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [
        "glue.amazonaws.com",
        "ec2.amazonaws.com",
        "s3.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

# ----------------------------------
# PERMISSION POLICY (o que a role pode fazer)
# ----------------------------------
data "aws_iam_policy_document" "permissions_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
      "glue:*",
      "logs:*",
      "cloudwatch:*"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.role_name}-inline-policy"
  role  = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.permissions_policy.json
}
