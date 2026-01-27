resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# create a bucket
resource "aws_s3_bucket" "static-website-bucket" {
  bucket = "terraform-static-website-002-${random_id.bucket_suffix.hex}"

  tags = {
    Name      = "static-website-bucket-002"
    ManagedBy = "Terraform"
  }

}

# Configure the bucket to allow public access
resource "aws_s3_bucket_public_access_block" "static-website-bucket-public-access" {
  bucket                  = aws_s3_bucket.static-website-bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket policy to allow public read access to all objects in the bucket
resource "aws_s3_bucket_policy" "static-website-bucket-policy" {
  bucket = aws_s3_bucket.static-website-bucket.id

  policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        "Effect" : "Allow",
        "Principal" : "*",
        "Sid" : "PublicReadGetObject",
        "Action" : "s3:GetObject",
        "Resource" : "${aws_s3_bucket.static-website-bucket.arn}/*"
      }
    ]
  })
}

# "aws_s3_bucket_website_configuration" Terraform resource is used to manage the website hosting settings for an S3 bucket, 
# such as the index and error documents, or to configure all requests to be redirected. 
resource "aws_s3_bucket_website_configuration" "static-website-bucket-website-config" {
  bucket = aws_s3_bucket.static-website-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

# Upload index.html to the S3 bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.static-website-bucket.id
  key          = "index.html"
  source       = "build/index.html"
  content_type = "text/html"
  etag         = filemd5("build/index.html")
}

# Upload error.html to the S3 bucket
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.static-website-bucket.id
  key          = "error.html"
  source       = "build/error.html"
  content_type = "text/html"
  etag         = filemd5("build/error.html")
}   