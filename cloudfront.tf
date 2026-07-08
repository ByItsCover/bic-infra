resource "aws_cloudfront_origin_access_control" "current" {
  name                              = "OAC ${aws_s3_bucket.site_bucket.id}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_origin_request_policy" "cdn" {
  name    = "Custom-CORS-Request-Policy"
  comment = "Policy for custom origin request with CORS"
  cookies_config {
    cookie_behavior = "none"
  }
  headers_config {
    header_behavior = "whitelist"
    headers {
      items = ["Origin"]
    }
  }
  query_strings_config {
    query_string_behavior = "none"
  }
}

resource "aws_cloudfront_response_headers_policy" "cdn" {
  name    = "Custom-CORS-Response-Policy"
  comment = "Policy for custom response headers with CORS"

  cors_config {
    access_control_allow_credentials = false

    access_control_allow_headers {
      items = ["content-type"]
    }
    access_control_allow_methods {
      items = ["GET", "HEAD", "OPTIONS"]
    }
    access_control_allow_origins {
      items = ["https://${var.domain_name}", "https://www.${var.domain_name}"]
    }

    origin_override = true
  }
}

resource "aws_cloudfront_cache_policy" "cdn" {
  name        = "Custom-CachingOptimized-Policy"
  comment     = "Policy with caching enabled. Supports Gzip and Brotli compression."
  default_ttl = 86400
  max_ttl     = 31536000
  min_ttl     = 1

  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true

    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "whitelist"
      headers {
        items = ["Origin"]
      }
    }
    query_strings_config {
      query_string_behavior = "none"
    }
  }
}
