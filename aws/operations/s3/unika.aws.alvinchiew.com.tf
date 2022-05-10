resource "aws_s3_bucket" "webpage_unika" {
  bucket        = "unika.aws.alvinchiew.com"
  force_destroy = true
  tags = {
    Owner = "alvin"
    Team  = "infra"
  }
}

data "aws_iam_policy_document" "webpage_unika_allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.webpage_unika.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "webpage_unika" {
  bucket = aws_s3_bucket.webpage_unika.id
  policy = data.aws_iam_policy_document.webpage_unika_allow_public_access.json
}

resource "aws_s3_bucket_website_configuration" "webpage_unika" {
  bucket = aws_s3_bucket.webpage_unika.bucket

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
