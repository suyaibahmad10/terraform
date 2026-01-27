output "se-bucket-name" {
  value = aws_s3_bucket.static-website-bucket.bucket
}


output "static_website_endpoint" {
  value = "http://${aws_s3_bucket_website_configuration.static-website-bucket-website-config.website_endpoint}"
}
