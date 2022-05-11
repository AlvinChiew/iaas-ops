output "s3_unika_url" {
  value = aws_s3_bucket_website_configuration.webpage_unika.website_endpoint
}

output "unika_domain_name" {
  value = aws_s3_bucket.webpage_unika.website_domain
}

output "unika_zone_id" {
  value = aws_s3_bucket.webpage_unika.hosted_zone_id
}
