# Terraform Infra

> Manages general terraform resources, including DB, Container Registry, and IAM Roles

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.search_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_cloudfront_cache_policy.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |
| [aws_cloudfront_origin_access_control.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_cloudfront_origin_request_policy.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_request_policy) | resource |
| [aws_ecr_lifecycle_policy.embed_server_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.library_search_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.listopia_parser_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.embed_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.library_search](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.listopia_parser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_iam_instance_profile.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.batch_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.batch_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_ssm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_function_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_s3_bucket.cover_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.s3_allow_full_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.bic_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.coverdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_security_group.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sqs_queue.embed_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.embed_queue_deadletter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_redrive_allow_policy.embed_queue_redrive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |
| [aws_vpc_security_group_egress_rule.batch_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_ecr_lifecycle_policy_document.expiry_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_lifecycle_policy_document) | data source |
| [aws_iam_policy_document.batch_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_function_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_full_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_cover_bucket_name"></a> [cover\_bucket\_name](#input\_cover\_bucket\_name) | AWS S3 Cover bucket name | `string` | n/a | yes |
| <a name="input_cover_db_folder_name"></a> [cover\_db\_folder\_name](#input\_cover\_db\_folder\_name) | AWS S3 Cover DB folder name | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for site | `string` | n/a | yes |
| <a name="input_site_bucket_index_doc"></a> [site\_bucket\_index\_doc](#input\_site\_bucket\_index\_doc) | Index document file name within site S3 bucket | `string` | `"index.html"` | no |
| <a name="input_site_bucket_name"></a> [site\_bucket\_name](#input\_site\_bucket\_name) | AWS S3 BIC Site bucket name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gw_arn"></a> [api\_gw\_arn](#output\_api\_gw\_arn) | n/a |
| <a name="output_api_gw_id"></a> [api\_gw\_id](#output\_api\_gw\_id) | n/a |
| <a name="output_batch_service_role_arn"></a> [batch\_service\_role\_arn](#output\_batch\_service\_role\_arn) | n/a |
| <a name="output_batch_sg_id"></a> [batch\_sg\_id](#output\_batch\_sg\_id) | n/a |
| <a name="output_cf_access_control_id"></a> [cf\_access\_control\_id](#output\_cf\_access\_control\_id) | n/a |
| <a name="output_cf_cache_policy_id"></a> [cf\_cache\_policy\_id](#output\_cf\_cache\_policy\_id) | n/a |
| <a name="output_cf_request_policy_id"></a> [cf\_request\_policy\_id](#output\_cf\_request\_policy\_id) | n/a |
| <a name="output_ecs_execution_role_arn"></a> [ecs\_execution\_role\_arn](#output\_ecs\_execution\_role\_arn) | n/a |
| <a name="output_ecs_instance_role_arn"></a> [ecs\_instance\_role\_arn](#output\_ecs\_instance\_role\_arn) | n/a |
| <a name="output_embed_server_ecr_name"></a> [embed\_server\_ecr\_name](#output\_embed\_server\_ecr\_name) | n/a |
| <a name="output_lambda_function_role_arn"></a> [lambda\_function\_role\_arn](#output\_lambda\_function\_role\_arn) | n/a |
| <a name="output_library_search_ecr_name"></a> [library\_search\_ecr\_name](#output\_library\_search\_ecr\_name) | n/a |
| <a name="output_listopia_parser_ecr_name"></a> [listopia\_parser\_ecr\_name](#output\_listopia\_parser\_ecr\_name) | n/a |
| <a name="output_s3_db_uri"></a> [s3\_db\_uri](#output\_s3\_db\_uri) | n/a |
| <a name="output_s3_site_bucket_id"></a> [s3\_site\_bucket\_id](#output\_s3\_site\_bucket\_id) | n/a |
| <a name="output_s3_site_bucket_regional_domain"></a> [s3\_site\_bucket\_regional\_domain](#output\_s3\_site\_bucket\_regional\_domain) | n/a |
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | n/a |
| <a name="output_sqs_url"></a> [sqs\_url](#output\_sqs\_url) | n/a |
<!-- END_TF_DOCS -->
