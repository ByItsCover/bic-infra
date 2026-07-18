/*
import {
  for_each = {
    for env in var.batch_envs : env.name => env
  }

  to = aws_ecs_cluster.spot_cluster[each.key]
  id = split("/", aws_batch_compute_environment.spot[each.key].ecs_cluster_arn)[1]
}
*/


data "aws_ssm_parameter" "image_id" {
  for_each = {
    for env in var.batch_envs : env.name => env
  }

  name = each.value.image_id
}

resource "aws_launch_template" "batch_launch_template" {
  for_each = data.aws_ssm_parameter.image_id

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.batch_ebs_size
    }
  }

  metadata_options {
    http_tokens                 = "required"
    http_put_response_hop_limit = 2
  }

  image_id = each.value.value
}

resource "aws_batch_compute_environment" "spot" {
  for_each = {
    for env in var.batch_envs : env.name => {
      prefix           = "${env.name}-${env.compute_type}-fleet-"
      instance_types   = env.instance_types
      compute_type     = env.compute_type
      template_id      = aws_launch_template.batch_launch_template[env.name].id
      template_version = aws_launch_template.batch_launch_template[env.name].latest_version
    }
  }

  name_prefix = each.value.prefix

  compute_resources {
    allocation_strategy = "SPOT_CAPACITY_OPTIMIZED"

    instance_role = aws_iam_instance_profile.ecs_instance_role.arn
    instance_type = each.value.instance_types


    max_vcpus     = var.max_batch_vcpus
    min_vcpus     = 0
    desired_vcpus = 0

    security_group_ids = [
      aws_security_group.batch.id
    ]

    subnets = data.aws_subnets.subnet.ids

    type = each.value.compute_type

    launch_template {
      launch_template_id = each.value.template_id
      version            = each.value.template_version
    }
  }

  service_role = aws_iam_role.batch_service_role.arn
  type         = "MANAGED"
}

/*
resource "aws_ecs_cluster" "spot_cluster" {
  for_each = aws_batch_compute_environment.spot

  name = split("/", each.value.ecs_cluster_arn)[1]

  setting {
    name  = "containerInsights"
    value = "enhanced"
  }
}
*/

resource "aws_batch_job_queue" "queue" {
  for_each = {
    for env in var.batch_envs : env.name => {
      queue_name      = "${env.name}-queue"
      compute_env_arn = aws_batch_compute_environment.spot[env.name].arn
    }
  }

  name     = each.value.queue_name
  state    = "ENABLED"
  priority = "1"

  compute_environment_order {
    order               = 1
    compute_environment = each.value.compute_env_arn
  }

  lifecycle {
    replace_triggered_by = [
      aws_batch_compute_environment.spot[each.key].id
    ]
  }
}
