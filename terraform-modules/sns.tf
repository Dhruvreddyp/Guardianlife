provider "aws" {
  region = "us-east-1"
  profile = "accountB"
}

resource "aws_sns_topic" "topic" {
  name = "cross-account-topic"
}

resource "aws_sqs_queue" "queue" {
  name = "cross-account-queue"
}

resource "aws_sns_topic_subscription" "subscription" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.queue.arn

  depends_on = [
    aws_sqs_queue_policy.policy
  ]
}

resource "aws_sqs_queue_policy" "policy" {
  queue_url = aws_sqs_queue.queue.url

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action   = "SQS:SendMessage"
        Resource = aws_sqs_queue.queue.arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn" = aws_sns_topic.topic.arn
          }
        }
      }
    ]
  })
}

output "sns_topic_arn" {
  value = aws_sns_topic.topic.arn
}

output "sqs_queue_url" {
  value = aws_sqs_queue.queue.url
}
