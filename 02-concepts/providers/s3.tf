# THis will create two S3 buckets in different regions using multiple providers
resource "aws_s3_bucket" "abc" {
  bucket = "my-eu-west-1-bucket-123456"
}

# alias will change the provider to us-east-1 region
resource "aws_s3_bucket" "def" {
  bucket = "my-us-east-bucket-123456"
  provider = aws.us-east
}