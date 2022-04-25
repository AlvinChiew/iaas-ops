resource "aws_ssoadmin_permission_set" "infra_ro_permission_set" {
  name             = "InfraReadOnly"
  description      = "Infra Read Only Access"
  instance_arn     = tolist(data.aws_ssoadmin_instances.alvinchiew_sso_instances.arns)[0]
  session_duration = "PT1H"

  tags = {
    Owner = "Alvin"
    Team  = "infra"
  }
}

resource "aws_ssoadmin_managed_policy_attachment" "infra_ro_managed_policy_attachment" {
  managed_policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  instance_arn       = aws_ssoadmin_permission_set.infra_ro_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.infra_ro_permission_set.arn
}

resource "aws_ssoadmin_permission_set" "infra_rw_permission_set" {
  name             = "InfraAdmin"
  description      = "Infra Read Write Access"
  instance_arn     = tolist(data.aws_ssoadmin_instances.alvinchiew_sso_instances.arns)[0]
  session_duration = "PT1H"

  tags = {
    Owner = "indra"
    Team  = "infra"
  }
}

data "aws_iam_policy_document" "infra_rw_iam_policy_document" {
  statement {
    sid       = "infraAdminPolicy"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "infra_rw_permission_set_inline_policy" {
  inline_policy      = data.aws_iam_policy_document.infra_rw_iam_policy_document.json
  instance_arn       = aws_ssoadmin_permission_set.infra_rw_permission_set.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.infra_rw_permission_set.arn
}
