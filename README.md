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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.recommend_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_stage.recommend_stage](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_batch_compute_environment.spot](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_compute_environment) | resource |
| [aws_batch_job_queue.queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/batch_job_queue) | resource |
| [aws_cloudfront_cache_policy.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_cache_policy) | resource |
| [aws_cloudfront_origin_access_control.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_control) | resource |
| [aws_cloudfront_origin_request_policy.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_request_policy) | resource |
| [aws_cloudfront_response_headers_policy.cdn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy) | resource |
| [aws_cognito_user_pool.auth_pool](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |
| [aws_ecr_lifecycle_policy.embed_server_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.learn_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.library_search_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.listopia_parser_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_lifecycle_policy.suggest_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.embed_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.learn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.library_search](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.listopia_parser](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository.suggest](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecs_cluster.spot_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |
| [aws_efs_access_point.rec_model](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_access_point) | resource |
| [aws_efs_file_system.rec_model](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.rec_model](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_iam_instance_profile.ecs_instance_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.batch_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.ecs_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.scheduler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ecs_sqs_message_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.lambda_sqs_message_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.scheduler_batch_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.batch_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecs_ssm_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_function_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_s3_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_secrets_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_sqs_execute_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.batch_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_s3_bucket.cover_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.s3_allow_full_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.site_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_website_configuration.bic_site](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_s3_object.coverdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_secretsmanager_secret.hardcover_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.hardcover_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.batch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rec_efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_sqs_queue.embed_queue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.embed_queue_deadletter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_redrive_allow_policy.embed_queue_redrive](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |
| [aws_vpc_security_group_egress_rule.batch_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.rec_efs_egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.rec_efs_ingress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_ecr_lifecycle_policy_document.expiry_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_lifecycle_policy_document) | data source |
| [aws_iam_policy_document.batch_service_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_function_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.s3_full_access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.scheduler_batch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.scheduler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sqs_message_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.image_id](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_subnets.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_batch_ebs_size"></a> [batch\_ebs\_size](#input\_batch\_ebs\_size) | EBS Volume size for Batch | `number` | `50` | no |
| <a name="input_batch_envs"></a> [batch\_envs](#input\_batch\_envs) | List of Batch compute environment configurations | <pre>list(<br/>    object({<br/>      name             = string<br/>      allocation_strat = string<br/>      instance_types   = list(string)<br/>      compute_type     = string<br/>      image_id         = string<br/>    })<br/>  )</pre> | n/a | yes |
| <a name="input_cover_bucket_name"></a> [cover\_bucket\_name](#input\_cover\_bucket\_name) | AWS S3 Cover bucket name | `string` | n/a | yes |
| <a name="input_cover_db_folder_name"></a> [cover\_db\_folder\_name](#input\_cover\_db\_folder\_name) | AWS S3 Cover DB folder name | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name for site | `string` | n/a | yes |
| <a name="input_email_req"></a> [email\_req](#input\_email\_req) | Requirements for site user emails | <pre>object({<br/>    min_length = number<br/>    max_length = number<br/>  })</pre> | <pre>{<br/>  "max_length": 254,<br/>  "min_length": 6<br/>}</pre> | no |
| <a name="input_hardcover_api_key"></a> [hardcover\_api\_key](#input\_hardcover\_api\_key) | The HardCover API Key | `string` | n/a | yes |
| <a name="input_hardcover_key_name"></a> [hardcover\_key\_name](#input\_hardcover\_key\_name) | Name of the HardCover key secret | `string` | `"hardcover-key"` | no |
| <a name="input_learn_batch_name"></a> [learn\_batch\_name](#input\_learn\_batch\_name) | Batch env name for Learn batch job and queue | `string` | n/a | yes |
| <a name="input_max_batch_vcpus"></a> [max\_batch\_vcpus](#input\_max\_batch\_vcpus) | Maximum EC2 VCPUs a Batch job can use | `number` | `64` | no |
| <a name="input_password_req"></a> [password\_req](#input\_password\_req) | Requirements for site user passwords | <pre>object({<br/>    min_length  = number<br/>    req_upper   = bool<br/>    req_lower   = bool<br/>    req_numbers = bool<br/>    req_symbols = bool<br/>  })</pre> | n/a | yes |
| <a name="input_site_bucket_index_doc"></a> [site\_bucket\_index\_doc](#input\_site\_bucket\_index\_doc) | Index document file name within site S3 bucket | `string` | `"index.html"` | no |
| <a name="input_site_bucket_name"></a> [site\_bucket\_name](#input\_site\_bucket\_name) | AWS S3 BIC Site bucket name | `string` | n/a | yes |
| <a name="input_sqs_deadletter_retention"></a> [sqs\_deadletter\_retention](#input\_sqs\_deadletter\_retention) | SQS deadletter queue message retention in seconds | `number` | `345600` | no |
| <a name="input_sqs_visibility_timeout"></a> [sqs\_visibility\_timeout](#input\_sqs\_visibility\_timeout) | SQS message timeout in seconds | `number` | `180` | no |
| <a name="input_uid_req"></a> [uid\_req](#input\_uid\_req) | Requirements for site user id | <pre>object({<br/>    min_length = number<br/>    max_length = number<br/><br/>  })</pre> | <pre>{<br/>  "max_length": 36,<br/>  "min_length": 36<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gw_arn"></a> [api\_gw\_arn](#output\_api\_gw\_arn) | n/a |
| <a name="output_api_gw_id"></a> [api\_gw\_id](#output\_api\_gw\_id) | n/a |
| <a name="output_auth_user_pool_endpoint"></a> [auth\_user\_pool\_endpoint](#output\_auth\_user\_pool\_endpoint) | n/a |
| <a name="output_auth_user_pool_id"></a> [auth\_user\_pool\_id](#output\_auth\_user\_pool\_id) | n/a |
| <a name="output_cf_access_control_id"></a> [cf\_access\_control\_id](#output\_cf\_access\_control\_id) | n/a |
| <a name="output_cf_cache_policy_id"></a> [cf\_cache\_policy\_id](#output\_cf\_cache\_policy\_id) | n/a |
| <a name="output_cf_request_policy_id"></a> [cf\_request\_policy\_id](#output\_cf\_request\_policy\_id) | n/a |
| <a name="output_cf_response_policy_id"></a> [cf\_response\_policy\_id](#output\_cf\_response\_policy\_id) | n/a |
| <a name="output_ecs_execution_role_arn"></a> [ecs\_execution\_role\_arn](#output\_ecs\_execution\_role\_arn) | n/a |
| <a name="output_embed_server_ecr_name"></a> [embed\_server\_ecr\_name](#output\_embed\_server\_ecr\_name) | n/a |
| <a name="output_hardcover_secret_arn"></a> [hardcover\_secret\_arn](#output\_hardcover\_secret\_arn) | n/a |
| <a name="output_hardcover_secret_name"></a> [hardcover\_secret\_name](#output\_hardcover\_secret\_name) | n/a |
| <a name="output_lambda_function_role_arn"></a> [lambda\_function\_role\_arn](#output\_lambda\_function\_role\_arn) | n/a |
| <a name="output_learn_batch_queue_arn"></a> [learn\_batch\_queue\_arn](#output\_learn\_batch\_queue\_arn) | n/a |
| <a name="output_learn_ecr_name"></a> [learn\_ecr\_name](#output\_learn\_ecr\_name) | n/a |
| <a name="output_library_search_ecr_name"></a> [library\_search\_ecr\_name](#output\_library\_search\_ecr\_name) | n/a |
| <a name="output_listopia_parser_ecr_name"></a> [listopia\_parser\_ecr\_name](#output\_listopia\_parser\_ecr\_name) | n/a |
| <a name="output_rec_efs_access_arn"></a> [rec\_efs\_access\_arn](#output\_rec\_efs\_access\_arn) | n/a |
| <a name="output_rec_efs_access_id"></a> [rec\_efs\_access\_id](#output\_rec\_efs\_access\_id) | n/a |
| <a name="output_rec_efs_system_id"></a> [rec\_efs\_system\_id](#output\_rec\_efs\_system\_id) | n/a |
| <a name="output_recommend_url"></a> [recommend\_url](#output\_recommend\_url) | n/a |
| <a name="output_s3_db_uri"></a> [s3\_db\_uri](#output\_s3\_db\_uri) | n/a |
| <a name="output_s3_site_bucket_id"></a> [s3\_site\_bucket\_id](#output\_s3\_site\_bucket\_id) | n/a |
| <a name="output_s3_site_bucket_regional_domain"></a> [s3\_site\_bucket\_regional\_domain](#output\_s3\_site\_bucket\_regional\_domain) | n/a |
| <a name="output_scheduler_role_arn"></a> [scheduler\_role\_arn](#output\_scheduler\_role\_arn) | n/a |
| <a name="output_sqs_arn"></a> [sqs\_arn](#output\_sqs\_arn) | n/a |
| <a name="output_sqs_url"></a> [sqs\_url](#output\_sqs\_url) | n/a |
| <a name="output_suggest_ecr_name"></a> [suggest\_ecr\_name](#output\_suggest\_ecr\_name) | n/a |
<!-- END_TF_DOCS -->
