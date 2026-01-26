

resource "random_id" "name" {
  byte_length = 8
}

resource "aws_s3_bucket" "my-first-bucket" {
  bucket = lower("${random_id.name.id}-my-first-bucket")
}

output "s3-bucket-name" {
  value = aws_s3_bucket.my-first-bucket.bucket
}
