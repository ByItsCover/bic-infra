resource "aws_sqs_queue" "eventbridge_deadletter" {
  name                      = "eventbridge-queue"
  message_retention_seconds = var.sqs_deadletter_retention
}
