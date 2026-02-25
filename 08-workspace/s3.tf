resource "aws_s3_bucket" "name" {
  count  = var.bucket_count
  bucket = "workspace-bucket-${terraform.workspace}-${count.index}-${random_id.bucket_id.hex}"
}

resource "random_id" "bucket_id" {
  byte_length = 4
}