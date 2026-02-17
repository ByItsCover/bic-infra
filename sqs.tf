resource "aws_sqs_queue" "embed_queue" {
  name = "embed-queue"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.embed_queue_deadletter.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "embed_queue_deadletter" {
  name = "embed-deadletter-queue"
}

resource "aws_sqs_queue_redrive_allow_policy" "embed_queue_redrive" {
  queue_url = aws_sqs_queue.embed_queue_deadletter.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.embed_queue.arn]
  })
}
