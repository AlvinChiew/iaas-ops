data "aws_iam_policy_document" "github_actions_policy_document" {
  statement {
    sid    = "AllowSpecifics"
    effect = "Allow"

    actions = [
      "ec2:*",
      "s3:*",
      "sqs:*",
      "sns:*",
      "iam:*",
      "sso:*",
      "identitystore:*",
      "elasticloadbalancing:*",
      "autoscaling:*",
      "cloudwatch:*",
      "route53:*",
      "ecr:*",
      "logs:*",
      "ecs:*",
      "application-autoscaling:*",
      "logs:*",
      "servicediscovery:*",
      "rds:*",
      "events:*",
      "ssm:DescribeParameters",
      "transfer:*",
      "cloudfront:CreateInvalidation",
      "dynamodb:*",
      "sagemaker:*"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "DenySpecifics"
    effect = "Deny"

    actions = [
      "iam:*Login*",
      "iam:*Group*",
      "iam:*Provider*",
      "aws-portal:*",
      "budgets:*",
      "config:*",
      "ec2:*ReservedInstances*",
      "ecr:Delete*",
      "s3:Delete*",
      "sqs:DeleteQueue",
      "sns:DeleteTopic",
      "servicediscovery:Delete*",
      "rds:Delete*",
      "events:Delete*",
      "transfer:Delete*",
      "dynamodb:DeleteTable",
      "sagemaker:Delete*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "github_actions_policy" {
  name   = "GitHubActionsPolicy"
  policy = data.aws_iam_policy_document.github_actions_policy_document.json
}

resource "aws_iam_user" "github_actions_user" {
  name = "github-actions"

  tags = {
    Owner = "Alvin"
  }
}

resource "aws_iam_user_policy_attachment" "github_actions_user_policy_attachment" {
  user       = aws_iam_user.github_actions_user.name
  policy_arn = aws_iam_policy.github_actions_policy.arn
}
