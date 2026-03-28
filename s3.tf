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
}

resource "aws_s3_bucket_public_access_block" "site_bucket" {
  bucket = aws_s3_bucket.site_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
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
