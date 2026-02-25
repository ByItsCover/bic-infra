resource "aws_s3_bucket" "cover_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = true
}

resource "aws_s3_object" "coverdb" {
  bucket = aws_s3_bucket.cover_bucket.id
  key    = "${var.db_folder_name}/"
}
