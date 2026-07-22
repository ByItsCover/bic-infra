resource "aws_efs_file_system" "rec_model" {
  creation_token = "rec-model"

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }
}


resource "aws_efs_mount_target" "rec_model" {
  for_each = data.aws_subnets.subnet.ids

  file_system_id  = aws_efs_file_system.rec_model.id
  subnet_id       = each.value
  security_groups = [aws_security_group.rec_efs.id]
}

resource "aws_efs_access_point" "rec_model" {
  file_system_id = aws_efs_file_system.rec_model.id

  posix_user {
    gid = 1000
    uid = 1000
  }

  root_directory {
    path = "/rec-model"
    creation_info {
      owner_gid   = 1000
      owner_uid   = 1000
      permissions = 755
    }
  }
}
