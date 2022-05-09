output "s3_unika_url" {
  value = aws_s3_bucket_website_configuration.webpage_unika.website_endpoint
}
