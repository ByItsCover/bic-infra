# BIC-Site

resource "aws_s3_bucket" "site_bucket" {
  bucket        = var.site_bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "bic_site" {
  bucket = aws_s3_bucket.site_bucket.id

  index_document {
    suffix = var.site_bucket_index_doc
  }

  error_document {
    key = var.site_bucket_index_doc
  }
}

resource "aws_s3_bucket_ownership_controls" "site_bucket" {
  bucket = aws_s3_bucket.site_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "site_bucket" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "site_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.site_bucket,
    aws_s3_bucket_public_access_block.site_bucket
  ]

  bucket = aws_s3_bucket.site_bucket.id
  acl    = "private"
}

# Vector DB

resource "aws_s3_bucket" "cover_bucket" {
  bucket        = var.cover_bucket_name
  force_destroy = true
}

resource "aws_s3_object" "coverdb" {
  bucket = aws_s3_bucket.cover_bucket.id
  key    = "${var.cover_db_folder_name}/"
}
