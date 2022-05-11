resource "aws_s3_bucket" "webpage_alvinchiew" {
  bucket = "alvinchiew.com"
  tags = {
    Owner = "alvin"
    Team  = "infra"
  }
}


data "aws_iam_policy_document" "webpage_alvinchiew_allow_public_access" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.webpage_alvinchiew.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "webpage_alvinchiew" {
  bucket = aws_s3_bucket.webpage_alvinchiew.id
  policy = data.aws_iam_policy_document.webpage_alvinchiew_allow_public_access.json
}

resource "aws_s3_bucket_website_configuration" "webpage_alvinchiew" {
  bucket = aws_s3_bucket.webpage_alvinchiew.bucket

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
