resource "aws_s3_bucket" "alvinchiew_ops" {
  bucket = "alvinchiew-ops"
  tags = {
    Owner = "alvin"
    Team  = "infra"
  }
}

resource "aws_s3_bucket_versioning" "alvinchiew_ops_versioning" {
  bucket = aws_s3_bucket.alvinchiew_ops.id
  versioning_configuration {
    status = "Enabled"
  }
}
