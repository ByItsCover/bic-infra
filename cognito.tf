resource "aws_cognito_user_pool" "auth_pool" {
  name = "auth-pool"

  alias_attributes         = ["email"]
  auto_verified_attributes = ["email"]

  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  verification_message_template {
    email_message = "Please use the following code: {####}"
    email_subject = "Your Verification Code"
  }

  password_policy {
    minimum_length    = var.password_req.min_length
    require_uppercase = var.password_req.req_upper
    require_lowercase = var.password_req.req_lower
    require_numbers   = var.password_req.req_numbers
    require_symbols   = var.password_req.req_symbols
  }

  schema {
    name                = "email"
    attribute_data_type = "String"
    mutable             = true
    required            = true

    string_attribute_constraints {

      min_length = var.email_req.min_length
      max_length = var.email_req.max_length
    }
  }

  schema {
    name                = "uid"
    attribute_data_type = "String"
    required            = true
    mutable             = false

    string_attribute_constraints {
      min_length = var.uid_req.min_length
      max_length = var.uid_req.max_length
    }
  }
}
