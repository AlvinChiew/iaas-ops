resource "aws_s3_bucket" "webapge_unika" {
  bucket = "unika.alvinchiew.com"
  tags = {
    Owner = "alvin"
    Team  = "infra"
  }
}

data "aws_iam_policy_document" "webapge_unika_allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.webapge_unika.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "webapge_unika" {
  bucket = aws_s3_bucket.webapge_unika.id
  policy = data.aws_iam_policy_document.webapge_unika_allow_public_access.json
}

resource "aws_s3_bucket_website_configuration" "webapge_unika" {
  bucket = aws_s3_bucket.webapge_unika.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}
